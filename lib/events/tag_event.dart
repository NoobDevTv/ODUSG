import 'package:dart_mappable/dart_mappable.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:odusg/events/event_info.dart';
import 'package:odusg/events/tags.dart';
import 'package:odusg/models/player.dart';
import 'package:odusg/events/event_text.dart';

part 'tag_event.mapper.dart';

@MappableClass()
class TagEvent extends EventInfo with TagEventMappable {
  final Tag? replacementTag;
  final Tag? newTag;

  const TagEvent(
    super.textAlterations, {
    this.replacementTag,
    this.newTag,
    super.maximumAmount,
    super.requiredTags,
    super.name,
  });

  @override
  Widget getWidget(List<Player> players, Player self) {
    final replacementTag = this.replacementTag;
    if (replacementTag != null) {
      final split = replacementTag.tag.split(".").first;
      self.tags.tags.removeWhere((x) => x.tag.split(".").first == split);
      self.tags.tags.add(replacementTag);
    }
    final newTag = this.newTag;
    if (newTag != null) self.tags.tags.add(newTag);

    return super.getWidget(players, self);
  }
}
