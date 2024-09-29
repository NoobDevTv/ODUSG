import 'package:flutter/material.dart';
import 'package:odusg/models/player.dart';
import 'package:odusg/models/roles.dart';

const winConditions = [DefaultWinCondition(), WantsToLooseCondition()];

abstract class WinCondition {
  static const String basetag = "wincondition.";

  final String winConditionTag;

  const WinCondition(this.winConditionTag);

  @mustCallSuper
  bool matched(Map<Player, int> votedPlayers, Player player) {
    return player.tags.contains(winConditionTag);
  }
}

class DefaultWinCondition extends WinCondition {
  static const String tag = "${WinCondition.basetag}default";

  const DefaultWinCondition() : super(tag);

  @override
  bool matched(Map<Player, int> votedPlayers, Player player) {
    if (!super.matched(votedPlayers, player)) return false;

    final maxVotes = votedPlayers.values.reduce((a, b) => a > b ? a : b);
    final playersWithMaxVotes =
        votedPlayers.entries.where((x) => x.value == maxVotes).toList();

    if (playersWithMaxVotes.length > 1) {
      return player.tags.contains(Role.bad.toString());
    }

    final tags = playersWithMaxVotes.first.key.tags;

    return (tags.contains(Role.bad.toString()) &&
            player.tags.contains(Role.good.toString())) ||
        (!tags.contains(Role.bad.toString()) &&
            player.tags.contains(Role.bad.toString()));
  }
}

class WantsToLooseCondition extends WinCondition {
  static const String tag = "${WinCondition.basetag}loose";

  const WantsToLooseCondition() : super(tag);

  @override
  bool matched(Map<Player, int> votedPlayers, Player player) {
    if (!super.matched(votedPlayers, player)) return false;
    final maxVotes = votedPlayers.values.reduce((a, b) => a > b ? a : b);
    return votedPlayers.entries
        .any((x) => x.value == maxVotes && x.key == player);
  }
}
