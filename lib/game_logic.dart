import 'dart:async';
import 'dart:collection';
import 'dart:math';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/current_scenario.dart';
import 'package:odusg/dynamic_logic/block_types.dart';
import 'package:odusg/dynamic_logic/step.dart';
import 'package:odusg/events/tags.dart';
import 'package:odusg/special_states/group_blocks.dart';
import 'package:odusg/helpers/iterable_extensions.dart';
import 'package:odusg/models/player.dart';
import 'package:odusg/models/roles.dart';
import 'package:odusg/special_states/single_execution_blocks.dart';
import 'package:odusg/widgets/player_name_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_logic.g.dart';

@Riverpod(keepAlive: true)
class Advancing extends _$Advancing {
  // List<GroupBlockStep>? _groupBlocks;

  @override
  void build() {
    // _groupBlocks = ref.watch(groupBlocksProvider);

    return;
  }

  void advance() {
    ref.read(gameManagerProvider.notifier).advance();
    // final groupBlocks = _groupBlocks;
    // if (groupBlocks == null || groupBlocks.isEmpty) {
    // } else {
    //   ref.read(groupBlocksProvider.notifier).advanceCurrent();
    // }
  }
}

@Riverpod(keepAlive: true)
Random random(Ref ref) {
  return Random();
}

@riverpod
Player? nextPlayer(Ref ref) {
  return ref.read(playerManagerProvider.notifier)._getNextPlayer();
}

class _GameStep {
  _GameStep(this.step, this.persistant, this.copy);
  final Step step;
  final bool persistant;
  final bool copy;
}

@Riverpod(keepAlive: true)
class GameManager extends _$GameManager {
  late Queue<_GameStep> _steps;
  final Map<String, dynamic> _allCurrentTags = {};
  Tags gameTags = Tags.mutable([]);

  Map<String, dynamic> get currentTags => _allCurrentTags;

  late List<Player> _players;
  @override
  Step build() {
    _steps = Queue<_GameStep>.from(
      ref
          .watch(currentScenarioProvider)
          .steps
          .map((x) => _GameStep(x, true, false)),
    );
    _players = ref.watch(playerManagerProvider);
    gameTags.tags.clear();
    return _steps.first.step;
  }

  void advance() {
    //TODO Multi Player Advancing (Same Step for all matching players)

    //TODO Overflow check
    // final old = _steps.removeFirst();
    // if (old.persistant) {
    //   _steps.add(old);
    // }
    _GameStep? step;
    do {
      if (false) //TODO Endless Loop Check
        return; //TODO End game or/and throw an error
      step = _steps.removeFirst();
      if (step.persistant) _steps.add(step);
      if (!getEntryGuardEvaluation(step.step)) {
        continue;
      }
      final block = step.step.block;
      if (block.foreachPlayer && !step.copy) {
        for (var i = 0; i < _players.length; i++) {
          _steps.addFirst(_GameStep(step.step, false, true));
        }
      }
      // final groupBlock = ref.read(groupBlocksProvider);
      // if (groupBlock.isNotEmpty) {
      //   final last = groupBlock.last;
      //   step = last.$1.steps[last.$2];
      // }
      if (block is GroupBlock) {
        for (var element in block.steps.reversed) {
          _steps.addFirst(_GameStep(element, false, false));
        }
        step = null;
        continue;
      } else if (block is SingleChildExecutorBlock) {
        final newChild = ref
            .read(singleExecutionBlocksProvider.notifier)
            .advance(block);
        if (newChild == null) {
          step = null;
          continue;
        }
        step = _GameStep(newChild, false, false);
      }
    } while (step == null);

    state = step.step;
  }

  bool getEntryGuardEvaluation(Step step) {
    final allTags = step.filter.getTagMap(_players, gameTags.tags);
    final didMatch = step.entryGuard.evaluate(allTags);
    _allCurrentTags.clear();
    if (didMatch) {
      final tagVals = allTags.keys.map((x) {
        final lastPoint = x.lastIndexOf('.');
        return (
          x.substring(0, lastPoint).replaceAll('.', '_'),
          x.substring(lastPoint + 1),
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
    return gameTags
        .asStringList()
        .map((x) => Tag(x, tagType: TagType.global))
        .toList();
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
    if (scenario.title.isEmpty) return [];
    final roles = scenario.roles.toList();
    roles.sort((a, b) => b.priority.compareTo(a.priority));
    List<(String, int)> rolesBucket = [];
    // Map<String, (int, bool)> rolesToAssign = {};
    final random = ref.read(randomProvider);

    for (var element in roles) {
      if (element.isDefault) continue;

      final (_, minA, maxA) = element.getAssignableAmount.firstWhere(
        (x) => x.$1 >= names.length,
        orElse: () => element.getAssignableAmount.last,
      );
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
          tags: Tags([
            Tag(roleForUser.$1!, tagType: TagType.role),
            Tag(name, tagType: TagType.name),
          ]),
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
    return players.map((x) => {x: 0}).reduce((value, element) {
      value.addAll(element);
      return value;
    });
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
