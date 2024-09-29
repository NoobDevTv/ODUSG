import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/conditions/win_condition.dart';
import 'package:odusg/event_manager.dart';
import 'package:odusg/game_logic.dart';
import 'package:odusg/models/player.dart';
import 'package:odusg/models/roles.dart';
import 'package:odusg/pages/for_player.dart';

import '../widgets/timer_widget.dart';

class GamePage extends ConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.watch(playerManagerProvider);
    ref.watch(nextPlayerProvider);
    ref.watch(votingManagerProvider);
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
              icon: const Icon(Icons.arrow_back)),
        ),
        body: getWidgetBasedOnState(context, ref)
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

  Widget getWidgetBasedOnState(BuildContext context, WidgetRef ref) {
    final currentGameState = ref.watch(gameStateMachineProvider);
    switch (currentGameState) {
      case GameState.roleAssignment:
        return const _RoleAssignmentWidget();
      case GameState.main:
        return const _MainWidget();
      case GameState.voting:
        return const _VotingWidget();
      case GameState.end:
        return const _EndWidget();
      default:
    }
    return FittedBox(
      fit: BoxFit.fill,
      child: Text(currentGameState.name),
    );
  }
}

class _EndWidget extends StatefulHookConsumerWidget {
  const _EndWidget();

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _EndWidgetState();
}

class _EndWidgetState extends ConsumerState<_EndWidget> {
  List<Player> lostPlayers = [];
  List<Player> wonPlayers = [];

  @override
  void initState() {
    super.initState();
    final votings = ref.read(votingManagerProvider);
    for (var play in votings.entries) {
      bool won = false;
      for (var cond in winConditions) {
        if (cond.matched(votings, play.key)) {
          wonPlayers.add(play.key);
          won = true;
          break;
        }
      }
      if (!won) lostPlayers.add(play.key);
    }
  }

  @override
  Widget build(BuildContext context) {
    final votedPlayers = ref.watch(votingManagerProvider).entries.toList();

    return SingleChildScrollView(
      child: Column(
        children: [
          ListTile(
            title: Text(
              "Winners 🎉 🥳",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          ...wonPlayers.map((x) => ListTile(
                title: Text("${x.name} was ${x.role.name}."),
              )),
          ListTile(
            title: Text(
              "Loosers 😥",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          ...lostPlayers.map((x) => ListTile(
                title: Text("${x.name} was ${x.role.name}."),
              ))
        ],
      ),
    );
  }
}

class _RoleAssignmentWidget extends HookConsumerWidget {
  const _RoleAssignmentWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPlayer = ref.watch(nextPlayerProvider);
    ref.invalidate(nextPlayerProvider);
    if (currentPlayer == null) {
      // WidgetsBinding.instance.addPostFrameCallback((_) {
      //   ref.read(gameStateMachineProvider.notifier).advance();
      // });
      return const SizedBox();
    }

    return ForPlayer(
        player: currentPlayer,
        hiddenContent: ListTile(
          leading: FittedBox(
              child: Text(currentPlayer.role == Role.bad ? "Bad" : "Good")),
          title: FittedBox(
              child: Text("Dein Codeword ist: ${currentPlayer.keyWord}")),
          onTap: () => ref.invalidate(nextPlayerProvider),
        ));
  }
}

class _MainWidget extends HookConsumerWidget {
  const _MainWidget();
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentEvent = ref.watch(eventManagerProvider);
    final curPlayer = ref.read(nextPlayerProvider);
    if (currentEvent == null || curPlayer == null) {
      return ListTile(
        title: TimerWidget(
            tickUntil: DateTime.timestamp().add(
              const Duration(seconds: 3),
            ),
            elapsed: () {
              print("Timer elapsed");

              WidgetsBinding.instance.addPostFrameCallback((_) {
                ref.read(eventManagerProvider.notifier).generateNewEvent();
              });
            }),
        onTap: () => ref.read(eventManagerProvider.notifier).generateNewEvent(),
      );
    }

    return ForPlayer(
        player: curPlayer,
        hiddenContent:
            currentEvent.getWidget(ref.read(playerManagerProvider), curPlayer));
  }
}

class _VotingWidget extends HookConsumerWidget {
  const _VotingWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPlayer = ref.watch(nextPlayerProvider);
    final selectedPlayer = useState<Player?>(null);
    if (currentPlayer == null) {
      ref.invalidate(nextPlayerProvider);
      return const SizedBox();
    }
    final allPlayers = ref.watch(playerManagerProvider);
    final allExceptUs = allPlayers.where((x) => x != currentPlayer).toList();

    return ForPlayer(
      player: currentPlayer,
      hiddenContent: Column(
        children: [
          ListTile(
            title: Card.outlined(
              child: Container(
                margin: const EdgeInsets.only(
                    left: 8, top: 16, right: 8, bottom: 16),
                child: Text(
                    "${currentPlayer.name}, please vote for the player, who you think is the bad one"),
              ),
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: allExceptUs.length,
              itemBuilder: (context, index) {
                final player = allExceptUs[index];

                return RadioListTile<Player>(
                  title: Text(player.name),
                  onChanged: (value) => selectedPlayer.value = value,
                  value: player,
                  groupValue: selectedPlayer.value,
                );
              },
            ),
          ),
          ListTile(
            title: OutlinedButton(
              onPressed: selectedPlayer.value == null
                  ? null
                  : () {
                      ref
                          .read(votingManagerProvider.notifier)
                          .voteForPlayer(selectedPlayer.value!);
                      selectedPlayer.value = null;
                      ref.invalidate(nextPlayerProvider);
                    },
              child: const Text("Vote"),
            ),
          )
        ],
      ),
    );
  }
}
