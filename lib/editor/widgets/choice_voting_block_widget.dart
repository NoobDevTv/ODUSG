import 'package:darq/darq.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/dynamic_logic/choice_voting_block.dart';
import 'package:odusg/editor/widgets/block_widget.dart';
import 'package:odusg/editor/widgets/tag_selector.dart';
import 'package:odusg/events/tags.dart';

class ChoiceVotingBlockWidget extends BlockWidget<ChoiceVotingBlock> {
  const ChoiceVotingBlockWidget({
    super.key,
    required super.block,
    required super.scenario,
    required super.step,
  });

//TODO: Do not allow a minimum or maximum above count of available choices
  @override
  List<Widget> listBuild(
    BuildContext context,
    ValueNotifier<ChoiceVotingBlock> b,
  ) {
    final minValController = useTextEditingController(
      text: currentBlock.minMultiselect.toString(),
    );
    final minError = useState<String?>(null);
    final maxValController = useTextEditingController(
      text: currentBlock.maxMultiselect.toString(),
    );
    final maxError = useState<String?>(null);

    final minVal = useState(currentBlock.minMultiselect);
    final maxVal = useState(currentBlock.maxMultiselect);

    final choicesList = useState<List<Choice>>(b.value.choices);

    return [
      ListTile(
        title: TextField(
          controller: minValController,
          keyboardType: const TextInputType.numberWithOptions(),
          autocorrect: false,
          onChanged: (value) {
            _validate(value, true, minError, maxError, minVal, maxVal.value, b);
          },
          decoration: InputDecoration(
            labelText: "Mininmal required Selections",
            errorText: minError.value,
          ),
        ),
      ),
      ListTile(
        title: TextField(
          controller: maxValController,
          keyboardType: const TextInputType.numberWithOptions(),
          autocorrect: false,
          onChanged: (value) {
            _validate(value, false, maxError, minError, maxVal, minVal.value, b);
          },
          decoration: InputDecoration(
            labelText: "Maximal allowed Selections",
            errorText: maxError.value,
          ),
        ),
      ),
      Divider(),
      ListTile(title: Text("Possible Choices:")),
      ReorderableListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          final choice = choicesList.value[index];
          final key = ObjectKey(choice);
          return Dismissible(
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
            onDismissed:
                (direction) =>
                    choicesList.value =
                        choicesList.value.exclude(choice).toList(),
            key: key,
            child: ListTile(
              key: key,
              title: Text(choice.text),
              subtitle: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children:
                      choice.tags.map((x) => Chip(label: Text(x.tag))).toList(),
                ),
              ),
              onTap: () async {
                final newChoice = await _choiceDialog(context, choice);
                if (newChoice == null) return;
                final copy = choicesList.value.toList();
                copy[copy.indexOf(choice)] = newChoice;
                choicesList.value = copy;            
                b.value = b.value.copyWith(choices: choicesList.value);
              },
            ),
          );
        },
        itemCount: choicesList.value.length,
        onReorder: (oldIndex, newIndex) {
          final newList = choicesList.value.toList();
          if (oldIndex < newIndex) {
            newIndex -= 1;
          }
          final item = newList.removeAt(oldIndex);
          newList.insert(newIndex, item);
          choicesList.value = newList;
        },
      ),
      ListTile(
        title: IconButton(
          onPressed: () async {
            final newChoice = await _choiceDialog(context, null);
            if (newChoice == null) return;
            choicesList.value = [...choicesList.value, newChoice];
            b.value = b.value.copyWith(choices: choicesList.value);
          },

          icon: const Icon(Icons.add),
        ),
      ),
    ];
  }

  Future<Choice?> _choiceDialog(BuildContext context, [Choice? choice]) async {
    final dialog = AlertDialog(
      title: Text(choice == null ? "Add new Choice" : "Edit Choice"),
      content: HookBuilder(
        builder: (context) {
          final newChoice = useState(
            choice?.copyWith() ?? Choice(tags: [], text: ""),
          );
          final textController = useTextEditingController(
            text: newChoice.value.text.toString(),
          );
          return Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ListTile(
                title: TextField(
                  controller: textController,
                  decoration: InputDecoration(labelText: "Choice Text"),

                  autocorrect: false,
                  onChanged: (value) {
                    newChoice.value = newChoice.value.copyWith(text: value);
                  },
                ),
              ),
              SingleChildScrollView(child: Wrap(children: [])),
              TagSelector(
                selectableTags: scenario.availableGameTags,
                selectedTags: newChoice.value.tags,
                allowAddingNewTags: true,
                scenario: scenario,
                onTagSelectionChanged: ((Tag, bool) selected) {
                  newChoice.value =
                      (selected.$2
                          ? newChoice.value.copyWith.tags.add(selected.$1)
                          : newChoice.value.copyWith.tags.removeAt(
                            newChoice.value.tags.indexOf(selected.$1),
                          ));
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, newChoice.value),
                    child: Text("Save"),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, null),
                    child: Text("Cancel"),
                  ),
                ],
              ),
            ],
          );
        },
      ),
    );

    final res = await showDialog(
      context: context,
      builder: (context) => dialog,
    );

    return res;
  }

  void _validate(
    String value,
    bool smallerValue,
    ValueNotifier<String?> error,
    ValueNotifier<String?> otherError,
    ValueNotifier<int> mainValue,
    int otherValue,
    ValueNotifier<ChoiceVotingBlock> b,
  ) {
    final val = int.tryParse(value);
    if (val == null) {
      error.value = "Please insert an integer";
      return;
    }
    if (val.sign <= 0) {
      error.value = "Only positive integers are allowed";
      return;
    }
    mainValue.value = val;
    if ((smallerValue && val > otherValue) ||
        (!smallerValue && val < otherValue)) {
      error.value =
          "Please insert a value ${smallerValue ? 'smaller' : 'bigger'} than the ${smallerValue ? 'max' : 'min'} allowed $otherValue";
      return;
    }
    if (otherError.value?.contains("timer") ?? false) {
      otherError.value = null;
    }
    error.value = null;
    if (otherError.value == null && error.value == null) {
      b.value = b.value.copyWith(
        minMultiselect: smallerValue ? mainValue.value : otherValue,
        maxMultiselect: smallerValue ? otherValue : mainValue.value,
      );
    }
  }
}
