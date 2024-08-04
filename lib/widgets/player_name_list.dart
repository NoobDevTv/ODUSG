import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/dialogs/exports.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'player_name_list.g.dart';

@Riverpod(keepAlive: true)
class PlayerNames extends _$PlayerNames {
  @override
  List<String> build() {
    return [];
  }

  bool addPlayer(String playerName) {
    if (state.contains(playerName)) return false;
    state = [...state, playerName];
    return true;
  }

  bool renamePlayer(String oldPlayerName, newPlayerName) {
    if (state.contains(newPlayerName)) return false;

    state[state.indexOf(oldPlayerName)] = newPlayerName;
    state = [...state];
    return true;
  }

  void removePlayer(String playerName) {
    state = [...state.where((x) => x != playerName)];
  }
}

class PlayerNameList extends ConsumerWidget {
  const PlayerNameList({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerNames = ref.watch(playerNamesProvider);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ...playerNames.map((x) => ListTile(
              title: Text(x),
              trailing: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  IconButton(
                    onPressed: () {
                      var sd = SimpleDialogSingleInput.create(
                          title: "Rename Player",
                          hintText: "Player Name",
                          defaultText: x,
                          onSubmitted: (n) => ref
                              .read(playerNamesProvider.notifier)
                              .renamePlayer(x, n),
                          context: context);
                      showDialog(context: context, builder: (_) => sd);
                    },
                    icon: const Icon(Icons.edit),
                  ),
                  IconButton(
                    onPressed: () {
                      ref.read(playerNamesProvider.notifier).removePlayer(x);
                    },
                    icon: const Icon(Icons.delete),
                  ),
                ],
              ),
            )),
        MaterialButton(
          onPressed: () {
            var sd = SimpleDialogSingleInput.create(
                title: "New Player",
                hintText: "Player Name",
                onSubmitted: (n) =>
                    ref.read(playerNamesProvider.notifier).addPlayer(n),
                context: context);
            showDialog(context: context, builder: (_) => sd);
          },
          child: const Text("+ Add Player"),
        )
      ],
    );
  }
}
