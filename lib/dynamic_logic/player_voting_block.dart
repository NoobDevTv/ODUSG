import 'package:dart_mappable/dart_mappable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/dynamic_logic/block.dart';
import 'package:odusg/dynamic_logic/tag_condition.dart';
import 'package:odusg/dynamic_logic/voting_block.dart';
import 'package:odusg/events/tags.dart';
import 'package:odusg/game_logic.dart';

part 'player_voting_block.mapper.dart';

@MappableClass(discriminatorValue: "PlayerVotingBlock")
class PlayerVotingBlock extends VotingBlock with PlayerVotingBlockMappable {
  final TagFilter votingTargetPossibilities;

  const PlayerVotingBlock({
    required this.votingTargetPossibilities,
    super.minMultiselect = 1,
    super.maxMultiselect = 1,
    required super.setTags,
    required super.text,
    super.cover,
    super.foreachPlayer,
    super.perTagText,
  });

  @override
  List<String> getPossibilities(WidgetRef ref) {
    final players = ref.read(playerManagerProvider);
    return votingTargetPossibilities
        .evaluatePlayers(players)
        .map((x) => x.name)
        .toList();
  }

  @override
  void finish(WidgetRef ref, String value) {
    final players = ref.read(playerManagerProvider);
    final player = players.firstWhere((x) => x.name == value);
    player.tags.tags.addAll(setTags.tags);
  }
}
