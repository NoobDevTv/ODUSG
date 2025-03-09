import 'dart:developer';
import 'dart:io';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_expandable_fab/flutter_expandable_fab.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/extensions.dart';
import 'package:odusg/models/scenario.dart';

class ManageScenarioPage extends HookConsumerWidget {
  const ManageScenarioPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isOpened = useState(-1);
    final scenarios = ref.watch(scenariosProvider);
    useEffect(() {
      isOpened.value = -1;
      return null;
    }, [scenarios.length]);
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Manage Scenarios"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(4.0),
          child: ExpansionPanelList(
            expandedHeaderPadding: const EdgeInsets.all(0),
            elevation: 2,
            expansionCallback: (panelIndex, isExpanded) =>
                isOpened.value = isExpanded ? panelIndex : -1,
            children: scenarios
                .mapIndexed(
                  (e, i) => _getListTile(e, isOpened.value == i),
                )
                .toList(growable: false),
          ),
        ),
      ),
      floatingActionButtonLocation: ExpandableFab.location,
      floatingActionButton: ExpandableFab(
        type: ExpandableFabType.up,
        distance: 64,
        children: [
          if (isOpened.value == -1 || isOpened.value > scenarios.length) ...[
            FloatingActionButton.small(
              onPressed: () async {
                final pickerResult = await FilePicker.platform.pickFiles(
                  dialogTitle: "Load Scenario",
                  allowedExtensions: ["json"],
                );
                if (pickerResult == null || pickerResult.count < 1) return;
                for (var file in pickerResult.xFiles) {
                  final content = await file.readAsString();
                  if (content.isEmpty) continue;
                  final deserialized = <Scenario>[];
                  try {
                    final scenario = ScenarioMapper.fromJson(content);
                    deserialized.add(scenario);
                  } catch (e) {
                    log(e.toString());
                  }
                  ref.read(scenariosProvider.notifier).add(deserialized);
                }
              },
              child: Icon(Icons.file_download),
              tooltip: "Import",
            ),
          ] else ...[
            FloatingActionButton.small(
              onPressed: () {},
              child: Icon(Icons.edit),
              tooltip: "Edit",
            ),
            FloatingActionButton.small(
              onPressed: () {
                final current = scenarios[isOpened.value];
                ref.read(scenariosProvider.notifier).remove(current);
              },
              child: Icon(Icons.delete),
              tooltip: "Delete",
            ),
            FloatingActionButton.small(
              onPressed: () async {
                final current = scenarios[isOpened.value];
                final path = await FilePicker.platform.saveFile(
                  dialogTitle: "Save Scenario",
                  fileName: "${current.title}.json",
                  allowedExtensions: ["json"],
                );
                if (path == null || path.isEmpty) return;

                final file = File(path);
                await file.writeAsString(current.toJson());
                print(path);
              },
              child: Icon(Icons.file_upload),
              tooltip: "Export",
            ),
          ],
        ],
      ),
    );
  }

  ExpansionPanel _getListTile(Scenario scenario, bool isExpanded) {
    final type = scenario.title;

    return ExpansionPanel(
      isExpanded: isExpanded,
      headerBuilder: (context, isExpanded) => Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(
          type,
          style: TextStyle(
              fontWeight: isExpanded ? FontWeight.bold : FontWeight.normal),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(scenario.description),
      ),
      canTapOnHeader: true,
    );
  }
}
