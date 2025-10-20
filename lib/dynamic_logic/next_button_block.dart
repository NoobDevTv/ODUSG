import 'package:dart_mappable/dart_mappable.dart';
import 'package:odusg/dynamic_logic/block.dart';

part 'next_button_block.mapper.dart';

@MappableClass()
class NextButtonBlock extends Block with NextButtonBlockMappable {
  final bool endsGame;
  final String buttonText;
  const NextButtonBlock({
    required this.endsGame,
    required super.text,
    this.buttonText = "Next",
    super.cover,
    super.foreachPlayer,
    super.perTagText,
    super.image,
  });
}
