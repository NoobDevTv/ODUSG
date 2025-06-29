import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/dynamic_logic/block_types.dart';
import 'package:odusg/dynamic_logic/block_widget.dart';
import 'package:odusg/game_logic.dart';
import 'package:odusg/special_states/group_blocks.dart';
import 'package:odusg/pages/for_player.dart';
import 'package:odusg/special_states/single_execution_blocks.dart';

class GamePage extends ConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(playerManagerProvider);
    // ref.watch(nextPlayerProvider);
    // ref.watch(votingManagerProvider);
    return const _GamePage();
  }
}

class _GamePage extends HookConsumerWidget {
  const _GamePage();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Spiel und Spaß"),
        leading: IconButton(
          onPressed: () => Navigator.of(context).pop(),
          icon: const Icon(Icons.arrow_back),
        ),
      ),
      body: _steppedBasedGame(ref),

      //getWidgetBasedOnState(context, ref)
      // ListView(
      //   children: [
      //     ...players.map((x) => ListTile(
      //           leading: Icon(x.bad ? Icons.badge : Icons.golf_course),
      //           title: Text(x.name),
      //           subtitle: Row(
      //             mainAxisSize: MainAxisSize.min,
      //             children: x.keyWordSet.map((y) => Text("$y, ")).toList(),
      //           ),
      //         )),
      //   ],
      // ),
    );
  }

  Widget _steppedBasedGame(WidgetRef ref) {
    var step = ref.watch(gameManagerProvider);

    final widget = blockWidgetFactory[step.block.runtimeType]!(step.block);
    final player = ref.watch(nextPlayerProvider);
    return Column(
      children: [
        if (step.block.cover && player != null)
          ForPlayer(hiddenContent: widget, player: player)
        else
          widget,
        MaterialButton(
          child: const Text("Im the button"),
          onPressed: () {
            ref.read(advancingProvider.notifier).advance();
          },
        ),
      ],
    );
  }
}
