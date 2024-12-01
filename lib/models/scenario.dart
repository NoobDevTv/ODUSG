import 'package:flutter/material.dart';
import 'package:odusg/conditions/win_condition.dart';
import 'package:odusg/events/event_info.dart';
import 'package:odusg/events/events.dart';
import 'package:odusg/models/player.dart';
import 'package:odusg/models/roles.dart';

final scenarios = {
  ScenarioType.barcamp: Scenario(
      type: ScenarioType.barcamp,
      possibleEvents: [],
      endText: "please vote for the player, who gave the best pitch",
      preGameWidget: PreGameWidget.textInput,
      showAssignedEventAtEnd: true,
      roles: [
        Roles(
            tag: "pitcher",
            intlKey: "pitcher",
            getAssignableAmount: (players) => (players, players)),
      ],
      startingTags: const [MostVotesCondition.tag],
      description:
          "Each one enters a topic, where someone has to do a pitch about it. It can even be the person, who entered the topic. At the end, everyone votes for the best pitch, and the one with the most votes wins."),
  ScenarioType.standard: Scenario(
      type: ScenarioType.standard,
      possibleEvents: textEvents,
      endText: "please vote for the player, who you think is the bad one",
      preGameWidget: PreGameWidget.roleAssignment,
      showAssignedEventAtEnd: false,
      roles: [
        Roles(
            tag: "good",
            intlKey: "good_player",
            getAssignableAmount: (players) {
              return (0, 1 << 31);
            }),
        Roles(
            tag: "bad",
            intlKey: "bad_player",
            priority: 1,
            getAssignableAmount: (players) {
              final bads = (players / 2 - 1).round();
              return (bads, bads);
            }),
      ],
      description:
          "A social deduction game. Find out which players are the bad ones, with the help of events. Only if atleast one bad person has the most votes, the good ones win, otherwise the bad ones have it."),
  ScenarioType.werewolf: Scenario(
      type: ScenarioType.werewolf,
      possibleEvents: textEvents,
      endText: "please vote for the player, who you think is the bad one",
      preGameWidget: PreGameWidget.roleAssignment,
      showAssignedEventAtEnd: false,
      roles: [
        Roles(
          tag: "werewolf",
          intlKey: "werewolf_role",
          priority: 1,
          getAssignableAmount: (players) {
            if (players < 8) {
              return (1, 1);
            } else if (players < 12) {
              return (2, 2);
            } else if (players < 19) {
              return (3, 3);
            } else {
              return (4, 4);
            }
          },
        ),
        Roles(
          tag: "villager",
          intlKey: "villager_player",
          getAssignableAmount: (players) {
            return (0, 1 << 31);
          },
        ),
        Roles(
          tag: "doctor",
          intlKey: "doctor_player",
          priority: 1,
          getAssignableAmount: (players) {
            return (1, 1);
          },
        ),
        Roles(
          tag: "seer",
          intlKey: "seer_player",
          priority: 1,
          getAssignableAmount: (players) {
            return (1, 1);
          },
        ),
      ],
      description:
          "A social deduction game. Find out which players are the bad ones, with the help of events. Only if atleast one bad person has the most votes, the good ones win, otherwise the bad ones have it."),
};

enum ScenarioType {
  none(""),
  standard("Standard / Demo"),
  barcamp("Barcamp Pitch"),
  werewolf("Werwolf"),
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
    required this.roles,
    this.startingTags = const [DefaultWinCondition.tag],
  });

  final ScenarioType type;
  final List<EventInfo> possibleEvents;
  final String endText;
  final bool showAssignedEventAtEnd;
  final PreGameWidget preGameWidget;
  final String description;
  final List<String> startingTags;
  final List<Roles> roles;

  Scenario copyWith(
          {ScenarioType? type,
          List<EventInfo>? possibleEvents,
          String? endText,
          bool? showAssignedEventAtEnd,
          PreGameWidget? preGameWidget,
          List<String>? startingTags,
          List<Roles>? roles}) =>
      Scenario(
          type: type ?? this.type,
          possibleEvents: possibleEvents ?? this.possibleEvents,
          endText: endText ?? this.endText,
          showAssignedEventAtEnd:
              showAssignedEventAtEnd ?? this.showAssignedEventAtEnd,
          preGameWidget: preGameWidget ?? this.preGameWidget,
          description: description,
          startingTags: startingTags ?? this.startingTags,
          roles: roles ?? this.roles);

  void preparePlayers(List<Player> players) {
    for (var player in players) {
      player.tags.tags.addAll(startingTags);
    }
  }
}
