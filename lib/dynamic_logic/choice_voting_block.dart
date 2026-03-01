import 'package:dart_mappable/dart_mappable.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/dynamic_logic/tag_condition.dart';
import 'package:odusg/dynamic_logic/voting_block.dart';
import 'package:odusg/events/tags.dart';
import 'package:odusg/game_logic.dart';
import 'package:odusg/helpers/iterable_extensions.dart';

part 'choice_voting_block.mapper.dart';

@MappableClass()
class Choice with ChoiceMappable {
  final List<Tag> tags;
  final String text;

  Choice({required this.tags, required this.text});
}

@MappableClass(discriminatorValue: "ChoiceVotingBlock")
class ChoiceVotingBlock extends VotingBlock with ChoiceVotingBlockMappable {
  final List<Choice> choices;

  const ChoiceVotingBlock({
    required super.minMultiselect,
    required super.maxMultiselect,
    super.setTags = const Tags([]),
    required super.text,
    required this.choices,
    super.cover,
    super.foreachPlayer,
    super.perTagText,
    super.image,
    super.ttsMessage,
    super.optional,
  });

  @override
  List<String> getPossibilities(WidgetRef ref) {
    return choices.map((x) => x.text).toList();
  }

  @override
  void finish(WidgetRef ref, List<String> votings) {
    final gm = ref.read(gameManagerProvider.notifier);
    gm.gameTags.tags.addAll(
      choices.where((x) => votings.contains(x.text)).mapMany((x) => x.tags),
    );
  }
}
