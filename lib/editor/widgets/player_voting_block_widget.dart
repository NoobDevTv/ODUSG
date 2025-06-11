import 'package:flutter/material.dart';
import 'package:odusg/dynamic_logic/player_voting_block.dart';
import 'package:odusg/editor/widgets/block_widget.dart';
import 'package:odusg/editor/widgets/tag_filter_widget.dart';
import 'package:odusg/editor/widgets/tag_selector.dart';
import 'package:odusg/events/tags.dart';

class PlayerVotingBlockWidget extends BlockWidget<PlayerVotingBlock> {
  const PlayerVotingBlockWidget({
    super.key,
    required super.block,
    required super.scenario,
    required super.step,
  });

  @override
  List<Widget> listBuild(
    BuildContext context,
    ValueNotifier<PlayerVotingBlock> b,
  ) {
    return [
      ListTile(
        title: TagFilterWidget(
          tagFilter: currentBlock.votingTargetPossibilities,
          label: const Text("Player Votings"),
          hintText: "Tag Filter for player voting candidates",
          onChanged:
              (newFilter) =>
                  b.value = b.value.copyWith(
                    votingTargetPossibilities: newFilter,
                  ),
        ),
      ),
      ListTile(
        title: Text("Tags to set on voted player", textAlign: TextAlign.start),
        subtitle: TagSelector(
          selectedTags: currentBlock.setTags.tags,
          selectableTags: scenario.availableGameTags,
          onClosed:
              (newFilter) =>
                  b.value = b.value.copyWith(setTags: Tags(newFilter)),
        ),
      ),
    ];
  }
}
