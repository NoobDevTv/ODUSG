import 'package:dart_mappable/dart_mappable.dart';
import 'package:odusg/dynamic_logic/block.dart';

part 'timer_block.mapper.dart';

@MappableClass()
class TimerBlock extends Block with TimerBlockMappable {
  final Duration minTimer;
  final Duration maxTimer;

  const TimerBlock({
    required this.minTimer,
    required this.maxTimer,
    required super.text,
    super.cover,
    super.foreachPlayer,
    super.perTagText,
  });
}
