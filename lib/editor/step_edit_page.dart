import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:odusg/dynamic_logic/step.dart' as s;
import 'package:odusg/dynamic_logic/tag_condition.dart';
import 'package:odusg/editor/widgets/base_block_widget.dart';
import 'package:odusg/editor/widgets/tag_filter_widget.dart';
import 'package:odusg/models/scenario.dart';

class StepEditPage extends HookWidget {
  const StepEditPage({super.key, required this.step, required this.scenario});

  final s.Step step;
  final Scenario scenario;

  @override
  Widget build(BuildContext context) {
    final nameController = useTextEditingController(text: step.name);
    final entryController = useTextEditingController(
      text: step.entryGuard.toString(),
    );
    final filterController = useTextEditingController(
      text: step.filter.toString(),
    );
    final filterError = useState<String?>(null);
    final entryError = useState<String?>(null);

    final current = useState(step);
    useEffect(() {
      current.value = step;
      return null;
    }, [step]);
    return Scaffold(
      appBar: AppBar(
        title: const Text("Editor"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: ListView(
        children: [
          Card(
            elevation: 4,
            margin: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: TextField(
                    controller: nameController,
                    onChanged: (newText) {
                      current.value = current.value.copyWith(name: newText);
                    },
                    decoration: const InputDecoration(
                      label: Text("Name"),
                      hintText: "Unique Name of this step",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: TextField(
                    controller: entryController,
                    onChanged: (newText) {
                      try {
                        final newCondition = TagCondition.parse(newText);
                        current.value = current.value.copyWith(
                          entryGuard: newCondition,
                        );
                        entryError.value = null;
                      } catch (e) {
                        entryError.value = e.toString();
                      }
                    },
                    decoration: InputDecoration(
                      label: const Text("Entry"),
                      error:
                          entryError.value == null
                              ? null
                              : Text(entryError.value!),
                      hintText:
                          "The Condition that must match for this step to execute",
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 8.0,
                    horizontal: 16.0,
                  ),
                  child: TagFilterWidget(
                    tagFilter: current.value.filter,
                    label: Text("Filter"),
                    hintText: "Tag Filter for players",
                    onChanged: (newFilter) {
                      try {
                        current.value = current.value.copyWith(
                          filter: newFilter,
                        );
                        filterError.value = null;
                      } catch (e) {
                        filterError.value = e.toString();
                      }
                    },
                  ),
                ),
              ],
            ),
          ),
          Card(
            elevation: 4,
            margin: const EdgeInsets.all(8.0),
            child: BaseBlockWidget(
              block: current.value.block,
              scenario: scenario,
              step: current,
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.save),
        onPressed: () {
          Navigator.pop(context, current.value);
        },
      ),
    );
  }
}
