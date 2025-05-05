import 'package:flutter/material.dart';
import 'package:odusg/dynamic_logic/block.dart';
import 'package:odusg/dynamic_logic/step.dart' as s;
import 'package:odusg/dynamic_logic/tag_condition.dart';
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
            final key = Key(s.name + index.toString());

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
                onChanged: (step) {
                  scenario.value = scenario.value.copyWith.steps.replace(
                    index,
                    step,
                  );
                },
              ),
            );
          },
        ),
        ListTile(
          title: IconButton(
            onPressed: () {
              final dialog = SimpleDialog(
                children: _selectBlockDialog(context),
                title: Text("Select Block Type to add as a step"),
              );
              showDialog(context: context, builder: (context) => dialog);
              // final newState = assignables.value.toList();
              // newState.add((0, 0, 0));
              // assignables.value = newState;
              // roleState.value = roleState.value.copyWith(
              //   getAssignableAmount: newState,
              // );
            },
            icon: const Icon(Icons.add),
          ),
        ),
      ],
    );
  }

  List<Widget> _selectBlockDialog(BuildContext context) {
    void addStep(Block block) {
      scenario.value = scenario.value.copyWith.steps.add(
        s.Step("", TagCondition.enter, block),
      );
      Navigator.of(context).pop();
    }

    /*
          NextButtonBlock b => NextButtonBlockWidget(block: b),
          TimerBlock b => TimerBlockWidget(block: b),
          PlayerVotingBlock b => PlayerVotingBlockWidget(block: b),
          ChangeTagBlock b => ChangeTagBlockWidget(block: b),
     */
    return [
      ListTile(
        title: Text("Simple Button Block"),
        subtitle: Text(
          "Text with a Button to go next step. Best used for instructions for the players.",
        ),
        onTap: () => addStep(const NextButtonBlock(endsGame: false, text: "")),
      ),
      ListTile(
        title: Text("Timer Block"),
        subtitle: Text(
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
        title: Text("Voting Block"),
        subtitle: Text(
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
        title: Text("Change Tag Block"),
        subtitle: Text(
          "Block without UI, but usable to add or remove tags of players and the game itself.",
        ),
        onTap: () => addStep(const ChangeTagBlock(tags: [])),
      ),
    ];
  }
}
