import 'dart:collection';

import 'package:darq/darq.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/dynamic_logic/block.dart';
import 'package:odusg/dynamic_logic/tag_condition.dart';
import 'package:odusg/models/scenario.dart';

class BaseBlockWidget extends HookWidget {
  const BaseBlockWidget({
    super.key,
    required this.block,
    required this.scenario,
  });
  final Block block;
  final Scenario scenario;

  @override
  Widget build(BuildContext context) {
    final b = useState(block);
    useEffect(() {
      b.value = block;
      return null;
    }, [block]);
    final textController = useTextEditingController(text: block.text);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: TextField(
            controller: textController,
            decoration: const InputDecoration(
              labelText: "Display Text",
              hintText: "The text to show during gameplay",
            ),
          ),
        ),
        CheckboxListTile(
          value: b.value.cover,
          title: const Text("Display Cover"),
          onChanged: (v) => b.value = b.value.copyWith(cover: v ?? false),
        ),
        CheckboxListTile(
          value: b.value.cover,
          title: const Text("Execute for each player"),
          onChanged:
              (v) => b.value = b.value.copyWith(foreachPlayer: v ?? false),
        ),
        Divider(),
        Column(
          children: [
            ...b.value.perTagText.entries.map(
              (entry) => ListTile(
                onTap:
                    () => openPerTagTextEditDialog(
                      context,
                      entry.key,
                      entry.value,
                    ).then((value) {
                      if (value == null) return;
                      b.value = b.value.copyWith.perTagText.replace(
                        value.$1,
                        value.$2,
                      );
                    }),
                trailing: IconButton(
                  onPressed:
                      () =>
                          b.value = b.value.copyWith.perTagText.remove(
                            entry.key,
                          ),
                  icon: const Icon(Icons.delete_forever),
                ),
                title: Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 16.0),
                      child: Text(entry.key),
                    ),
                    Flexible(
                      child: Text(
                        entry.value,
                        overflow: TextOverflow.ellipsis,
                        maxLines: 1,
                      ),
                    ),
                  ],
                  mainAxisSize: MainAxisSize.min,
                ),
              ),
            ),
            ListTile(
              title: IconButton(
                onPressed: () {
                  openPerTagTextEditDialog(context, "", "").then((value) {
                    if (value == null) return;
                    b.value = b.value.copyWith.perTagText.put(
                      value.$1,
                      value.$2,
                    );
                  });
                },
                icon: const Icon(Icons.add),
              ),
            ),
          ],
        ),
        switch (block) {
          NextButtonBlock b => NextButtonBlockWidget(block: b),
          TimerBlock b => TimerBlockWidget(block: b),
          PlayerVotingBlock b => PlayerVotingBlockWidget(block: b),
          ChangeTagBlock b => ChangeTagBlockWidget(block: b),
          _ => const SizedBox(),
        },
      ],
    );
  }

  Future<(String, String)?> openPerTagTextEditDialog(
    BuildContext context,
    String key,
    String value,
  ) {
    return showDialog<(String, String)>(
      context: context,
      builder: (context) {
        return HookBuilder(
          builder: (context) {
            final keyState = useState(key);
            final valueState = useState(value);
            final textEditing = useTextEditingController(text: value);

            return AlertDialog(
              // title: Text("Edit $key"),
              content: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  ListTile(
                    title: DropdownMenu<String>(
                      initialSelection: key,
                      label: const Text("Tag"),
                      onSelected: (value) {
                        keyState.value = value ?? key;
                      },
                      dropdownMenuEntries:
                          UnmodifiableListView<DropdownMenuEntry<String>>(
                            scenario.availableGameTags.map(
                              (e) =>
                                  DropdownMenuEntry(value: e.tag, label: e.tag),
                            ),
                          ),
                    ),
                  ),
                  ListTile(
                    title: TextField(
                      minLines: 4,
                      maxLines: 5,
                      decoration: InputDecoration(
                        labelText: "Text",
                        hintText: "Enter your awesome text here",
                      ),
                      controller: textEditing,
                      onChanged: (value) => valueState.value = value,
                    ),
                  ),
                ],
              ),
              actions: [
                TextButton(
                  onPressed:
                      () => Navigator.of(
                        context,
                      ).pop((keyState.value, valueState.value)),
                  child: Text("OK"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}

abstract class BlockWidget<T extends Block> extends HookWidget {
  const BlockWidget({super.key, required this.block});

  final T block;

  @override
  Widget build(BuildContext context) {
    final b = useState(block);
    useEffect(() {
      b.value = block;
      return null;
    }, [block]);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: listBuild(context, b),
    );
  }

  List<Widget> listBuild(BuildContext context, ValueNotifier<T> block);
}

class NextButtonBlockWidget extends BlockWidget<NextButtonBlock> {
  const NextButtonBlockWidget({super.key, required super.block});

  @override
  List<Widget> listBuild(
    BuildContext context,
    ValueNotifier<NextButtonBlock> b,
  ) {
    final textController = useTextEditingController(text: block.buttonText);
    return [
      ListTile(
        title: TextField(
          controller: textController,
          decoration: const InputDecoration(
            labelText: "Button Text",
            hintText: "The text to show on the Button",
          ),
        ),
      ),
      CheckboxListTile(
        value: b.value.endsGame,
        title: const Text("Ends Game"),
        onChanged: (v) => b.value = b.value.copyWith(endsGame: v ?? false),
      ),
    ];
  }
}

class TimerBlockWidget extends BlockWidget<TimerBlock> {
  const TimerBlockWidget({super.key, required super.block});

  @override
  List<Widget> listBuild(BuildContext context, ValueNotifier<TimerBlock> b) {
    final minTimerController = useTextEditingController(
      text: block.minTimer.inSeconds.toString(),
    );
    final minError = useState<String?>(null);
    final maxTimerController = useTextEditingController(
      text: block.maxTimer.inSeconds.toString(),
    );
    final maxError = useState<String?>(null);

    final minSeconds = useState(block.minTimer.inSeconds);
    final maxSeconds = useState(block.maxTimer.inSeconds);

    return [
      ListTile(
        title: TextField(
          controller: minTimerController,
          keyboardType: const TextInputType.numberWithOptions(),
          autocorrect: false,
          onChanged: (value) {
            validate(
              value,
              true,
              minError,
              maxError,
              minSeconds,
              maxSeconds.value,
              b,
            );
          },
          decoration: InputDecoration(
            labelText: "Min Timer in Seconds",
            errorText: minError.value,
          ),
        ),
      ),
      ListTile(
        title: TextField(
          controller: maxTimerController,
          keyboardType: const TextInputType.numberWithOptions(),
          autocorrect: false,
          onChanged: (value) {
            validate(
              value,
              false,
              maxError,
              minError,
              maxSeconds,
              minSeconds.value,
              b,
            );
          },
          decoration: InputDecoration(
            labelText: "max Timer in Seconds",
            errorText: maxError.value,
          ),
        ),
      ),
    ];
  }

  void validate(
    String value,
    bool minTimer,
    ValueNotifier<String?> error,
    ValueNotifier<String?> otherError,
    ValueNotifier<int> secondsVal,
    int otherSeconds,
    ValueNotifier<TimerBlock> b,
  ) {
    final val = int.tryParse(value);
    if (val == null) {
      error.value = "Please insert an integer";
      return;
    }
    if (val.isNegative) {
      error.value = "Only positive integers are allowed";
      return;
    }
    secondsVal.value = val;
    if ((minTimer && val > otherSeconds) || (!minTimer && val < otherSeconds)) {
      error.value =
          "Please insert a value ${minTimer ? 'smaller' : 'bigger'} than the ${minTimer ? 'max' : 'min'} timer ${otherSeconds}";
      return;
    }
    if (otherError.value?.contains("timer") ?? false) {
      otherError.value = null;
    }
    error.value = null;
    if (otherError.value == null && error.value == null) {
      b.value = b.value.copyWith(
        minTimer: Duration(seconds: minTimer ? secondsVal.value : otherSeconds),
        maxTimer: Duration(seconds: minTimer ? otherSeconds : secondsVal.value),
      );
    }
  }
}

class PlayerVotingBlockWidget extends BlockWidget<PlayerVotingBlock> {
  const PlayerVotingBlockWidget({super.key, required super.block});

  @override
  List<Widget> listBuild(
    BuildContext context,
    ValueNotifier<PlayerVotingBlock> b,
  ) {
    return [
      ListTile(
        title: TagFilterWidget(
          tagFilter: block.votingTargetPossibilities,
          label: Text("Player Votings"),
          hintText: "Tag Filter for player voting candidates",
          onChanged:
              (newFilter) =>
                  b.value = b.value.copyWith(
                    votingTargetPossibilities: newFilter,
                  ),
        ),
      ),
    ];
  }
}

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

class ChangeTagBlockWidget extends BlockWidget<ChangeTagBlock> {
  const ChangeTagBlockWidget({super.key, required super.block});

  /*
  final TagFilter? affectedPlayers;
  final List<Tag> tags;
  final bool remove;
*/

  @override
  List<Widget> listBuild(
    BuildContext context,
    ValueNotifier<ChangeTagBlock> b,
  ) {
    return [
      ListTile(
        title: TagFilterWidget(
          label: Text("Affected Players"),
          hintText: "Players where these tags should be added / removed",
          tagFilter: b.value.affectedPlayers,
          onChanged:
              (newFilter) =>
                  b.value = b.value.copyWith(affectedPlayers: newFilter),
        ),
      ),
      CheckboxListTile(
        value: b.value.remove,
        onChanged: (val) {
          b.value = b.value.copyWith(remove: val);
        },
        title: Text("Remove tags"),
      ),
    ];
  }
}
