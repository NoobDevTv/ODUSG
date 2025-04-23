import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/events/tags.dart';

class TagSelector extends HookWidget {
  const TagSelector({
    super.key,
    this.child,
    required this.onClosed,
    required this.selectableTags,
  });

  final Widget? child;
  final void Function(List<Tag> selected) onClosed;
  final List<Tag> selectableTags;

  @override
  Widget build(BuildContext context) {
    if (child == null)
      return IconButton(
        onPressed: () => _openDialog(context),
        icon: Icon(Icons.add),
      );

    return MaterialButton(onPressed: () => _openDialog(context), child: child);
  }

  Future _openDialog(BuildContext context) async {
    final dialog = AlertDialog(
      title: Text("Select Tags"),
      content: HookBuilder(
        builder: (context) {
          final selectedTags = useState(<Tag>[]);
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
                                selectedTags.value
                                    .where((y) => x != y)
                                    .toList();
                          } else {
                            selectedTags.value = [...selectedTags.value, x];
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  TextButton(
                    onPressed: () => Navigator.of(context).pop(),
                    child: Text("Cancel"),
                  ),
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                      onClosed(selectedTags.value);
                    },
                    child: Text("OK"),
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
  }
}
