import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/dynamic_logic/block_types.dart';
import 'package:odusg/dynamic_logic/choice_voting_block.dart';
import 'package:odusg/dynamic_logic/step.dart' as s;
import 'package:odusg/dynamic_logic/tag_condition.dart';
import 'package:odusg/editor/widgets/choice_voting_block_widget.dart';
import 'package:odusg/editor/widgets/step_widget.dart';
import 'package:odusg/events/tags.dart';
import 'package:odusg/models/scenario.dart';

class StepsEdit extends StatelessWidget {
  const StepsEdit({super.key, required this.scenario});

  final ValueNotifier<Scenario> scenario;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ReorderableListView.builder(
          shrinkWrap: true,
          onReorder: (oldIndex, newIndex) {
            if (oldIndex < newIndex) {
              newIndex -= 1;
            }
            final newOrder = scenario.value.steps.toList();

            final item = newOrder.removeAt(oldIndex);
            newOrder.insert(newIndex, item);
            scenario.value = scenario.value.copyWith(steps: newOrder);
          },
          itemCount: scenario.value.steps.length,
          itemBuilder: (context, index) {
            final s = scenario.value.steps[index];
            final key = Key(s.uid);

            return Dismissible(
              key: key,
              direction: DismissDirection.startToEnd,
              background: Container(
                color: Colors.redAccent,
                child: const Align(
                  alignment: Alignment.centerLeft,
                  child: Padding(
                    padding: EdgeInsets.only(left: 8.0),
                    child: Icon(Icons.delete),
                  ),
                ),
              ),
              onDismissed: (direction) {
                scenario.value = scenario.value.copyWith.steps.removeAt(index);
              },
              child: StepWidget(
                key: Key(s.name + index.toString()),
                step: s,
                scenario: scenario.value,
                onChanged: (step) {
                  scenario.value = scenario.value.copyWith.steps.replace(
                    index,
                    step,
                  );
                },
                onClosed: () {
                  scenario.value = scenario.value.copyWith(
                    saveCounter: scenario.value.forceRenderCounter + 1,
                  );
                },
              ),
            );
          },
        ),
        StepSelector(
          stepAdded:
              (s) => scenario.value = scenario.value.copyWith.steps.add(s),
        ),
      ],
    );
  }
}

class StepSelectorDialog extends StatelessWidget {
  const StepSelectorDialog({super.key});

  @override
  Widget build(BuildContext context) {
    void addStep(Block block) {
      Navigator.of(context).pop(s.Step("", TagCondition.enter, block));
    }

    return SimpleDialog(
      title: const Text("Select Block Type to add as a step"),
      children: [
        ListTile(
          title: const Text("Simple Button Block"),
          subtitle: const Text(
            "Text with a Button to go next step. Best used for instructions for the players.",
          ),
          onTap:
              () => addStep(const NextButtonBlock(endsGame: false, text: "")),
        ),
        ListTile(
          title: const Text("Timer Block"),
          subtitle: const Text(
            "Timer with min and max seconds. Used for waiting periods or automated next triggers.",
          ),
          onTap:
              () => addStep(
                const TimerBlock(
                  text: "",
                  minTimer: Duration(seconds: 0),
                  maxTimer: Duration(seconds: 0),
                ),
              ),
        ),
        ListTile(
          title: const Text("Player Voting Block"),
          subtitle: const Text(
            "Block used for player votings. Best used for votes. Democracy yay",
          ),
          onTap:
              () => addStep(
                const PlayerVotingBlock(
                  text: "",
                  votingTargetPossibilities: TagFilter.empty,
                  setTags: Tags([]),
                ),
              ),
        ),
        ListTile(
          title: const Text("Single / Multi Choice Voting Block"),
          subtitle: const Text(
            "Block used for letting a player make a single or multi choice.",
          ),
          onTap:
              () => addStep(
                const ChoiceVotingBlock(
                  text: "",
                  choices: [],
                  maxMultiselect: 1,
                  minMultiselect: 1,
                ),
              ),
        ),

        ListTile(
          title: const Text("Change Tag Block"),
          subtitle: const Text(
            "Block without UI, but usable to add or remove tags of players and the game itself.",
          ),
          onTap: () => addStep(const ChangeTagBlock(tags: [])),
        ),

        ListTile(
          title: const Text("Group Block"),
          subtitle: const Text(
            "Simple Block that contains multiple Steps grouped.",
          ),
          onTap: () => addStep(const GroupBlock(text: "", steps: [])),
        ),

        ListTile(
          title: const Text("Single Execution Block"),
          subtitle: const Text(
            "Simple Block that contains multiple Steps grouped. But executes only once per rotation.",
          ),
          onTap:
              () => addStep(
                const SingleChildExecutorBlock(
                  text: "",
                  steps: [],
                  randomOrder: false,
                  removeExecuted: true,
                  refillWhenEmpty: true,
                ),
              ),
        ),
      ],
    );
  }
}

class StepSelector extends StatelessWidget {
  const StepSelector({super.key, required this.stepAdded});

  final Function(s.Step step) stepAdded;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          FilledButton.icon(
            label: Text("Paste"),
            onPressed: () async {
              final plain =
                  (await Clipboard.getData(Clipboard.kTextPlain))?.text;
              if (plain == null) {
                //TODO: Show error to user
                return;
              }
              try {
                final res = s.StepMapper.fromJson(plain);
                stepAdded(res);
              } catch (e) {
                //TODO: Show error to user
                return;
              }
            },
            icon: const Icon(Icons.paste),
          ),
          FilledButton.icon(
            label: Text("Add"),
            onPressed: () async {
              final res = await showDialog(
                context: context,
                builder: (context) => const StepSelectorDialog(),
              );
              if (res is s.Step) {
                stepAdded(res);
              }
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
    );
  }
}
