import 'package:flutter/material.dart';
import 'package:odusg/editor/widgets/step_widget.dart';
import 'package:odusg/models/scenario.dart';

class StepsEdit extends StatelessWidget {
  const StepsEdit({super.key, required this.scenario});

  final ValueNotifier<Scenario> scenario;

  @override
  Widget build(BuildContext context) {
    return ReorderableListView.builder(
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
        return StepWidget(
          key: Key(s.name + index.toString()),
          step: s,
          onChanged: (step) {
            scenario.value = scenario.value.copyWith.steps.replace(index, step);
          },
        );
      },
    );
  }
}
