import 'package:flutter/material.dart';
import 'package:odusg/dynamic_logic/block_types.dart';
import 'package:odusg/dynamic_logic/step.dart' as s;
import 'package:odusg/editor/steps_edit.dart';
import 'package:odusg/editor/widgets/block_widget.dart';
import 'package:odusg/editor/widgets/step_widget.dart';

class SingleChildExecutorBlockWidget
    extends BlockWidget<SingleChildExecutorBlock> {
  const SingleChildExecutorBlockWidget({
    super.key,
    required super.block,
    required super.scenario,
    required super.step,
  });

  @override
  List<Widget> listBuild(
    BuildContext context,
    ValueNotifier<SingleChildExecutorBlock> block,
  ) {
    final removeStep = !block.value.randomOrder || block.value.removeExecuted;
    return [
      Divider(),
      CheckboxListTile(
        title: Text("In Random Order"),
        value: block.value.randomOrder,
        onChanged:
            (value) =>
                block.value = block.value.copyWith(randomOrder: value ?? false),
      ),
      CheckboxListTile(
        title: Text("Remove Step after Execution"),
        value: removeStep,
        onChanged:
            !block.value.randomOrder
                ? null
                : (value) =>
                    block.value = block.value.copyWith(
                      removeExecuted: value ?? false,
                    ),
      ),
      CheckboxListTile(
        title: Text("Refill when no steps left"),
        value: removeStep && block.value.refillWhenEmpty,
        onChanged:
            removeStep
                ? (value) =>
                    block.value = block.value.copyWith(
                      refillWhenEmpty: value ?? false,
                    )
                : null,
      ),
      Divider(),
      ListTile(title: Text("Steps: ")),
      ReorderableListView.builder(
        shrinkWrap: true,
        onReorder: (oldIndex, newIndex) {
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }

          final newOrder = block.value.steps.toList();

          final item = newOrder.removeAt(oldIndex);
          newOrder.insert(newIndex, item);
          block.value = block.value.copyWith(steps: newOrder);
        },
        itemCount: block.value.steps.length,
        itemBuilder: (context, index) {
          final s = block.value.steps[index];
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
              block.value = block.value.copyWith.steps.removeAt(index);
            },
            child: StepWidget(
              key: Key(s.name + index.toString()),
              step: s,
              scenario: scenario,
              onChanged: (step) {
                block.value = block.value.copyWith.steps.replace(index, step);
              },
            ),
          );
        },
      ),
      ListTile(
        title: IconButton(
          onPressed: () async {
            final res = await showDialog(
              context: context,
              builder: (context) => const StepSelectorDialog(),
            );
            if (res is s.Step) {
              block.value = block.value.copyWith.steps.add(res);
            }
          },
          icon: const Icon(Icons.add),
        ),
      ),
    ];
  }
}
