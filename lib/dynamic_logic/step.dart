import 'package:odusg/dynamic_logic/block.dart';
import 'package:odusg/dynamic_logic/tag_condition.dart';

class Step {
  final String name;
  final TagFilter filter;
  final TagCondition entryGuard;
  final Block block;

  const Step(
    this.name,
    this.entryGuard,
    this.block, {
    this.filter = TagFilter.empty,
  });
}
