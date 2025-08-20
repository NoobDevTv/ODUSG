import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/dynamic_logic/condition_operator.dart';
import 'dart:async';

import 'package:odusg/dynamic_logic/tag_condition.dart';
import 'package:odusg/events/tags.dart';
import 'package:odusg/models/scenario.dart';

enum _SelectedType { operand, conditionOperator, tagOperator }

class EditableChipPage<TOperand> extends HookWidget {
  const EditableChipPage({
    super.key,
    required this.tagEntryBase,
    required this.scenario,
  });

  final TagEntryBase<TOperand> tagEntryBase;
  final Scenario scenario;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: EditableChips<TOperand>(
            scenario: scenario,
            tagEntryBase: tagEntryBase,
            readonly: true,
          ),
        ),
        IconButton(
          onPressed: () async {
            final d = Action(
              title: Text("Edit"),
              children: [
                EditableChips<TOperand>(
                  scenario: scenario,
                  tagEntryBase: tagEntryBase,
                  readonly: false,
                ),
              ],
            );
          },
          icon: Icon(Icons.edit),
        ),
      ],
    );
  }
}

class EditableChips<TOperand> extends HookWidget {
  const EditableChips({
    super.key,
    required this.tagEntryBase,
    required this.scenario,
    this.readonly = false,
  });

  final TagEntryBase<TOperand> tagEntryBase;
  final Scenario scenario;
  final bool readonly;

  //TODO:
  // Add new dialog,
  //at top the result,
  //center the chips,
  //bottom a textfield for filtering and adding new tags (Order tbd)
  // Make Dialog already with Entry Filtering in mind for reusability
  // Toggle the Chips Not / not not with a single select on the chip, as it is intended by material design

