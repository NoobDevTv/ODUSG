import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/dynamic_logic/condition_operator.dart';

import 'package:odusg/dynamic_logic/tag_condition.dart';
import 'package:odusg/events/tags.dart';
import 'package:odusg/models/scenario.dart';

enum _SelectedType { operand, conditionOperator, tagOperator, constant }

class EditableChipPage<TOperand> extends HookWidget {
  const EditableChipPage({
    super.key,
    required this.tagEntryBase,
    required this.scenario,
    required this.onSaved,
  });

  final TagEntryBase<TOperand> tagEntryBase;
  final Function(TagEntryBase<TOperand> tagEntryBase) onSaved;
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
            final d = HookBuilder(
              builder: (context) {
                final ourTag = useState(tagEntryBase);
                return AlertDialog(
                  title: Text("Edit"),
                  content: EditableChips<TOperand>(
                    scenario: scenario,
                    tagEntryBase: tagEntryBase,
                    readonly: false,
                    onChanged:
                        (changedTagEntryBase) =>
                            ourTag.value = changedTagEntryBase,
                    onClose: (changedTagEntryBase, save) {
                      if (!changedTagEntryBase.isValid || save != true) return;

                      onSaved(changedTagEntryBase);
                    },
                  ),
                  actions: [
                    TextButton(
                      onPressed:
                          ourTag.value.isValid
                              ? () {
                                //Store f into scenario
                                Navigator.pop(context, true);
                              }
                              : null,
                      child: Text("Save"),
                    ),
                  ],
                );
              },
            );
            final res = await showDialog(
              context: context,
              builder: (context) => d,
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
    this.onClose,
    this.onChanged,
  });

  final TagEntryBase<TOperand> tagEntryBase;
  final Scenario scenario;
  final bool readonly;
  final Function(TagEntryBase<TOperand> changedTagEntryBase, bool? save)?
  onClose;
  final Function(TagEntryBase<TOperand> changedTagEntryBase)? onChanged;

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
    final editConstantValue = selectedChip.value.$2 == _SelectedType.constant;
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
                selected:
                    selectedIdx == i &&
                    !(isOperandSelected || editConstantValue),
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
                  selected:
                      selectedIdx == i &&
                      !(isOperandSelected || editConstantValue),
                ),
              ),
            );
          } else {
            widgets.add(
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 8.0),
                child: InputChip(
                  label: Text(
                    f
                        .value
                        .conditionOperators[(ourIdx / 2).toInt()]
                        .representation,
                  ),
                  onSelected:
                      readonly
                          ? (_) {}
                          : (value) =>
                              selectedChip.value =
                                  value
                                      ? (i, _SelectedType.conditionOperator)
                                      : (null, _SelectedType.operand),
                  selected:
                      selectedIdx == i &&
                      !(isOperandSelected || editConstantValue),
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
                    if (filterUI) {
                      f.value = f.value.copyWith.modifiers
                          .removeAt(i)
                          .copyWith
                          .operands
                          .removeAt(i)
                          .copyWith
                          .conditionOperators
                          .removeAt(i == 0 ? i : i - 1);
                    } else {
                      final opIdx = (f.value.operands.length / 2).toInt() - 1;
                      final copy =
                          f.value.copyWith.operands.removeAt(i).copyWith;
                      if (f.value.conditionOperators.length ==
                          f.value.operators.length) {
                        f.value = copy.conditionOperators.removeAt(opIdx);
                      } else {
                        f.value = copy.operators.removeAt(opIdx);
                      }
                    }
                    onChanged?.call(f.value);
                  },
          onSelected:
              readonly
                  ? (_) {}
                  : (value) {
                    if (value) {
                      final val = f.value.operands[i].toString();
                      selectedChip.value = (
                        i,
                        val.contains(".")
                            ? _SelectedType.operand
                            : _SelectedType.constant,
                      );
                      filterTextController.text =
                          filterText.value = val
                              .replaceFirst("player.", "")
                              .replaceFirst("game.", "");
                    } else {
                      selectedChip.value = (null, _SelectedType.operand);
                      filterTextController.text = filterText.value = "";
                    }
                  },
          selected:
              selectedIdx == i && (isOperandSelected || editConstantValue),
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
      case _SelectedType.constant:
        allTags = [];
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
                              false,
                            );
                          },
                ),
              ),
            )
            .toList();
    if (readonly) return Wrap(children: widgets);

    return PopScope(
      onPopInvokedWithResult: (didPop, result) {
        if (didPop) {
          onClose?.call(f.value, result as bool?);
        }
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SingleChildScrollView(child: Wrap(children: widgets)),
          Text(f.value.toString()),
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
          if (isOperandSelected || editConstantValue)
            ListTile(
              title: TextField(
                onChanged: (value) => filterText.value = value,
                decoration:
                    editConstantValue
                        ? InputDecoration(hintText: "Amount of tag occurences")
                        : InputDecoration(
                          hintText: "Filter available tags or add a new one",
                          labelText: "Add or filter",
                        ),
                keyboardType: editConstantValue ? TextInputType.number : null,
                inputFormatters:
                    editConstantValue
                        ? [FilteringTextInputFormatter.digitsOnly]
                        : null,
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
                            editConstantValue,
                          );
                        },
                controller: filterTextController,
              ),
              trailing:
                  !editConstantValue
                      ? null
                      : IconButton(
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
                                    editConstantValue,
                                  );
                                },
                        icon: Icon(Icons.check),
                      ),
            ),

          if (selectedIdx == null)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                if (!filterUI && int.tryParse(filterText.value) != null)
                  Flexible(
                    flex: 1,
                    fit: FlexFit.tight,
                    child: FilledButton.tonal(
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
                                  true,
                                );
                              },
                      child: Text("Add as constant"),
                    ),
                  )
                else
                  Spacer(flex: 1),
                const SizedBox(width: 16),
                Flexible(
                  child: FilledButton.tonal(
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
                                editConstantValue,
                              );
                            },
                    child: Text("Add as tag"),
                  ),
                ),
              ],
            ),
        ],
      ),
    );
  }

  void _createNewTag(
    ValueNotifier<String> filterText,
    TextEditingController filterTextController,
    ValueNotifier<bool> globalTags,
    ValueNotifier<TagEntryBase<TOperand>> f,
    int? selectedIdx,
    ValueNotifier<(int?, _SelectedType)> selectedChip,
    bool filterUI,
    ValueNotifier<bool> addAsNot,
    bool editConstantValue,
  ) {
    final String val;
    if (editConstantValue) {
      val = filterText.value.replaceFirst(RegExp("^0+"), "");
    } else {
      final tag = Tag(
        filterText.value,
        tagType: globalTags.value ? TagType.global : TagType.player,
      );
      scenario.availableGameTags.add(tag);
      val = tag.tag;
      filterText.value = filterTextController.text = "";
    }

    _addTagToOutput(
      globalTags,
      val,
      f,
      selectedIdx,
      selectedChip,
      filterUI,
      addAsNot,
      editConstantValue,
    );
  }

  void _addTagToOutput(
    ValueNotifier<bool> globalTags,
    String x,
    ValueNotifier<TagEntryBase<TOperand>> f,
    int? selectedIdx,
    ValueNotifier<(int?, _SelectedType)> selectedChip,
    bool filterUI,
    ValueNotifier<bool> addAsNot,
    bool editConstantValue,
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
            newValue.conditionOperators[(selectedIdx / 2).toInt() - 1] = co;
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
        case _SelectedType.constant:
          newValue.operands[selectedIdx] = x as TOperand;
          break;
      }
    } else {
      newValue.operands.add(!editConstantValue ? op : x as TOperand);
      if (f.value.operands.isNotEmpty) {
        if (filterUI || newValue.operands.length % 2 == 1) {
          newValue.conditionOperators.add(ConditionOperator.and);
        }
      }
      if (filterUI) {
        newValue.modifiers.add(
          addAsNot.value ? TagModifier.invert : TagModifier.none,
        );
      } else if (newValue.operands.length % 2 == 0) {
        newValue.operators.add(TagOperator.equals);
      }
    }
    f.value = newValue;
    onChanged?.call(f.value);
  }
}
