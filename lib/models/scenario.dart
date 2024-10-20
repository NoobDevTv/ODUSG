import 'package:flutter/material.dart';
import 'package:odusg/conditions/win_condition.dart';
import 'package:odusg/events/event_info.dart';
import 'package:odusg/events/events.dart';
import 'package:odusg/models/player.dart';

const scenarios = {
  ScenarioType.barcamp: Scenario(
      type: ScenarioType.barcamp,
      possibleEvents: [],
      endText: "please vote for the player, who gave the best pitch",
      preGameWidget: PreGameWidget.textInput,
      showAssignedEventAtEnd: true,
      startingTags: [MostVotesCondition.tag],
      description:
          "Each one enters a topic, where someone has to do a pitch about it. It can even be the person, who entered the topic. At the end, everyone votes for the best pitch, and the one with the most votes wins."),
  ScenarioType.standard: Scenario(
      type: ScenarioType.standard,
      possibleEvents: textEvents,
      endText: "please vote for the player, who you think is the bad one",
      preGameWidget: PreGameWidget.roleAssignment,
      showAssignedEventAtEnd: false,
      description:
          "A social deduction game. Find out which players are the bad ones, with the help of events. Only if atleast one bad person has the most votes, the good ones win, otherwise the bad ones have it."),
};

enum ScenarioType {
  none(""),
  standard("Standard / Demo"),
  barcamp("Barcamp Pitch"),
  ;

  const ScenarioType(this.label);

  final String label;
}

enum PreGameWidget { roleAssignment, textInput }

@immutable
class Scenario {
  const Scenario({
    required this.type,
    required this.possibleEvents,
    required this.endText,
    required this.showAssignedEventAtEnd,
    required this.preGameWidget,
    required this.description,
    this.startingTags = const [DefaultWinCondition.tag],
  });

  final ScenarioType type;
  final List<EventInfo> possibleEvents;
  final String endText;
  final bool showAssignedEventAtEnd;
  final PreGameWidget preGameWidget;
  final String description;
  final List<String> startingTags;

  Scenario copyWith(
          {ScenarioType? type,
          List<EventInfo>? possibleEvents,
          String? endText,
          bool? showAssignedEventAtEnd,
          PreGameWidget? preGameWidget,
          List<String>? startingTags}) =>
      Scenario(
        type: type ?? this.type,
        possibleEvents: possibleEvents ?? this.possibleEvents,
        endText: endText ?? this.endText,
        showAssignedEventAtEnd:
            showAssignedEventAtEnd ?? this.showAssignedEventAtEnd,
        preGameWidget: preGameWidget ?? this.preGameWidget,
        description: description,
        startingTags: startingTags ?? this.startingTags,
      );

  void preparePlayers(List<Player> players) {
    for (var player in players) {
      player.tags.tags.addAll(startingTags);
    }
  }
}
