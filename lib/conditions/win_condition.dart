import 'package:flutter/material.dart';
import 'package:odusg/events/tags.dart';
import 'package:odusg/models/player.dart';
import 'package:odusg/models/roles.dart';

const winConditions = [
  DefaultWinCondition(),
  WantsToLooseCondition(),
  MostVotesCondition()
];

abstract class WinCondition {
  static const String basetag = "wincondition.";

  final Tag winConditionTag;

  const WinCondition(this.winConditionTag);

  @mustCallSuper
  bool matched(Map<Player, int> votedPlayers, Player player) {
    return player.tags.contains(winConditionTag);
  }
}

class DefaultWinCondition extends WinCondition {
  static const tag = Tag("${WinCondition.basetag}default");

  const DefaultWinCondition() : super(tag);

  @override
  bool matched(Map<Player, int> votedPlayers, Player player) {
    if (!super.matched(votedPlayers, player)) return false;

    final maxVotes = votedPlayers.values.reduce((a, b) => a > b ? a : b);
    final playersWithMaxVotes =
        votedPlayers.entries.where((x) => x.value == maxVotes).toList();

    if (playersWithMaxVotes.length > 1) {
      return player.tags.contains(Tag(Role.bad.toString()));
    }

    final tags = playersWithMaxVotes.first.key.tags;

    return (tags.contains(Tag(Role.bad.toString())) &&
            player.tags.contains(Tag(Role.good.toString()))) ||
        (!tags.contains(Tag(Role.bad.toString())) &&
            player.tags.contains(Tag(Role.bad.toString())));
  }
}

class WantsToLooseCondition extends WinCondition {
  static const tag = Tag("${WinCondition.basetag}loose");

  const WantsToLooseCondition() : super(tag);

  @override
  bool matched(Map<Player, int> votedPlayers, Player player) {
    if (!super.matched(votedPlayers, player)) return false;
    final maxVotes = votedPlayers.values.reduce((a, b) => a > b ? a : b);
    return votedPlayers.entries
        .any((x) => x.value == maxVotes && x.key == player);
  }
}

class MostVotesCondition extends WinCondition {
  static const tag = Tag("${WinCondition.basetag}MostVotes");

  const MostVotesCondition() : super(tag);

  @override
  bool matched(Map<Player, int> votedPlayers, Player player) {
    if (!super.matched(votedPlayers, player)) return false;
    final maxVotes = votedPlayers.values.reduce((a, b) => a > b ? a : b);
    return votedPlayers.entries
        .any((x) => x.value == maxVotes && x.key == player);
  }
}
