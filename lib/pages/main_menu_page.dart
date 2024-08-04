import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class MainMenuPage extends ConsumerWidget {
  const MainMenuPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Main Menu"),
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text("Start"),
            onTap: () => Navigator.pushNamed(context, "/setup_game"),
          ),
          const ListTile(
            title: Text("Hilfe"),
          ),
          const ListTile(
            title: Text("Einstellungen"),
          ),
          const ListTile(
            title: Text("Über"),
          ),
          const ListTile(
            title: Text("Beenden"),
          ),
        ],
      ),
    );
  }
}
