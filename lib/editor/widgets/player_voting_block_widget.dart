import 'package:flutter/material.dart';
import 'package:odusg/dynamic_logic/player_voting_block.dart';
import 'package:odusg/editor/widgets/block_widget.dart';
import 'package:odusg/editor/widgets/tag_filter_widget.dart';

class PlayerVotingBlockWidget extends BlockWidget<PlayerVotingBlock> {
  const PlayerVotingBlockWidget({
    super.key,
    required super.block,
    required super.scenario,
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
    ];
  }
}
