import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/dynamic_logic/block_types.dart';
import 'package:odusg/dynamic_logic/step.dart' as s;

import 'package:odusg/editor/widgets/change_tag_block_widget.dart';
import 'package:odusg/editor/widgets/group_block_widget.dart';
import 'package:odusg/editor/widgets/next_button_block_widget.dart';
import 'package:odusg/editor/widgets/player_voting_block_widget.dart';
import 'package:odusg/editor/widgets/timer_block_widget.dart';
import 'package:odusg/models/scenario.dart';

class BaseBlockWidget extends HookWidget {
  const BaseBlockWidget({
    super.key,
    required this.block,
    required this.step,
    required this.scenario,
  });
  final Block block;
  final ValueNotifier<s.Step> step;
  final Scenario scenario;

  @override
  Widget build(BuildContext context) {
    final b = switch (block) {
      GroupBlock b => useState(b),
      NextButtonBlock b => useState(b),
      TimerBlock b => useState(b),
      PlayerVotingBlock b => useState(b),
      ChangeTagBlock b => useState(b),
      _ => useState(block),
    };
    useOnListenableChange(b, () {
      step.value = step.value.copyWith(block: b.value);
    });
    useEffect(() {
      b.value = block;
      return null;
    }, [block]);
    final textController = useTextEditingController(text: block.text);

    T2 create<T, T2>(
      T2 Function({
        required ValueNotifier<T> block,
        Key? key,
        required Scenario scenario,
        required s.Step step,
      })
      func,
    ) {
      return func(
        block: b as ValueNotifier<T>,
        scenario: scenario,
        step: step.value,
      );
    }

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
            onChanged: (v) => b.value = b.value.copyWith(text: v),
          ),
        ),
        CheckboxListTile(
          value: b.value.cover,
          title: const Text("Display Cover"),
          onChanged: (v) => b.value = b.value.copyWith(cover: v ?? false),
        ),
        CheckboxListTile(
          value: b.value.foreachPlayer,
          title: const Text("Execute for each player"),
          onChanged:
              (v) => b.value = b.value.copyWith(foreachPlayer: v ?? false),
        ),
        const Divider(),
        const ListTile(title: Text("Per Tag Texts")),
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
                  mainAxisSize: MainAxisSize.min,
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
        switch (b) {
          ValueNotifier<NextButtonBlock> _ => create(NextButtonBlockWidget.new),
          ValueNotifier<TimerBlock> _ => create(TimerBlockWidget.new),
          ValueNotifier<PlayerVotingBlock> _ => create(
            PlayerVotingBlockWidget.new,
          ),
          ValueNotifier<ChangeTagBlock> _ => create(ChangeTagBlockWidget.new),
          ValueNotifier<GroupBlock> _ => create(GroupBlockWidget.new),
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
                      decoration: const InputDecoration(
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
                  child: const Text("OK"),
                ),
              ],
            );
          },
        );
      },
    );
  }
}
