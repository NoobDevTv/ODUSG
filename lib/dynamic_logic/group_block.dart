import 'package:dart_mappable/dart_mappable.dart';
import 'package:odusg/dynamic_logic/block.dart';
import 'package:odusg/dynamic_logic/step.dart';

part 'group_block.mapper.dart';

@MappableClass()
class GroupBlock extends Block with GroupBlockMappable {
  final List<Step> steps;

  const GroupBlock({
    required super.text,
    required this.steps,
    super.cover = false,
    super.foreachPlayer = false,
    super.perTagText = const {},
    super.image,
  });
}
