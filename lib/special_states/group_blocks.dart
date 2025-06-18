import 'package:odusg/dynamic_logic/block_types.dart';
import 'package:odusg/game_logic.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'group_blocks.g.dart';

typedef GroupBlockStep = (GroupBlock block, int step);

@Riverpod(keepAlive: true)
class GroupBlocks extends _$GroupBlocks {
  @override
  List<GroupBlockStep> build() {
    return [];
  }

  void tryAppend(GroupBlock block) {
    final current = state.lastOrNull;
    if (current != null && current.$1 == block) return;
    state = [...state, (block, 0)];
  }

  void removeCurrent(GroupBlock block) {
    if (state.isEmpty) return;
    state = [...state.take(state.length - 1)];
  }

  bool advanceCurrent() {
    final newState = state.toList();
    GroupBlockStep? current;
    try {
      for (;;) {
        current = newState.lastOrNull;
        if (current == null) {
          ref.read(gameManagerProvider.notifier).advance();
          return false;
        }
        if (current.$1.steps.length == current.$2 + 1) {
          newState.removeLast();
          continue;
        } else {
          final idx = newState.indexOf(current);
          newState[idx] = (current.$1, current.$2 + 1);
          break;
        }
      }
    } finally {
      state = newState;
    }
    return true;
  }
}
