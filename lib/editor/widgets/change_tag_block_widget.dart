import 'package:flutter/material.dart';
import 'package:odusg/dynamic_logic/change_tag_block.dart';
import 'package:odusg/editor/editing_tags.dart';
import 'package:odusg/editor/widgets/block_widget.dart';
import 'package:odusg/editor/widgets/tag_filter_widget.dart';

class ChangeTagBlockWidget extends BlockWidget<ChangeTagBlock> {
  const ChangeTagBlockWidget({
    super.key,
    required super.block,
    required super.scenario,
    required super.step,
  });

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
          label: const Text("Affected Players"),
          hintText: "Players where these tags should be added / removed",
          tagFilter: b.value.affectedPlayers,
          onChanged:
              (newFilter) =>
                  b.value = b.value.copyWith(affectedPlayers: newFilter),
        ),
      ),
      ListTile(
        title: const Text("Change Tags"),
        subtitle: EditingTags(
          selectableTags: scenario.availableGameTags,
          selectedTags: b.value.tags,
          onClosed: (selected) {
            if (selected.isEmpty) return;
            b.value = b.value.copyWith(tags: selected);
          },
        ),
      ),
      CheckboxListTile(
        value: b.value.remove,
        onChanged: (val) {
          b.value = b.value.copyWith(remove: val);
        },
        title: const Text("Remove tags"),
      ),
    ];
  }
}
