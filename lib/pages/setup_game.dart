import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/widgets/player_name_list.dart';

class SetupGamePage extends ConsumerWidget {
  const SetupGamePage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setup Game"),
      ),
      body: ListView(
        children: const [
          ExpansionTile(
            title: Text("Player Names"),
            children: [PlayerNameList()],
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        label: const Text("Start Game"),
        onPressed: () => Navigator.pushReplacementNamed(context, "/game"),
        icon: const Icon(Icons.sports_esports),
      ),
    );
  }
}
