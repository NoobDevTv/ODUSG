import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/events/tags.dart';
import 'package:odusg/models/scenario.dart';

class TagSelectorDialog extends StatelessWidget {
  const TagSelectorDialog({
    super.key,
    this.child,
    required this.onClosed,
    required this.selectableTags,
    this.selectedTags,
  });

  final Widget? child;
  final void Function(List<Tag> selected) onClosed;
  final List<Tag> selectableTags;

  final List<Tag>? selectedTags;

  @override
  Widget build(BuildContext context) {
    if (child == null) {
      return IconButton(
        onPressed: () => _openDialog(context),
        icon: const Icon(Icons.edit),
      );
    }

    return MaterialButton(onPressed: () => _openDialog(context), child: child);
  }

  Future _openDialog(BuildContext context) async {
    List<Tag> selectedTags = this.selectedTags ?? [];
    final dialog = AlertDialog(
      title: const Text("Select Tags"),
      content: TagSelector(
        selectableTags: selectableTags,
        selectedTags: selectedTags,
        onTagSelectionChanged:
            (selected) => (selected.$2
                ? selectedTags.add
                : selectedTags.remove)(selected.$1),
        additionalChildren: [
          Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () => Navigator.of(context).pop(),
                child: const Text("Cancel"),
              ),
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                  onClosed(selectedTags);
                },
                child: const Text("OK"),
              ),
            ],
          ),
        ],
      ),
    );

    final res = await showDialog(
      context: context,
      builder: (context) => dialog,
    );
  }
}

class TagSelector extends HookWidget {
  const TagSelector({
    super.key,
    required this.onTagSelectionChanged,
    required this.selectableTags,
    this.selectedTags,
    this.additionalChildren = const [],
    this.allowAddingNewTags = false,
    this.scenario,
  });

  final List<Widget> additionalChildren;
  final void Function((Tag, bool) selected) onTagSelectionChanged;
  final List<Tag> selectableTags;
  final List<Tag>? selectedTags;
  final bool allowAddingNewTags;
  final Scenario? scenario;

  bool get _canAddTags => scenario != null && allowAddingNewTags;

  @override
  Widget build(BuildContext context) {
    final chipText = useTextEditingController();
    final chipError = useState<String?>(null);
    final selectedTags = useState(this.selectedTags ?? []);
    final renderDate = useState(DateTime.timestamp());

    void _addNewTag(String value) {
      final scenario = this.scenario!;
      final newTag = Tag(value, tagType: TagType.global);
      if (scenario.availableGameTags.contains(newTag)) {
        chipError.value = "The tag '$value' does already exist";
        return;
      }
      scenario.availableGameTags.add(newTag);
      chipError.value = null;
      chipText.text = "";
      renderDate.value = DateTime.timestamp();
    }

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Wrap(
          children: [
            ...selectableTags.map(
              (x) => Padding(
                padding: const EdgeInsets.all(4.0),
                child: FilterChip(
                  label: Text(x.tag),
                  selected: selectedTags.value.contains(x),
                  onSelected: (bool value) {
                    if (!value) {
                      selectedTags.value =
                          selectedTags.value.where((y) => x != y).toList();
                    } else {
                      selectedTags.value = [...selectedTags.value, x];
                    }
                    onTagSelectionChanged((x, value));
                  },
                ),
              ),
            ),
          ],
        ),
        if (_canAddTags)
          ListTile(
            trailing: IconButton(
              onPressed: () => _addNewTag(chipText.text),
              icon: Icon(Icons.add),
            ),
            title: TextField(
              controller: chipText,
              maxLines: 1,
              decoration: InputDecoration(
                label: const Text("Add new tag"),
                errorText: chipError.value,
              ),
              onSubmitted: _addNewTag,
            ),
          ),

        ...additionalChildren,
      ],
    );
  }
}