  @override
  Widget build(BuildContext context) {
    final filterUI = tagEntryBase.runtimeType == TagFilter;
    final f = useState(tagEntryBase);
    useEffect(() {
      f.value = tagEntryBase;
      return null;
    }, [tagEntryBase]);

    List<Widget> widgets = [];
    final selectedChip = useState<(int?, _SelectedType)>((
      null,
      _SelectedType.operand,
    ));
    final filterText = useState("");
    final globalTags = useState(false);
    final addAsNot = useState(false);
    final filterTextController = useTextEditingController();

    final isOperandSelected = selectedChip.value.$2 == _SelectedType.operand;
    final selectedIdx = selectedChip.value.$1;

    for (var i = 0; i < f.value.operands.length; i++) {
      if (i > 0) {
        if (filterUI) {
          widgets.add(
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8.0),
              child: InputChip(
                label: Text(f.value.conditionOperators[i - 1].representation),
                onSelected:
                    readonly
                        ? (_) {}
                        : (value) =>
                            selectedChip.value =
                                value
                                    ? (i, _SelectedType.conditionOperator)
                                    : (null, _SelectedType.operand),
                selected: selectedIdx == i && !isOperandSelected,
              ),
            ),
          );
        } else {
          final ourIdx = (i / 2).toInt();
          if (i % 2 == 1) {
            widgets.add(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InputChip(
                  label: Text(f.value.operators[ourIdx].representation),
                  onSelected:
                      readonly
                          ? (_) {}
                          : (value) =>
                              selectedChip.value =
                                  value
                                      ? (i, _SelectedType.tagOperator)
                                      : (null, _SelectedType.operand),
                  selected: selectedIdx == i && !isOperandSelected,
                ),
              ),
            );
          } else {
            widgets.add(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InputChip(
                  label: Text(
                    f.value.conditionOperators[ourIdx].representation,
                  ),
                  onSelected:
                      readonly
                          ? (_) {}
                          : (value) =>
                              selectedChip.value =
                                  value
                                      ? (i, _SelectedType.conditionOperator)
                                      : (null, _SelectedType.operand),
                  selected: selectedIdx == i && !isOperandSelected,
                ),
              ),
            );
          }
        }
      }
      widgets.add(
        InputChip(
          deleteIcon: readonly ? null : Icon(Icons.delete),
          onDeleted:
              readonly
                  ? null
                  : () {
                    f.value = f.value.copyWith.modifiers
                        .removeAt(i)
                        .copyWith
                        .operands
                        .removeAt(i)
                        .copyWith
                        .conditionOperators
                        .removeAt(i == 0 ? i : i - 1);
                  },
          onSelected:
              readonly
                  ? (_) {}
                  : (value) {
                    if (value) {
                      selectedChip.value = (i, _SelectedType.operand);
                      filterTextController.text =
                          filterText.value = f.value.operands[i]
                              .toString()
                              .replaceFirst("player.", "")
                              .replaceFirst("game.", "");
                    } else {
                      selectedChip.value = (null, _SelectedType.operand);
                      filterTextController.text = filterText.value = "";
                    }
                  },
          selected: selectedIdx == i && isOperandSelected,
          label: Text(
            (f.value.modifiers.length > i
                    ? (f.value.modifiers[i].representation == "!" ? "not " : "")
                    : "") +
                f.value.operands[i].toString(),
          ),
        ),
      );
    }

    final List<String> allTags;
    switch (selectedChip.value.$2) {
      case _SelectedType.operand:
        allTags = scenario.availableGameTags.map((x) => x.tag).toList();
        allTags.addAll(scenario.roles.map((x) => "role.${x.tag}"));
        break;
      case _SelectedType.conditionOperator:
        allTags =
            ConditionOperator.values
                .skip(1)
                .map((x) => x.representation)
                .toList();
        break;
      case _SelectedType.tagOperator:
        allTags =
            TagOperator.values.skip(1).map((x) => x.representation).toList();
        break;
    }

    final availableChips =
        allTags
            .where(
              (x) =>
                  !isOperandSelected ||
                  ((globalTags.value ? !x.startsWith("role.") : true) &&
                      (filterText.value.isEmpty ||
                          x.contains(RegExp(filterText.value)))),
            )
            .map(
              (x) => Padding(
                padding: const EdgeInsets.only(right: 8.0, bottom: 8.0),
                child: FilterChip(
                  label: Text(x),
                  onSelected:
                      readonly
                          ? null
                          : (sel) {
                            _addTagToOutput(
                              globalTags,
                              x,
                              f,
                              selectedIdx,
                              selectedChip,
                              filterUI,
                              addAsNot,
                            );
                          },
                ),
              ),
            )
            .toList();
    if (readonly) return Wrap(children: widgets);

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(children: widgets),
        const SizedBox(height: 16),
        if (isOperandSelected)
          SwitchListTile(
            title: Text("Global Tags"),
            value: globalTags.value,
            onChanged: (value) => globalTags.value = value,
          ),
        if (selectedIdx == null && isOperandSelected && filterUI)
          SwitchListTile(
            title: Text('Add as "not"'),
            value: addAsNot.value,
            onChanged: (value) => addAsNot.value = value,
          )
        else if (isOperandSelected && filterUI)
          ListTile(
            title: Text('Toggle "Not" on Selected Tag'),
            onTap: () {
              final current = f.value.modifiers[selectedIdx!];
              f.value = f.value.copyWith.modifiers.replace(
                selectedIdx,
                current == TagModifier.none
                    ? TagModifier.invert
                    : TagModifier.none,
              );
            },
          ),
        Container(
          constraints: BoxConstraints(maxHeight: 140),
          child: SingleChildScrollView(child: Wrap(children: availableChips)),
        ),
        if (isOperandSelected)
          ListTile(
            title: TextField(
              onChanged: (value) => filterText.value = value,
              decoration: InputDecoration(
                hintText: "Filter available tags or add a new one",
                labelText: "Add or filter",
              ),
              onSubmitted:
                  selectedIdx != null
                      ? null
                      : (value) {
                        if (value.isEmpty) return;
                        _createNewTag(
                          filterText,
                          filterTextController,
                          globalTags,
                          f,
                          selectedIdx,
                          selectedChip,
                          filterUI,
                          addAsNot,
                        );
                      },
              controller: filterTextController,
            ),
            trailing: IconButton(
              onPressed:
                  filterText.value.isEmpty
                      ? null
                      : () {
                        _createNewTag(
                          filterText,
                          filterTextController,
                          globalTags,
                          f,
                          selectedIdx,
                          selectedChip,
                          filterUI,
                          addAsNot,
                        );
                      },
              icon: Icon(Icons.add),
            ),
          ),
      ],
    );
  }

  void _createNewTag(
    ValueNotifier<String> filterText,
    TextEditingController filterTextController,
    ValueNotifier<bool> globalTags,
    ValueNotifier<TagEntryBase<dynamic>> f,
    int? selectedIdx,
    ValueNotifier<(int?, _SelectedType)> selectedChip,
    bool filterUI,
    ValueNotifier<bool> addAsNot,
  ) {
    final tag = Tag(
      filterText.value,
      tagType: globalTags.value ? TagType.global : TagType.player,
    );
    scenario.availableGameTags.add(tag);

    filterText.value = filterTextController.text = "";
    _addTagToOutput(
      globalTags,
      tag.tag,
      f,
      selectedIdx,
      selectedChip,
      filterUI,
      addAsNot,
    );
  }

  void _addTagToOutput(
    ValueNotifier<bool> globalTags,
    String x,
    ValueNotifier<TagEntryBase<dynamic>> f,
    int? selectedIdx,
    ValueNotifier<(int?, _SelectedType)> selectedChip,
    bool filterUI,
    ValueNotifier<bool> addAsNot,
  ) {
    final op = "${globalTags.value ? "game." : "player."}$x" as TOperand;
    final newValue = f.value.copyWith.conditionOperators
        .skip(0)
        .copyWith
        .modifiers
        .skip(0)
        .copyWith
        .operands
        .skip(0)
        .copyWith
        .operators
        .skip(0);

    if (selectedIdx != null) {
      switch (selectedChip.value.$2) {
        case _SelectedType.operand:
          newValue.operands[selectedIdx] = op;
          break;
        case _SelectedType.conditionOperator:
          final co = ConditionOperator.values.firstWhere(
            (y) => y.representation == x,
          );
          if (filterUI) {
            newValue.conditionOperators[selectedIdx - 1] = co;
          } else {
            newValue.conditionOperators[(selectedIdx / 2).toInt()] = co;
          }
          break;
        case _SelectedType.tagOperator:
          final to = TagOperator.values.firstWhere(
            (y) => y.representation == x,
          );
          if (filterUI) {
            newValue.operators[selectedIdx - 1] = to;
          } else {
            newValue.operators[(selectedIdx / 2).toInt()] = to;
          }
          break;
      }
    } else {
      newValue.operands.add(op);
      if (f.value.operands.isNotEmpty) {
        newValue.conditionOperators.add(ConditionOperator.and);
      }
      if (filterUI) {
        newValue.modifiers.add(
          addAsNot.value ? TagModifier.invert : TagModifier.none,
        );
      } else {
        newValue.operators.add(TagOperator.equals);
      }
    }
    f.value = newValue;
  }
}
