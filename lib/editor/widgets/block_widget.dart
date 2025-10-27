import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/dynamic_logic/block.dart';
import 'package:odusg/dynamic_logic/step.dart' as s;
import 'package:odusg/models/scenario.dart';

abstract class BlockWidget<T extends Block> extends HookWidget {
  const BlockWidget({
    super.key,
    required this.block,
    required this.scenario,
    required this.step,
    this.allowDisplayText = true,
  });

  final ValueNotifier<T> block;
  final Scenario scenario;
  final s.Step step;
  final bool allowDisplayText;
  T get currentBlock => block.value;

  @override
  Widget build(BuildContext context) {
    final textController = useTextEditingController(text: currentBlock.text);
    final ttsController = useTextEditingController(
      text: currentBlock.ttsMessage,
    );
    final imageController = useTextEditingController(text: currentBlock.image);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        if (allowDisplayText) ...[
          ListTile(
            title: TextField(
              controller: textController,
              decoration: const InputDecoration(
                labelText: "Display Text",
                hintText: "The text to show during gameplay",
              ),
              onChanged:
                  (v) => block.value = block.value.copyWith(text: v) as T,
            ),
          ),
          ListTile(
            title: TextField(
              controller: ttsController,
              decoration: const InputDecoration(
                labelText: "Text To Speech Text",
                hintText: "The text to read aloud, when executing this step",
              ),
              onChanged:
                  (v) => block.value = block.value.copyWith(ttsMessage: v) as T,
            ),
          ),
          ListTile(
            title: TextField(
              controller: imageController,
              onChanged:
                  (v) => block.value = block.value.copyWith(image: v) as T,
              decoration: const InputDecoration(
                label: Text("Image URL"),
                hintText: "The URL of the image to show at top",
              ),
            ),
          ),
        ],
        CheckboxListTile(
          value: block.value.cover,
          title: const Text("Display Cover"),
          onChanged:
              (v) => block.value = block.value.copyWith(cover: v ?? false) as T,
        ),
        CheckboxListTile(
          value: block.value.foreachPlayer,
          title: const Text("Execute for each player"),
          onChanged:
              (v) =>
                  block.value =
                      block.value.copyWith(foreachPlayer: v ?? false) as T,
        ),
        if (allowDisplayText) ...[
          const Divider(),
          const ListTile(title: Text("Per Tag Texts")),
          Column(
            children: [
              ...block.value.perTagText.entries.map(
                (entry) => ListTile(
                  onTap:
                      () => _openPerTagTextEditDialog(
                        context,
                        entry.key,
                        entry.value,
                      ).then((value) {
                        if (value == null) return;
                        block.value =
                            block.value.copyWith.perTagText.replace(
                                  value.$1,
                                  value.$2,
                                )
                                as T;
                      }),
                  trailing: IconButton(
                    onPressed:
                        () =>
                            block.value =
                                block.value.copyWith.perTagText.remove(
                                      entry.key,
                                    )
                                    as T,
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
                    _openPerTagTextEditDialog(context, "", "").then((value) {
                      if (value == null) return;
                      block.value =
                          block.value.copyWith.perTagText.put(
                                value.$1,
                                value.$2,
                              )
                              as T;
                    });
                  },
                  icon: const Icon(Icons.add),
                ),
              ),
            ],
          ),
        ],

        ...listBuild(context, block),
      ],
    );
  }

  Future<(String, String)?> _openPerTagTextEditDialog(
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

  List<Widget> listBuild(BuildContext context, ValueNotifier<T> block);
}
