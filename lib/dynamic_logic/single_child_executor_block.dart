import 'package:dart_mappable/dart_mappable.dart';
import 'package:odusg/dynamic_logic/block_types.dart';
import 'package:odusg/dynamic_logic/step.dart';

part 'single_child_executor_block.mapper.dart';

@MappableClass()
class SingleChildExecutorBlock extends Block
    with SingleChildExecutorBlockMappable {
  final List<Step> steps;
  final bool randomOrder;
  final bool removeExecuted;
  final bool refillWhenEmpty;

  const SingleChildExecutorBlock({
    required super.text,
    super.cover = false,
    super.foreachPlayer = false,
    super.perTagText = const {},
    required this.steps,
    required this.randomOrder,
    required this.refillWhenEmpty,
    required this.removeExecuted,
    super.image,
    super.ttsMessage,
  });
}
