import 'package:dart_mappable/dart_mappable.dart';
import 'package:odusg/dynamic_logic/block.dart';
import 'package:odusg/dynamic_logic/block_types.dart';
import 'package:odusg/dynamic_logic/tag_condition.dart';
import 'package:odusg/events/tags.dart';
import 'package:odusg/game_logic.dart';
import 'package:odusg/helpers/iterable_extensions.dart';
import 'package:odusg/main.dart';

part 'change_tag_block.mapper.dart';

@MappableClass(discriminatorValue: "ChangeTagBlock")
class ChangeTagBlock extends Block with ChangeTagBlockMappable {
  final TagFilter? affectedPlayers;
  final List<Tag> tags;
  final bool remove;

  const ChangeTagBlock({
    super.text = "",
    this.affectedPlayers,
    required this.tags,
    this.remove = false,
    super.cover = false,
    super.foreachPlayer = false,
    super.perTagText = const {},
    super.image
  });

  void act() {
    final ref = GlobalRef.globalRef;
    final gameTags = tags.where((x) => x.tagType == TagType.global).toList();
    final gameNotifier = ref.read(gameManagerProvider.notifier);
    if (gameTags.isNotEmpty) {
      if (remove) {
        gameNotifier.gameTags.tags.removeElements(gameTags);
      } else {
        gameNotifier.gameTags.tags.addAll(gameTags);
      }
    }

    final playerTags = tags.where((x) => x.tagType == TagType.player).toList();
    if (playerTags.isNotEmpty) {
      if (affectedPlayers != null) {
        final affected = affectedPlayers!.evaluatePlayers(
          ref.read(playerManagerProvider),
        );
        for (var element in affected) {
          if (remove) {
            element.tags.tags.removeElements(playerTags);
          } else {
            element.tags.tags.addAll(playerTags);
          }
        }
      }
    }
    ref.read(advancingProvider.notifier).advance();
  }
}
