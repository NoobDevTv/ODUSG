import 'package:dart_mappable/dart_mappable.dart';
import 'package:odusg/dynamic_logic/block.dart';
import 'package:odusg/dynamic_logic/tag_condition.dart';
import 'package:uuid/uuid.dart';

part 'step.mapper.dart';

@MappableClass()
class Step with StepMappable {
  final String uid;
  final String name;
  final TagFilter filter;
  final TagCondition entryGuard;
  final Block block;

  Step(this.name, this.entryGuard, this.block, {this.filter = TagFilter.empty})
    : uid = const Uuid().v7();
}
