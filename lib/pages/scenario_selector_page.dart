import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/current_scenario.dart';
import 'package:odusg/extensions.dart';
import 'package:odusg/game_logic.dart';
import 'package:odusg/models/scenario.dart';

class ScenarioSelectorPage extends HookConsumerWidget {
  const ScenarioSelectorPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOpened = useState(-1);
    ref.watch(playerManagerProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text("Szenario"),
        leading: IconButton(
            onPressed: () => Navigator.of(context).pop(),
            icon: const Icon(Icons.arrow_back)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ExpansionPanelList(
            expandedHeaderPadding: const EdgeInsets.all(0),
            elevation: 2,
            expansionCallback: (panelIndex, isExpanded) =>
                isOpened.value = isExpanded ? panelIndex : -1,
            children: scenarios.values
                .mapIndexed(
                  (e, i) => _getListTile(e, isOpened.value == i),
                )
                .toList(growable: false),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        isExtended: true,
        label: const Text("Start Game"),
        onPressed: isOpened.value == -1
            ? null
            : () {
                ref.read(currentScenarioProvider.notifier).selectOther(
                    scenarios.entries.elementAt(isOpened.value).value);

                Navigator.pushReplacementNamed(context, "/game");
              },
        icon: const Icon(Icons.sports_esports),
      ),
    );
  }

  ExpansionPanel _getListTile(Scenario scenario, bool expanded) {
    final type = scenario.type;

    return ExpansionPanel(
      headerBuilder: (context, isExpanded) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          type.label,
          style: TextStyle(
              fontWeight: isExpanded ? FontWeight.bold : FontWeight.normal),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(scenario.description),
      ),
      canTapOnHeader: true,
      isExpanded: expanded,
    );
  }
}
