import 'package:dart_mappable/dart_mappable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/dynamic_logic/change_tag_block.dart';
import 'package:odusg/dynamic_logic/next_button_block.dart';
import 'package:odusg/dynamic_logic/player_voting_block.dart';
import 'package:odusg/dynamic_logic/tag_condition.dart';
import 'package:odusg/dynamic_logic/timer_block.dart';
import 'package:odusg/dynamic_logic/voting_block.dart';
import 'package:odusg/events/tags.dart';
import 'package:odusg/game_logic.dart';
import 'package:odusg/helpers/iterable_extensions.dart';
import 'package:odusg/main.dart';
import 'package:odusg/mappers/duration_mapper.dart';

part 'block.mapper.dart';

@MappableClass()
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
