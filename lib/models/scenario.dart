import 'dart:convert';

import 'package:dart_mappable/dart_mappable.dart';
import 'package:odusg/conditions/win_condition.dart';
import 'package:odusg/dynamic_logic/block_widget.dart';
import 'package:odusg/dynamic_logic/block_types.dart';
import 'package:odusg/dynamic_logic/step.dart';
import 'package:odusg/dynamic_logic/tag_condition.dart';
import 'package:odusg/events/tags.dart';
import 'package:odusg/main.dart';
import 'package:odusg/models/player.dart';
import 'package:odusg/models/roles.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:uuid/v7.dart';

part 'scenario.mapper.dart';
part 'scenario.g.dart';

final defaultScenarios = [
  const Scenario(
    uid: "0beb161d-a753-4f06-b635-63d46f6a9eba",
    fileVersion: 1,
    saveCounter: 1,
    title: "Barcamp",
    endText: "please vote for the player, who gave the best pitch",
    preGameWidget: PreGameWidget.textInput,
    showAssignedEventAtEnd: true,
    roles: [
      Roles(
        tag: "pitcher",
        intlKey: "pitcher",
        isDefault: true,
        getAssignableAmount: [],
      ),
    ],
    startingTags: [MostVotesCondition.tag],
    steps: [],
    description:
        "Each one enters a topic, where someone has to do a pitch about it. It can even be the person, who entered the topic. At the end, everyone votes for the best pitch, and the one with the most votes wins.",
  ),
  Scenario(
    uid: "5231a409-bb75-4f12-8323-398af028ee5b",
    fileVersion: 1,
    saveCounter: 1,
    title: "Standard",
    endText: "please vote for the player, who you think is the bad one",
    preGameWidget: PreGameWidget.roleAssignment,
    showAssignedEventAtEnd: false,
    steps: [
      Step(
        "showRolesPerPersonHidden",
        TagCondition.parse("game.startedAlready = 0"),
        const NextButtonBlock(
          endsGame: false,
          text: "",
          buttonText: "Verstanden",
          perTagText: {
            "player.role.good": "Du bist gut und willst das Böse loswerden.",
            "player.role.bad": "Du bist böse und willst das Gute loswerden.",
          },
          cover: true,
          foreachPlayer: true,
        ),
      ),
      Step(
        "gameStarted",
        TagCondition.parse("game.startedAlready = 0"),
        const ChangeTagBlock(tags: [Tag("game.startedAlready")]),
      ),
      const Step(
        "voting",
        TagCondition.enter,
        PlayerVotingBlock(
          text: "Select the bad one",
          foreachPlayer: true,
          setTags: Tags([]),
          votingTargetPossibilities: TagFilter.empty,
        ),
      ),
    ],
    roles: [
      const Roles(
        tag: "good",
        intlKey: "good_player",
        isDefault: true,
        getAssignableAmount: [],
      ),
      const Roles(
        tag: "bad",
        intlKey: "bad_player",
        priority: 1,
        getAssignableAmount: [(5, 1, 2), (7, 2, 3), (9, 3, 4)],
      ),
    ],
    description:
        "A social deduction game. Find out which players are the bad ones, with the help of events. Only if atleast one bad person has the most votes, the good ones win, otherwise the bad ones have it.",
  ),
  Scenario(
    uid: "fb99c190-1dbc-4e9c-825d-4df87461aadc",
    fileVersion: 1,
    saveCounter: 1,
    title: "Werewolf",
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
      const Roles(
        tag: "werewolf",
        intlKey: "werewolf_role",
        priority: 1,
        getAssignableAmount: [(8, 1, 1), (12, 2, 2), (19, 3, 3), (25, 4, 4)],
      ),
      const Roles(
        tag: "villager",
        intlKey: "villager_player",
        isDefault: true,
        getAssignableAmount: [],
      ),
      const Roles(
        tag: "doctor",
        intlKey: "doctor_player",
        priority: 1,
        getAssignableAmount: [(0, 1, 1)],
      ),
      const Roles(
        tag: "seer",
        intlKey: "seer_player",
        priority: 1,
        getAssignableAmount: [(0, 1, 1)],
      ),
    ],
    steps: werewolfGame,
    description:
        "A social deduction game. Find out which players are the bad ones, with the help of events. Only if atleast one bad person has the most votes, the good ones win, otherwise the bad ones have it.",
  ),
];

@Riverpod(keepAlive: true)
class Scenarios extends _$Scenarios {
  @override
  List<Scenario> build() {
    return ref
            .read(sharedPreferencesProvider)
            .getStringList("scenarios")
            ?.map((x) => ScenarioMapper.fromMap(migrate(jsonDecode(x))))
            .toList() ??
        defaultScenarios;
  }

  Map<String, dynamic> migrate(Map<String, dynamic> val) {
    final fileVersion = val["fileVersion"];
    if (fileVersion == null) {
      val["fileVersion"] = 1;
      val["saveCounter"] = 1;
      val["uid"] = const UuidV7().generate();
    }
    return val;
  }

  void add(List<Scenario> deserialized) {
    if (deserialized.isEmpty) return;
    state.addAll(deserialized);

    state = state.toList();
    _storeScenarios();
  }

  void remove(Scenario current) {
    state.remove(current);
    state = state.toList();
    _storeScenarios();
  }

  void update(Scenario scenario) {
    final copy = state.toList();
    final idx = copy.indexWhere((x) => x.uid == scenario.uid);
    if (idx == -1) {
      copy.add(scenario);
    } else {
      copy[idx] = scenario;
    }
    state = copy;
    _storeScenarios();
  }

  void _storeScenarios() {
    final scenarios = state.map((x) => x.toJson()).toList();
    ref.read(sharedPreferencesProvider).setStringList("scenarios", scenarios);
  }
}

@MappableEnum()
enum PreGameWidget {
  roleAssignment("Role Assignemt"),
  textInput("Text Input");

  final String name;

  const PreGameWidget(this.name);
}

@MappableClass()
class Scenario with ScenarioMappable {
  const Scenario({
    required this.uid,
    required this.fileVersion,
    required this.saveCounter,
    required this.title,
    required this.endText,
    required this.showAssignedEventAtEnd,
    required this.preGameWidget,
    required this.description,
    required this.roles,
    required this.steps,
    this.availableGameTags = const [],
    this.startingTags = const [DefaultWinCondition.tag],
  });

  Scenario.create()
    : fileVersion = 1,
      saveCounter = 1,
      uid = const UuidV7().generate(),
      title = "",
      endText = "",
      preGameWidget = PreGameWidget.roleAssignment,
      showAssignedEventAtEnd = false,
      description = "",
      roles = const [],
      steps = const [],
      availableGameTags = const [],
      startingTags = const [DefaultWinCondition.tag];

  final String uid;
  final int fileVersion;
  final int saveCounter;
  final String title;
  final String endText;
  final bool showAssignedEventAtEnd;
  final PreGameWidget preGameWidget;
  final String description;
  final List<Tag> startingTags;
  final List<Roles> roles;
  final List<Step> steps;
  final List<Tag> availableGameTags;

  void preparePlayers(List<Player> players) {
    for (var player in players) {
      player.tags.tags.addAll(startingTags);
    }
  }
}
