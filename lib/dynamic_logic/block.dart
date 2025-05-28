import 'package:dart_mappable/dart_mappable.dart';
import 'package:odusg/dynamic_logic/block_types.dart';

part 'block.mapper.dart';

@MappableClass(
  includeSubClasses: [
    ChangeTagBlock,
    NextButtonBlock,
    VotingBlock,
    TimerBlock,
    EventInfoBlock,
  ],
)
class Block with BlockMappable {
  final String text;
  final bool cover;
  final bool foreachPlayer;
  final Map<String, String> perTagText;

  const Block({
    required this.text,
    this.cover = false,
    this.foreachPlayer = false,
    this.perTagText = const {},
  });
}
