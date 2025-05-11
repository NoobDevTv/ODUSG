import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/editor/widgets/tag_selector.dart';
import 'package:odusg/events/tags.dart';

class EditingTags extends HookWidget {
  const EditingTags({
    super.key,
    required this.selectedTags,
    required this.onClosed,
    required this.selectableTags,
  });

  final List<Tag> selectedTags;
  final void Function(List<Tag> selected) onClosed;
  final List<Tag> selectableTags;

  @override
  Widget build(BuildContext context) {
    return Wrap(
      children: [
        ...selectedTags.map(
          (x) => Padding(
            padding: const EdgeInsets.all(4.0),
            child: Chip(label: Text(x.tag)),
          ),
        ),
        TagSelector(
          onClosed: onClosed,
          selectableTags: selectableTags,
          selectedTags: selectedTags,
        ),
      ],
    );
  }
}
