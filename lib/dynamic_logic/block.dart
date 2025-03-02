import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/dynamic_logic/tag_condition.dart';
import 'package:odusg/events/tags.dart';
import 'package:odusg/game_logic.dart';
import 'package:odusg/helpers/iterable_extensions.dart';
import 'package:odusg/main.dart';

abstract class Block {
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

class NextButtonBlock extends Block {
  final bool endsGame;
  final String buttonText;
  const NextButtonBlock({
    required this.endsGame,
    required super.text,
    this.buttonText = "Next",
    super.cover,
    super.foreachPlayer,
    super.perTagText,
  });
}

class TimerBlock extends Block {
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

abstract class VotingBlock extends Block {
  final int minMultiselect;
  final int maxMultiselect;
  final Tags setTags;
  const VotingBlock({
    this.minMultiselect = 1,
    this.maxMultiselect = 1,
    required this.setTags,
    required super.text,
    super.cover,
    super.foreachPlayer,
    super.perTagText,
  });

  List<String> getPossibilities(WidgetRef ref);

  void finish(WidgetRef ref, String value);
}

class PlayerVotingBlock extends VotingBlock {
  final TagFilter votingTargetPossibilities;

  const PlayerVotingBlock({
    required this.votingTargetPossibilities,
    super.minMultiselect = 1,
    super.maxMultiselect = 1,
    required super.setTags,
    required super.text,
    super.cover,
    super.foreachPlayer,
    super.perTagText,
  });

  @override
  List<String> getPossibilities(WidgetRef ref) {
    final players = ref.read(playerManagerProvider);
    return votingTargetPossibilities
        .evaluatePlayers(players)
        .map((x) => x.name)
        .toList();
  }

  @override
  void finish(WidgetRef ref, String value) {
    final players = ref.read(playerManagerProvider);
    final player = players.firstWhere((x) => x.name == value);
    player.tags.tags.addAll(setTags.tags);
  }
}

class ChangeTagBlock extends Block {
  final TagFilter? affectedPlayers;
  final List<Tag> tags;
  final bool remove;

  ChangeTagBlock(
      {super.text = "",
      this.affectedPlayers,
      required this.tags,
      this.remove = false});

  void act() {
    final ref = GlobalRef.globalRef;
    final gameTags = tags
        .where((x) => x.tag.startsWith("game."))
        .map((x) => Tag(x.tag.substring(5)))
        .toList();
    final gameNotifier = ref.read(gameManagerProvider.notifier);
    if (gameTags.isNotEmpty) {
      if (remove) {
        gameNotifier.gameTags.tags.removeElements(gameTags);
      } else {
        gameNotifier.gameTags.tags.addAll(gameTags);
      }
    }

    final playerTags = tags
        .where((x) => x.tag.startsWith("player."))
        .map((x) => Tag(x.tag.substring(7)))
        .toList();
    if (playerTags.isNotEmpty) {
      if (affectedPlayers != null) {
        final affected =
            affectedPlayers!.evaluatePlayers(ref.read(playerManagerProvider));
        for (var element in affected) {
          if (remove) {
            element.tags.tags.removeElements(playerTags);
          } else {
            element.tags.tags.addAll(playerTags);
          }
        }
      }
    }
    gameNotifier.advance();
  }
}
