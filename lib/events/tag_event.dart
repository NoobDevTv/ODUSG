import 'package:flutter/src/widgets/framework.dart';
import 'package:odusg/events/event_info.dart';
import 'package:odusg/events/event_text.dart';
import 'package:odusg/models/player.dart';

class TagEvent extends EventInfo {
  final String? replacementTag;
  final String? newTag;

  const TagEvent(super.textAlterations,
      {this.replacementTag,
      this.newTag,
      super.maximumAmount,
      super.requiredTags});

  @override
  Widget getWidget(List<Player> players, Player self) {
    final replacementTag = this.replacementTag;
    if (replacementTag != null) {
      final split = replacementTag.split(".").first;
      self.tags.tags.removeWhere((x) => x.split(".").first == split);
      self.tags.tags.add(replacementTag);
    }
    final newTag = this.newTag;
    if (newTag != null) self.tags.tags.add(newTag);

    return super.getWidget(players, self);
  }
}