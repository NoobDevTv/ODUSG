import 'dart:async';
import 'dart:math';

import 'package:odusg/conditions/win_condition.dart';
import 'package:odusg/events/tags.dart';
import 'package:odusg/extensions.dart';
import 'package:odusg/models/player.dart';
import 'package:odusg/models/roles.dart';
import 'package:odusg/widgets/player_name_list.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'game_logic.g.dart';

@Riverpod(keepAlive: true)
Random random(RandomRef ref) {
  return Random();
}

@riverpod
Player? nextPlayer(NextPlayerRef ref) {
  return ref.read(playerManagerProvider.notifier)._getNextPlayer();
}

@riverpod
class PlayerManager extends _$PlayerManager {
  int _playerIndex = 0;

  @override
  List<Player> build() {
    final names = ref.read(playerNamesProvider);
    names.shuffle();
    var bads = (names.length / 2 - 1);
    final random = ref.read(randomProvider);

    List<int> badsIndx = [];
    for (var i = 0; i < bads; i++) {
      final newBadI = random.nextInt(names.length);
      if (badsIndx.contains(newBadI)) {
        i--;
      } else {
        badsIndx.add(newBadI);
      }
    }

    return names.mapIndexed((x, i) {
      final keyWords = [x, "$x 1", "$x 2", "$x 3", "$x 4"];
      keyWords.shuffle();
      final role = badsIndx.contains(i) ? Role.bad : Role.good;
      return Player(
          name: x,
          role: role,
          keyWord: x,
          keyWordSet: keyWords,
          tags: Tags([role.toString(), x, DefaultWinCondition.tag]));
    }).toList();
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
Stream<int> ticker(TickerRef ref, Duration period, Duration duration) async* {
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
