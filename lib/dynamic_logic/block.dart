import 'package:dart_mappable/dart_mappable.dart';
import 'package:odusg/dynamic_logic/block_types.dart';
import 'package:odusg/dynamic_logic/single_child_executor_block.dart';

part 'block.mapper.dart';

@MappableClass(
  includeSubClasses: [
    ChangeTagBlock,
    NextButtonBlock,
    VotingBlock,
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

  const Block({
    required this.text,
    this.cover = false,
    this.foreachPlayer = false,
    this.perTagText = const {},
  });
}
