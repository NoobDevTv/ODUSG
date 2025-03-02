import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/conditions/win_condition.dart';
import 'package:odusg/current_scenario.dart';
import 'package:odusg/dynamic_logic/block_widget.dart';
import 'package:odusg/event_manager.dart';
import 'package:odusg/events/event_info.dart';
import 'package:odusg/events/event_text.dart';
import 'package:odusg/game_logic.dart';
import 'package:odusg/models/player.dart';
import 'package:odusg/models/roles.dart';
import 'package:odusg/models/scenario.dart';
import 'package:odusg/pages/for_player.dart';

import '../widgets/timer_widget.dart';

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
            icon: const Icon(Icons.arrow_back)),
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
    final step = ref.watch(gameManagerProvider);
    final widget = blockWidgetFactory[step.block.runtimeType]!(step.block);
    final player = ref.watch(nextPlayerProvider);
    return Column(
      children: [
        if (step.block.cover && player != null)
          ForPlayer(
            hiddenContent: widget,
            player: player,
          )
        else
          widget,
        MaterialButton(
            child: Text("Im the button"),
            onPressed: () {
              ref.read(gameManagerProvider.notifier).advance();
            }),
      ],
    );
  }

  Widget getWidgetBasedOnState(BuildContext context, WidgetRef ref) {
    final currentGameState = ref.watch(gameStateMachineProvider);
    final scenario = ref.watch(currentScenarioProvider);

    switch (currentGameState) {
      case GameState.roleAssignment:
        switch (scenario.preGameWidget) {
          case PreGameWidget.roleAssignment:
            return const _RoleAssignmentWidget();
          case PreGameWidget.textInput:
            return const _PerPersonInputWidget();
        }
      case GameState.main:
        return const _MainWidget();
      case GameState.voting:
        return const _VotingWidget();
      case GameState.end:
        return const _EndWidget();
    }
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
    ref.watch(votingManagerProvider).entries.toList();
    final assignedEvents =
        ref.read(eventManagerProvider.notifier).assignedEvents;
    final currentScenario = ref.watch(currentScenarioProvider);

    return SingleChildScrollView(
      child: Column(
        children: [
          const ListTile(
            title: Text(
              "Winners 🎉 🥳",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          ...wonPlayers.map((x) => ListTile(
                title: currentScenario.showAssignedEventAtEnd
                    ? Text(
                        "${x.name} pitched ${assignedEvents[x]!.textAlterations.first.text}")
                    : Text("${x.name} was ${x.role.name}."),
              )),
          const ListTile(
            title: Text(
              "Loosers 😥",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 22),
            ),
          ),
          ...lostPlayers.map((x) => ListTile(
                title: currentScenario.showAssignedEventAtEnd
                    ? Text(
                        "${x.name} pitched ${assignedEvents[x]!.textAlterations.first.text}")
                    : Text("${x.name} was ${x.role.name}."),
              ))
        ],
      ),
    );
  }
}

class _PerPersonInputWidget extends HookConsumerWidget {
  const _PerPersonInputWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPlayer = ref.watch(nextPlayerProvider);
    if (currentPlayer == null) {
      return const SizedBox();
    }
    final inputController = useTextEditingController(
      keys: [
        currentPlayer.name,
      ],
    );

    return Column(
      children: [
        ListTile(
          title: Text(
              "${currentPlayer.name} bitte gib ein Thema für ein Pitch ein. Etwas mehr Beschreibung auch erlaubt, aber nicht zu viel 😉"),
        ),
        ListTile(
          title: TextField(
            maxLines: 5,
            minLines: 1,
            controller: inputController,
          ),
        ),
        const Expanded(child: SizedBox()),
        ListTile(
          title: ElevatedButton(
            child: const Text("Weiter"),
            onPressed: () {
              ref.read(currentScenarioProvider.notifier).addNewEventToCurrent(
                    EventInfo(
                      [
                        EventText(inputController.text),
                      ],
                    ),
                  );
              ref.invalidate(nextPlayerProvider);
            },
          ),
        )
      ],
    );
  }
}

class _RoleAssignmentWidget extends HookConsumerWidget {
  const _RoleAssignmentWidget();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentPlayer = ref.watch(nextPlayerProvider);
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
            tickFor: const Duration(seconds: 3),
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
    final assignedEvents =
        ref.read(eventManagerProvider.notifier).assignedEvents;
    final currentScenario = ref.watch(currentScenarioProvider);

    return ForPlayer(
      player: currentPlayer,
      hiddenContent: Column(
        children: [
          ListTile(
            title: Card.outlined(
              child: Container(
                margin: const EdgeInsets.only(
                    left: 8, top: 16, right: 8, bottom: 16),
                child:
                    Text("${currentPlayer.name}, ${currentScenario.endText}"),
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
                  subtitle: !currentScenario.showAssignedEventAtEnd
                      ? null
                      : Text(
                          assignedEvents[player]?.textAlterations.first.text ??
                              ""),
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
