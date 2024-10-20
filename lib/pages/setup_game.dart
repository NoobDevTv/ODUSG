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
        label: const Text("Select Scenario"),
        onPressed: () =>
            Navigator.pushReplacementNamed(context, "/scenario_selector"),
        icon: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
