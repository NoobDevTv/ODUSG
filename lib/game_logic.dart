import 'dart:async';
import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/current_scenario.dart';
import 'package:odusg/dynamic_logic/step.dart';
import 'package:odusg/events/tags.dart';
import 'package:odusg/helpers/iterable_extensions.dart';
import 'package:odusg/models/player.dart';
import 'package:odusg/models/roles.dart';
import 'package:odusg/models/scenario.dart';
import 'package:odusg/widgets/player_name_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_logic.g.dart';

@Riverpod(keepAlive: true)
Random random(Ref ref) {
  return Random();
}

@riverpod
Player? nextPlayer(Ref ref) {
  return ref.read(playerManagerProvider.notifier)._getNextPlayer();
}

@Riverpod(keepAlive: true)
class GameManager extends _$GameManager {
  late List<Step> _steps;
  late int _currentStepIdx;
  Map<String, dynamic> _allCurrentTags = {};
  Tags gameTags = Tags.mutable([]);

  Map<String, dynamic> get currentTags => _allCurrentTags;

  late final List<Player> _players;
  Step build() {
    _steps = ref.watch(currentScenarioProvider).steps;
    _currentStepIdx = 0;
    _players = ref.watch(playerManagerProvider);
    gameTags.tags.clear();
    return _steps[_currentStepIdx];
  }

  void advance() {
    //TODO Multi Player Advancing (Same Step for all matching players)

    //TODO Overflow check
    //TODO Endless Loop Check (No Step matched)
    _currentStepIdx = (_currentStepIdx + 1) % _steps.length;

    var step = _steps[_currentStepIdx];
    while (!getEntryGuardEvaluation(step)) {
      _currentStepIdx = (_currentStepIdx + 1) % _steps.length;
      step = _steps[_currentStepIdx];
    }
    state = step;
  }

  bool getEntryGuardEvaluation(Step step) {
    final allTags = step.filter.getTagMap(_players, getCompleteTags());
    final didMatch = step.entryGuard.evaluate(allTags);
    _allCurrentTags.clear();
    if (didMatch) {
      final tagVals = allTags.keys.map((x) {
        final lastPoint = x.lastIndexOf('.');
        return (
          x.substring(0, lastPoint).replaceAll('.', '_'),
          x.substring(lastPoint + 1)
        );
      });

      for (var element in tagVals) {
        final curVal = _allCurrentTags[element.$1];
        if (curVal == null) {
          _allCurrentTags[element.$1] = element.$2;
        } else if (curVal is String) {
          _allCurrentTags[element.$1] = [curVal, element.$2];
        } else if (curVal is List<String>) {
          curVal.add(element.$2);
        }
      }
    }
    return didMatch;
  }

  List<Tag> getCompleteTags() {
    return gameTags.asStringList().map((x) => Tag("game.$x")).toList();
  }
}

@riverpod
class PlayerManager extends _$PlayerManager {
  int _playerIndex = 0;

  @override
  List<Player> build() {
    final names = ref.read(playerNamesProvider);
    names.shuffle();
    final scenario = ref.watch(currentScenarioProvider);
    if (scenario.type == ScenarioType.none) return [];
    final roles = scenario.roles.toList();
    roles.sort((a, b) => b.priority.compareTo(a.priority));
    List<(String, int)> rolesBucket = [];
    // Map<String, (int, bool)> rolesToAssign = {};
    final random = ref.read(randomProvider);

    for (var element in roles) {
      final (minA, maxA) = element.getAssignableAmount(names.length);
      for (var i = 0; i < minA; i++) {
        rolesBucket.add((element.tag, 1 << 16 | element.priority));
      }
      final upTo = maxA - minA;
      if (upTo == 0) continue;
      final addAdditional = random.nextInt(upTo);
      for (var i = 0; i < addAdditional; i++) {
        rolesBucket.add((element.tag, element.priority));
      }
    }
    rolesBucket.shuffle(random);
    rolesBucket.sort((x, y) => x.$2.compareTo(y.$2));
    final defRole = (roles.firstOrDefault((x) => x.isDefault)?.tag, 0);

    List<Player> ret = [];
    for (var name in names) {
      final keyWords = [name, "$name 1", "$name 2", "$name 3", "$name 4"];
      final roleForUser =
          rolesBucket.isEmpty ? defRole : rolesBucket.removeAt(0);
      ret.add(
        Player(
          name: name,
          role: Role.undefined,
          keyWord: name,
          keyWordSet: keyWords,
          tags: Tags(
            [
              Tag("role.${roleForUser.$1!}"),
              Tag("name.$name"),
            ],
          ),
        ),
      );
    }

    scenario.preparePlayers(ret);
    ret.shuffle(random);
    return ret;
  }

  void reorder() {
    final newOrder = state.toList();
    newOrder.shuffle();
    state = newOrder;
    _playerIndex = 0;
  }

  Player? _getNextPlayer() {
    print("Next Player Call: Cur Index. $_playerIndex");
    if (_playerIndex >= state.length) {
      _playerIndex = 0;
      return null;
    }

    return state[_playerIndex++];
  }
}

@riverpod
Stream<int> ticker(Ref ref, Duration period, Duration duration) async* {
  final tickUntil = DateTime.timestamp().add(duration);
  yield tickUntil.difference(DateTime.timestamp()).inSeconds;

  await for (final _ in Stream.periodic(period)) {
    final diff = tickUntil.difference(DateTime.timestamp());
    if (diff.isNegative) {
      yield -1;
      break;
    }
    yield diff.inSeconds;
  }
}

enum GameState {
  roleAssignment(0),
  main(1),
  voting(2),
  end(3);

  const GameState(this.value);

  factory GameState.fromValue(int value) {
    return GameState.values[value];
  }

  final int value;
}

@riverpod
class GameStateMachine extends _$GameStateMachine {
  int _currentState = 0;

  @override
  GameState build() {
    final nextPlayer = ref.watch(nextPlayerProvider);
    if (nextPlayer == null) {
      _currentState++;
    }
    return GameState.fromValue(_currentState);
  }

  void advance() {
    ref.read(playerManagerProvider.notifier).reorder();
    state = GameState.fromValue(++_currentState);
  }

  GameState advanceTo(GameState newState) {
    if (newState.value <= _currentState) {
      return GameState.fromValue(_currentState);
    }
    _currentState = newState.value;
    ref.read(playerManagerProvider.notifier).reorder();
    return state = newState;
  }
}

@riverpod
class VotingManager extends _$VotingManager {
  @override
  Map<Player, int> build() {
    final players = ref.watch(playerManagerProvider);
    return players.map((x) => {x: 0}).reduce(
      (value, element) {
        value.addAll(element);
        return value;
      },
    );
  }

  void voteForPlayer(Player player) {
    Map<Player, int> newState = {};
    newState.addAll(state);

    if (newState.containsKey(player)) {
      final voting = newState[player]!;
      newState[player] = voting + 1;
    }
    state = newState;
  }
}
