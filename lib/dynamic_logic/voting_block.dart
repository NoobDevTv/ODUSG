import 'package:dart_mappable/dart_mappable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/dynamic_logic/block.dart';
import 'package:odusg/dynamic_logic/block_types.dart';
import 'package:odusg/events/tags.dart';

part 'voting_block.mapper.dart';

@MappableClass(includeSubClasses: [PlayerVotingBlock])
abstract class VotingBlock extends Block with VotingBlockMappable {
  final int minMultiselect;
  final int maxMultiselect;
  final Tags setTags;
  const VotingBlock({
    this.minMultiselect = 1,
    this.maxMultiselect = 1,
    required this.setTags,
    required super.text,
    super.cover,
    super.foreachPlayer,
    super.perTagText,
  });

  List<String> getPossibilities(WidgetRef ref);

  void finish(WidgetRef ref, String value);
}
