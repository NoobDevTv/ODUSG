import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/editor/steps_edit.dart';
import 'package:odusg/editor/widgets/tag_selector.dart';
import 'package:odusg/events/tags.dart';
import 'package:odusg/models/roles.dart';
import 'package:odusg/models/scenario.dart';

typedef PreGameWidgetEntry = DropdownMenuEntry<PreGameWidget>;

class ScenarioEditorPage extends HookConsumerWidget {
  final Scenario startScenario;

  const ScenarioEditorPage({super.key, required this.startScenario});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final scenario = useState(startScenario);
    useEffect(() {
      scenario.value = startScenario;
      return null;
    }, [startScenario]);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Editor"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: Padding(
        padding: const EdgeInsets.all(8),
        child: ListView(
          children: [
            ExpansionTile(
              title: const Text("General"),
              children: [
                Card(
                  elevation: 4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _generalCardContent(scenario),
                  ),
                ),
              ],
            ),
            const Divider(),
            ExpansionTile(
              title: const Text("Setup"),
              children: [
                Card(
                  elevation: 4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _setupCardContent(scenario),
                  ),
                ),
                ExpansionTile(
                  title: const Text("Possible Game & Player Tags"),
                  children: [
                    Card(
                      elevation: 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: _specialCardContent(scenario),
                      ),
                    ),
                  ],
                ),
                ExpansionTile(
                  title: const Text("Player Roles"),
                  children: [
                    Card(
                      elevation: 4,
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: _rolesCardContent(context, scenario),
                      ),
                    ),
                  ],
                ),
              ],
            ),
            const Divider(),
            ExpansionTile(
              title: const Text("Steps"),
              childrenPadding: const EdgeInsets.all(0),
              children: [
                Card(
                  elevation: 4,
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: _gameCardContent(scenario),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  /*
General
  final String title;
  final String description;
  final String endText;
  final List<EventInfo> possibleEvents;
  final bool showAssignedEventAtEnd;

 */
  List<Widget> _generalCardContent(ValueNotifier<Scenario> scenario) {
    final titleEdit = useTextEditingController(text: scenario.value.title);
    final descriptionEdit = useTextEditingController(
      text: scenario.value.description,
    );
    final showEndAssigned = useState(scenario.value.showAssignedEventAtEnd);

    return [
      ListTile(
        title: TextField(
          controller: titleEdit,
          onEditingComplete: () {
            scenario.value = scenario.value.copyWith(title: titleEdit.text);
          },
          decoration: const InputDecoration(
            label: Text("Game Title"),
            hintText: "The title of the game itself",
          ),
        ),
      ),
      ListTile(
        title: TextField(
          controller: descriptionEdit,
          onEditingComplete: () {
            scenario.value = scenario.value.copyWith(
              title: descriptionEdit.text,
            );
          },
          maxLines: 4,
          decoration: const InputDecoration(
            label: Text("Game Description"),
            hintText:
                "The description of the game, to explain what it is about",
          ),
        ),
      ),
      CheckboxListTile(
        value: showEndAssigned.value,
        onChanged: (value) => showEndAssigned.value = value ?? false,
        title: const Text("Show Assigned Event at End"),
      ),
    ];
  }

  /*
Setup
  final List<Tag> startingTags;
  Do This:
  final List<Roles> roles;
  final PreGameWidget preGameWidget;
  */

  List<Widget> _setupCardContent(ValueNotifier<Scenario> scenario) {
    final s = scenario.value;
    return [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: DropdownMenu<PreGameWidget>(
          initialSelection: s.preGameWidget,
          label: const Text("Pre Game Widget"),
          onSelected: (value) {
            scenario.value = scenario.value.copyWith(preGameWidget: value);
          },
          dropdownMenuEntries: UnmodifiableListView<PreGameWidgetEntry>(
            PreGameWidget.values.map(
              (e) => PreGameWidgetEntry(value: e, label: e.name),
            ),
          ),
        ),
      ),
      ListTile(
        title: const Text("Player Starting Tags"),
        subtitle: Wrap(
          children: [
            ...scenario.value.startingTags.map(
              (x) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: Chip(
                  label: Text(x.tag),
                  deleteIcon: const Icon(Icons.delete),
                  onDeleted:
                      () =>
                          scenario.value = scenario.value.copyWith.startingTags
                              .removeAt(scenario.value.startingTags.indexOf(x)),
                ),
              ),
            ),
            TagSelector(
              selectableTags:
                  scenario.value.availableGameTags
                      .where((x) => !scenario.value.startingTags.contains(x))
                      .toList(),
              onClosed: (selected) {
                if (selected.isEmpty) return;
                scenario.value = scenario.value.copyWith.startingTags.addAll(
                  selected,
                );
              },
            ),
          ],
        ),
      ),
    ];
  }

  /*
  
Special
  final List<Tag> availableGameTags;
Game
  final List<Step> steps;
  */

  List<Widget> _specialCardContent(ValueNotifier<Scenario> scenario) {
    final chipText = useTextEditingController();
    final chipError = useState<String?>(null);
    return [
      Wrap(
        children: [
          ...scenario.value.availableGameTags.map(
            (x) => Padding(
              padding: const EdgeInsets.all(4.0),
              child: Chip(
                label: Text(x.tag),
                deleteIcon: const Icon(Icons.delete),
                onDeleted:
                    () =>
                        scenario.value = scenario
                            .value
                            .copyWith
                            .availableGameTags
                            .removeAt(
                              scenario.value.availableGameTags.indexOf(x),
                            ),
              ),
            ),
          ),
        ],
      ),
      ListTile(
        title: TextField(
          controller: chipText,
          onEditingComplete: () {
            scenario.value = scenario.value.copyWith(title: chipText.text);
          },
          maxLines: 1,
          decoration: InputDecoration(
            label: const Text("Add new tag"),
            errorText: chipError.value,
          ),
          onSubmitted: (value) {
            final tags = scenario.value.availableGameTags;
            final newTag = Tag(value);
            if (tags.contains(newTag)) {
              chipError.value = "The tag '$value' does already exist";
              return;
            }
            scenario.value = scenario.value.copyWith.availableGameTags.add(
              newTag,
            );
            chipError.value = null;
            chipText.text = "";
          },
        ),
      ),
    ];
  }

  /*
class Roles with RolesMappable {
  final String tag;
  final String intlKey;
  final List<(int player, int min, int max)> getAssignableAmount;
  final int priority;
  final bool isDefault;

  const Roles({
    required this.tag,
    required this.intlKey,
    required this.getAssignableAmount,
    this.priority = 0,
    this.isDefault = false,
  });
}
  */

  List<Widget> _rolesCardContent(
    BuildContext context,
    ValueNotifier<Scenario> scenario,
  ) {
    final chipText = useTextEditingController();
    final chipError = useState<String?>(null);
    return scenario.value.roles.map((x) {
      return ListTile(
        subtitle: Text(x.intlKey),
        title: Text(x.tag),
        onTap: () async {
          final newRole = await showDialog(
            context: context,
            builder: (c) => _roleEditDialog(c, scenario, x),
            barrierDismissible: true,
          );
          if (newRole != null)
            scenario.value = scenario.value.copyWith.roles.replace(
              scenario.value.roles.indexOf(x),
              newRole,
            );
        },
      );
    }).toList();
  }

  //TODO weitermachen:
  Widget _roleEditDialog(
    BuildContext context,
    ValueNotifier<Scenario> scenario,
    Roles role,
  ) {
    return HookBuilder(
      builder: (context) {
        final intlKeyText = useTextEditingController(text: role.intlKey);
        final priorityTextController = useTextEditingController(
          text: role.priority.toString(),
        );
        final intlKeyError = useState<String?>(null);
        final roleState = useState(role);

        return AlertDialog(
          title: Text("Edit Role"),

          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(roleState.value),
              child: Text("Save"),
            ),
          ],
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: TextField(
                  controller: intlKeyText,
                  onChanged: (val) {
                    roleState.value = roleState.value.copyWith(
                      intlKey: val,
                    );
                  },
                  maxLines: 1,
                  decoration: InputDecoration(
                    label: const Text("Translation Key"),
                    hintText:
                        "The key used to search through the translations.",
                    errorText: intlKeyError.value,
                  ),
                ),
              ),
              ListTile(
                title: DropdownMenu<String>(
                  initialSelection: role.tag,
                  label: const Text("Starting Tag"),
                  onSelected: (value) {
                    roleState.value = roleState.value.copyWith(tag: value);
                  },
                  dropdownMenuEntries:
                      UnmodifiableListView<DropdownMenuEntry<String>>(
                        scenario.value.availableGameTags.map(
                          (e) => DropdownMenuEntry(value: e.tag, label: e.tag),
                        ),
                      ),
                ),
              ),
              ListTile(
                title: TextField(
                  controller: priorityTextController,
                  onChanged: (val) {
                    final newPrio = int.tryParse(val);
                    if (newPrio == null) return;
                    roleState.value = roleState.value.copyWith(
                      priority: newPrio,
                    );
                  },
                  maxLines: 1,
                  keyboardType: TextInputType.number,
                  decoration: const InputDecoration(
                    label: Text("Priority"),
                    hintText: "The Priority of assignment of the role",
                  ),
                  inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                ),
              ),
              CheckboxListTile(
                title: const Text("Is Default"),
                value: roleState.value.isDefault,
                onChanged: (value) {
                  roleState.value = roleState.value.copyWith(isDefault: value);
                },
              ),
            ],
          ),
        );
      },
    );
  }

  List<Widget> _gameCardContent(ValueNotifier<Scenario> scenario) {
    return [StepsEdit(scenario: scenario)];
  }
}
