import 'dart:math';
import 'package:flutter/material.dart';
import 'package:format/format.dart';
import 'package:odusg/events/default_event_widget.dart';
import 'package:odusg/events/event_text.dart';
import 'package:odusg/events/tags.dart';
import 'package:odusg/models/player.dart';
import 'package:odusg/models/roles.dart';

class EventInfo {
  static Random random = Random();

  final List<EventText> textAlterations;
  final Tags requiredTags;
  final int maximumAmount;

  const EventInfo(
    this.textAlterations, {
    this.maximumAmount = 1,
    this.requiredTags = const Tags([]),
  });

  Widget getWidget(List<Player> players, Player self) {
    List<Player> shuffled = getShuffledWithoutSelf(players, self);
    Map<String, String> formatArgs = getFormatArgs(shuffled);
    final alterations = textAlterations.where((x) => x.matches([])).toList();

    return DefaultEventWidget(
      currentEvent: this,
      child: ListTile(
        title: Text(
          alterations[random.nextInt(alterations.length)]
              .text
              .format(formatArgs),
        ),
      ),
    );
  }

  Map<String, String> getFormatArgs(List<Player> shuffled) {
    Map<Role, int> counted = {};
    final Map<String, String> formatArgs = {};

    for (var element in shuffled) {
      if (!counted.containsKey(element.role)) counted[element.role] = 0;

      final curCount = counted[element.role]! + 1;
      formatArgs["${element.role.name}_$curCount"] = element.name;
      counted[element.role] = curCount;
    }

    for (var element in counted.entries) {
      formatArgs["count_${element.key.name}"] = element.value.toString();
    }
    return formatArgs;
  }

  List<Player> getShuffledWithoutSelf(List<Player> players, Player self) {
    final shuffled = players.where((p) => p.name != self.name).toList();
    shuffled.shuffle();
    return shuffled;
  }

  bool canShowMore(int pageIndex) => false;
}
