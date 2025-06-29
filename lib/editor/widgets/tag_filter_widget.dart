import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/dynamic_logic/condition_operator.dart';
import 'package:odusg/dynamic_logic/tag_condition.dart';

class TagFilterWidget extends HookWidget {
  const TagFilterWidget({
    super.key,
    required this.tagFilter,
    required this.label,
    this.hintText,
    required this.onChanged,
  });

  final TagFilter? tagFilter;
  final Widget label;
  final String? hintText;
  final void Function(TagFilter? newFilter) onChanged;

  @override
  Widget build(BuildContext context) {
    final filterController = useTextEditingController(
      text: tagFilter?.toString() ?? "",
    );
    final filterError = useState<String?>(null);

    final f = tagFilter;
    if (f == null) return const SizedBox();

    List<Widget> widgets = [];

    for (var i = 0; i < f.operands.length; i++) {
      if (i > 0) {
        widgets.add(
          MenuAnchor(
            menuChildren:
                ConditionOperator.values
                    .skip(1)
                    .map(
                      (op) => MenuItemButton(
                        onPressed: () {
                          final newTag = f.copyWith(
                            conditionOperators: [
                              ...f.conditionOperators.take(i - 1),
                              op,
                              ...f.conditionOperators.skip(i),
                            ],
                          );
                          onChanged(newTag);
                        },
                        child: Text(op.representation + " (${op.name})"),
                      ),
                    )
                    .toList(),
            builder:
                (context, controller, child) => GestureDetector(
                  onTap: () {
                    if (controller.isOpen)
                      controller.close();
                    else
                      controller.open();
                  },
                  child: Chip(
                    label: Text(f.conditionOperators[i - 1].representation),
                  ),
                ),
          ),
        );
      }
      widgets.add(
        MenuAnchor(
          menuChildren: [
            MenuItemButton(onPressed: () {}, child: Text("Test")),
            MenuItemButton(onPressed: () {}, child: Text("Test 2")),
          ],
          builder:
              (context, controller, child) => GestureDetector(
                onTap: () {
                  if (controller.isOpen)
                    controller.close();
                  else
                    controller.open();
                },
                onDoubleTap: () {
                  final newTag = f.copyWith(
                    modifiers: [
                      ...f.modifiers.take(i),
                      f.modifiers[i] == TagModifier.none
                          ? TagModifier.invert
                          : TagModifier.none,
                      ...f.modifiers.skip(i + 1),
                    ],
                  );
                  onChanged(newTag);
                },
                child: Chip(
                  label: Text(
                    (f.modifiers[i].representation == "!" ? "not " : "") +
                        f.operands[i],
                  ),
                ),
              ),
        ),
      );
    }
    return Row(children: widgets);

    return TextField(
      controller: filterController,
      onEditingComplete: () {
        try {
          final newFilter = TagFilter.parse(filterController.text);
          onChanged(newFilter);
          filterError.value = null;
        } catch (e) {
          filterError.value = e.toString();
        }
      },
      decoration: InputDecoration(
        label: label,
        error: filterError.value == null ? null : Text(filterError.value!),
        hintText: hintText,
      ),
    );
  }
}
