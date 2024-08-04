import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/game_logic.dart';

class GamePage extends ConsumerWidget {
  const GamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final players = ref.watch(playerManagerProvider);

    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        children: [
          ...players.map((x) => ListTile(
                leading: Icon(x.bad ? Icons.badge : Icons.golf_course),
                title: Text(x.name),
                subtitle: Row(
                  mainAxisSize: MainAxisSize.min,
                  children: x.keyWordSet.map((y) => Text("$y, ")).toList(),
                ),
              )),
        ],
      ),
    );
  }
}
