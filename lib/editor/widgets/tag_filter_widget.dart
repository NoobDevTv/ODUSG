import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
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
