import 'package:dart_mappable/dart_mappable.dart';
import 'package:odusg/conditions/win_condition.dart';
import 'package:odusg/dynamic_logic/block_widget.dart';
import 'package:odusg/dynamic_logic/step.dart';
import 'package:odusg/events/event_info.dart';
import 'package:odusg/events/events.dart';
import 'package:odusg/events/tags.dart';
import 'package:odusg/models/player.dart';
import 'package:odusg/models/roles.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'scenario.mapper.dart';
part 'scenario.g.dart';

@Riverpod(keepAlive: true)
class Scenarios extends _$Scenarios {
  @override
  List<Scenario> build() {
    return [
      Scenario(
          title: "Barcamp",
          possibleEvents: [],
          endText: "please vote for the player, who gave the best pitch",
          preGameWidget: PreGameWidget.textInput,
          showAssignedEventAtEnd: true,
          roles: [
            Roles(
                tag: "pitcher",
                intlKey: "pitcher",
                isDefault: true,
                getAssignableAmount: []),
          ],
          startingTags: const [MostVotesCondition.tag],
          steps: [],
          description:
              "Each one enters a topic, where someone has to do a pitch about it. It can even be the person, who entered the topic. At the end, everyone votes for the best pitch, and the one with the most votes wins."),
      Scenario(
          title: "Standard",
          possibleEvents: textEvents,
          endText: "please vote for the player, who you think is the bad one",
          preGameWidget: PreGameWidget.roleAssignment,
          showAssignedEventAtEnd: false,
          steps: [],
          roles: [
            Roles(
                tag: "good",
                intlKey: "good_player",
                isDefault: true,
                getAssignableAmount: []),
            Roles(
                tag: "bad",
                intlKey: "bad_player",
                priority: 1,
                getAssignableAmount: [
                  (5, 1, 2),
                  (7, 2, 3),
                  (9, 3, 4),
                ]),
          ],
          description:
              "A social deduction game. Find out which players are the bad ones, with the help of events. Only if atleast one bad person has the most votes, the good ones win, otherwise the bad ones have it."),
      Scenario(
          title: "Werewolf",
          possibleEvents: textEvents,
          endText: "please vote for the player, who you think is the bad one",
          preGameWidget: PreGameWidget.roleAssignment,
          showAssignedEventAtEnd: false,
          roles: [
            /*
            Bis [8] Spieler mindestens [1] bis maximal [1]
            Bis [12] Spieler mindestens [2] bis maximal [2]
            Bis [19] Spieler mindestens [3] bis maximal [3]
            Bis [200] Spieler mindestens [4] bis maximal [4]
          */
            Roles(
              tag: "werewolf",
              intlKey: "werewolf_role",
              priority: 1,
              getAssignableAmount: [
                (8, 1, 1),
                (12, 2, 2),
                (19, 3, 3),
                (25, 4, 4),
              ],
            ),
            Roles(
              tag: "villager",
              intlKey: "villager_player",
              isDefault: true,
              getAssignableAmount: [],
            ),
            Roles(
              tag: "doctor",
              intlKey: "doctor_player",
              priority: 1,
              getAssignableAmount: [
                (0, 1, 1),
              ],
            ),
            Roles(
              tag: "seer",
              intlKey: "seer_player",
              priority: 1,
              getAssignableAmount: [
                (0, 1, 1),
              ],
            ),
          ],
          steps: werewolfGame,
          description:
              "A social deduction game. Find out which players are the bad ones, with the help of events. Only if atleast one bad person has the most votes, the good ones win, otherwise the bad ones have it."),
    ];
  }

  void add(List<Scenario> deserialized) {
    if (deserialized.isEmpty) return;
    for (var i = 0; i < 10; i++) {
      state.addAll(deserialized);
    }
    state = state.toList();
  }

  void remove(Scenario current) {
    state.remove(current);
    state = state.toList();
  }
}

@MappableEnum()
enum PreGameWidget { roleAssignment, textInput }

@MappableClass()
class Scenario with ScenarioMappable {
  const Scenario({
    required this.title,
    required this.possibleEvents,
    required this.endText,
    required this.showAssignedEventAtEnd,
    required this.preGameWidget,
    required this.description,
    required this.roles,
    required this.steps,
    this.startingTags = const [DefaultWinCondition.tag],
  });

  final String title;
  final List<EventInfo> possibleEvents;
  final String endText;
  final bool showAssignedEventAtEnd;
  final PreGameWidget preGameWidget;
  final String description;
  final List<Tag> startingTags;
  final List<Roles> roles;
  final List<Step> steps;

  void preparePlayers(List<Player> players) {
    for (var player in players) {
      player.tags.tags.addAll(startingTags);
    }
  }
}
