import 'package:darq/darq.dart';
import 'package:odusg/dynamic_logic/block_types.dart';
import 'package:odusg/dynamic_logic/step.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'single_execution_blocks.g.dart';

@Riverpod(keepAlive: true)
class SingleExecutionBlocks extends _$SingleExecutionBlocks {
  @override
  Map<SingleChildExecutorBlock, List<Step>> build() {
    return {};
  }

  void add(SingleChildExecutorBlock block) {
    final newState = {...state};
    newState.putIfAbsent(block, () => []);
    state = newState;
  }

  Step? advance(SingleChildExecutorBlock block) {
    final executedBlockSteps = state[block]!;
    final availableSteps = block.steps.except(executedBlockSteps).toList();

    if (block.refillWhenEmpty && availableSteps.isEmpty) {
      executedBlockSteps.clear();
      availableSteps.addAll(block.steps);
    }

    if (availableSteps.isEmpty) {
      return null;
    }

    if (block.randomOrder) {
      availableSteps.shuffle();
    }

    final selectedStep = availableSteps.first;

    if (block.removeExecuted) {
      executedBlockSteps.add(selectedStep);
      state = {...state};
    }

    return selectedStep;
  }
}
