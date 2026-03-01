import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/dynamic_logic/block_types.dart';
import 'package:odusg/dynamic_logic/choice_voting_block.dart';
import 'package:odusg/dynamic_logic/step.dart' as s;

import 'package:odusg/editor/widgets/change_tag_block_widget.dart';
import 'package:odusg/editor/widgets/choice_voting_block_widget.dart';
import 'package:odusg/editor/widgets/group_block_widget.dart';
import 'package:odusg/editor/widgets/next_button_block_widget.dart';
import 'package:odusg/editor/widgets/player_voting_block_widget.dart';
import 'package:odusg/editor/widgets/single_child_executor_block_widget.dart';
import 'package:odusg/editor/widgets/timer_block_widget.dart';
import 'package:odusg/models/scenario.dart';

class BaseBlockWidget extends HookWidget {
  const BaseBlockWidget({
    super.key,
    required this.block,
    required this.step,
    required this.scenario,
  });
  final Block block;
  final ValueNotifier<s.Step> step;
  final Scenario scenario;

  @override
  Widget build(BuildContext context) {
    final b = switch (block) {
      GroupBlock b => useState(b),
      NextButtonBlock b => useState(b),
      TimerBlock b => useState(b),
      PlayerVotingBlock b => useState(b),
      ChoiceVotingBlock b => useState(b),
      ChangeTagBlock b => useState(b),
      SingleChildExecutorBlock b => useState(b),
      _ => useState(block),
    };
    useOnListenableChange(b, () {
      step.value = step.value.copyWith(block: b.value);
    });
    useEffect(() {
      b.value = block;
      return null;
    }, [block]);

    T2 create<T, T2>(
      T2 Function({
        required ValueNotifier<T> block,
        Key? key,
        required Scenario scenario,
        required s.Step step,
      })
      func,
    ) {
      return func(
        block: b as ValueNotifier<T>,
        scenario: scenario,
        step: step.value,
      );
    }

    return switch (b) {
      ValueNotifier<NextButtonBlock> _ => create(NextButtonBlockWidget.new),
      ValueNotifier<TimerBlock> _ => create(TimerBlockWidget.new),
      ValueNotifier<PlayerVotingBlock> _ => create(PlayerVotingBlockWidget.new),
      ValueNotifier<ChoiceVotingBlock> _ => create(ChoiceVotingBlockWidget.new),
      ValueNotifier<ChangeTagBlock> _ => create(ChangeTagBlockWidget.new),
      ValueNotifier<GroupBlock> _ => create(GroupBlockWidget.new),
      ValueNotifier<SingleChildExecutorBlock> _ => create(
        SingleChildExecutorBlockWidget.new,
      ),
      _ => const SizedBox(),
    };
  }
}
