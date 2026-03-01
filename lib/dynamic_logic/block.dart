import 'package:dart_mappable/dart_mappable.dart';
import 'package:odusg/dynamic_logic/block_types.dart';

part 'block.mapper.dart';

@MappableClass(
  includeSubClasses: [
    ChangeTagBlock,
    NextButtonBlock,
    VotingBlock,
    // PlayerVotingBlock, ChoiceVotingBlock inside VotingBlock
    TimerBlock,
    GroupBlock,
    SingleChildExecutorBlock,
  ],
)
class Block with BlockMappable {
  final String text;
  final bool cover;
  final bool foreachPlayer;
  final Map<String, String> perTagText;
  final String? image;
  final String? ttsMessage;
  final bool optional;

  const Block({
    required this.text,
    this.cover = false,
    this.foreachPlayer = false,
    this.perTagText = const {},
    this.image,
    this.ttsMessage,
    this.optional = false,
  });
}
