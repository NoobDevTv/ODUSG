import 'package:odusg/dynamic_logic/block_types.dart';
import 'package:odusg/dynamic_logic/step.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'single_execution_blocks.g.dart';

@Riverpod(keepAlive: true)
class SingleExecutionBlocks extends _$SingleExecutionBlocks {
  @override
  Map<SingleChildExecutorBlock, List<int>> build() {
    return {};
  }

  void add(SingleChildExecutorBlock block) {
    final newState = {...state};
    newState.putIfAbsent(block, () => []);
    state = newState;
  }

  // Step get[StepFor(SingleChildExecutorBlock block) {
  //TODO: Get Step Random or next one in Order. List<int> inside state is already executed steps
  // }
}
