import 'package:flutter/widgets.dart';
import 'package:odusg/dynamic_logic/block.dart';
import 'package:odusg/dynamic_logic/step.dart';
import 'package:odusg/dynamic_logic/tag_condition.dart';
import 'package:odusg/events/tags.dart';
import 'package:odusg/widgets/next_button.dart';
import 'package:odusg/widgets/timer_block_widget.dart';
import 'package:odusg/widgets/voting_block_widget.dart';

final blockWidgetFactory = <Type, Widget Function(Block)>{
  NextButtonBlock: (block) => NextButton(
        block: block as NextButtonBlock,
      ),
  TimerBlock: (block) {
    return TimerBlockWidget(
      timer: block as TimerBlock,
    );
  },
  PlayerVotingBlock: (block) {
    return VotingBlockWidget(votingBlock: block as VotingBlock);
  },
  ChangeTagBlock: (block) {
    final change = block as ChangeTagBlock;
    WidgetsBinding.instance.addPostFrameCallback((_) => change.act());
    return const SizedBox();
  },
};

final List<Step> werewolfGame = [
  Step(
    "showRolesPerPersonHidden",
    TagCondition.parse("game.startedAlready = 0"),
    const NextButtonBlock(
        endsGame: false,
        text: "",
        buttonText: "Verstanden",
        perTagText: {
          "player.role.villager":
              "Du bist'n Einwohner. Diskutiere am Tag und bleib am leben. Viel Glück ;)",
          "player.role.werewolf":
              "Du monster, tötest in der Nacht, aber willst unschuldig sein am Tag.",
          "player.role.seer":
              "Du brauchst keine Brille, weil du kannst gut sehen, dass du Nachts einzeln die Dorfbewohner erkennen kannst.",
          "player.role.doctor":
              "Du hast promoviert und kannst deshalb einen Dorfbewohner pro Nacht vor dem Unglück bewahren, von einem Werewolf tötlich verletzt zu werden. Auch dich selbst. Na dann Glück auf."
        },
        cover: true,
        foreachPlayer: true),
  ),
  Step(
    "gameStarted",
    TagCondition.parse("game.startedAlready = 0"),
    ChangeTagBlock(
      tags: const [Tag("game.startedAlready")],
    ),
  ),
  const Step(
    "showInstructionsForNight",
    TagCondition.enter,
    NextButtonBlock(
        endsGame: false, text: "Night, please close eyes", cover: false),
  ), //Show Text
  const Step(
    "waitForEyesClosed",
    TagCondition.enter,
    TimerBlock(
        minTimer: Duration(seconds: 2),
        maxTimer: Duration(seconds: 2),
        text: "Schließt die Augen zu und schnarcht nicht"),
  ), //Show Text
  Step(
    "wolfVoting",
    TagCondition.enter,
    PlayerVotingBlock(
      votingTargetPossibilities:
          TagFilter.parse("!player.dead & !player.role.werewolf"),
      setTags: Tags([
        Tag("wolfVoting", temporary: true),
      ]), //Maybe add target.Tag syntax
      text: "Wer soll sterben?",
    ),
  ), //Voting
  const Step(
    "waitForEyesClosed",
    TagCondition.enter,
    TimerBlock(
        minTimer: Duration(seconds: 2),
        maxTimer: Duration(seconds: 2),
        text: "Schließt die Augen zu und schnarcht nicht"),
  ), //Show Text
  Step(
    "seer",
    TagCondition.parse("player.role.seer > 0"),
    PlayerVotingBlock(
      votingTargetPossibilities:
          TagFilter.parse("!player.dead & !player.role.seer"),
      setTags: Tags([Tag("seerVoting", temporary: true)]),
      text: "Wen willst du gesehen haben?",
    ),
    filter: TagFilter.parse("player.role.seer & !player.dead"),
  ), //Voting
  Step(
    "seerResult",
    TagCondition.parse("player.seerVoting > 0"),
    const NextButtonBlock(
        endsGame: false,
        cover: false,
        text: "{{player_name}} ist {{player_role}}"),
    filter: TagFilter.parse("player.seerVoting"),
  ), //Show Text
  Step(
    "fakeSeer",
    TagCondition.parse("player.role.seer = 0"),
    const TimerBlock(
        text: "Hier gibt es nichts zu sehen :(",
        minTimer: Duration(seconds: 6),
        maxTimer: Duration(seconds: 15)),
    filter: TagFilter.parse("player.role.seer & !player.dead"),
  ), //Show Text
  const Step(
    "waitForEyesClosed",
    TagCondition.enter,
    TimerBlock(
        minTimer: Duration(seconds: 2),
        maxTimer: Duration(seconds: 2),
        text: "Schließt die Augen zu und schnarcht nicht"),
  ), //Show Text
  Step(
    "doctor",
    TagCondition.parse("player.role.doctor > 0"),
    PlayerVotingBlock(
        votingTargetPossibilities: TagFilter.parse("!player.dead"),
        setTags: Tags([Tag("doctorVoting", temporary: true)]),
        text: "Wer darf nicht sterben?"),
    filter: TagFilter.parse("player.role.doctor & !player.dead"),
  ), //Voting
  Step(
    "fakedoctor",
    TagCondition.parse("player.role.doctor = 0"),
    const TimerBlock(
        text: "Keine Heilung in Sicht",
        minTimer: Duration(seconds: 6),
        maxTimer: Duration(seconds: 15)),
  ), //Voting
  Step(
    "wolfVotingResultSuccess",
    TagCondition.parse("player.wolfVoting > 0") /*doctorResult != WolfResult*/,
    const NextButtonBlock(
        endsGame: false, text: "{{player_name}} is dead", cover: false),
    filter: TagFilter.parse("player.wolfVoting & !player.doctorVoting"),
  ), //Show Text
  Step(
      "wolfVotingResultFailed",
      TagCondition.parse("player.wolfVoting > 0"),
      const NextButtonBlock(
          endsGame: false, text: "No one is dead", cover: false),
      filter: TagFilter.parse(
          "player.wolfVoting & player.doctorVoting")), //Show Text
  Step(
    "unalivePlayer",
    TagCondition.enter,
    ChangeTagBlock(
      tags: const [Tag("player.dead")],
      affectedPlayers:
          TagFilter.parse("player.wolfVoting & !player.doctorVoting"),
    ),
    filter: TagFilter.parse("player.wolfVoting & !player.doctorVoting"),
  ),
  Step(
    "removeVotings",
    TagCondition.enter,
    ChangeTagBlock(
        tags: const [
          Tag("player.wolfVoting"),
          Tag("player.doctorVoting"),
          Tag("player.seerVoting"),
        ],
        remove: true,
        affectedPlayers: TagFilter.parse(
          "player.wolfVoting | player.doctorVoting | player.seerVoting",
        )),
  ),
  Step(
    "peopleVoting",
    TagCondition.enter,
    PlayerVotingBlock(
      votingTargetPossibilities: TagFilter.parse("!player.dead"),
      setTags: const Tags([Tag("dead")]),
      text: "Steinigung",
    ),
  ), //Voting
  Step(
    "gameEndWerewolfWon",
    TagCondition.parse("player.role.werewolf > player.role.villager"),
    const NextButtonBlock(
      endsGame: true,
      text: "Werewolfs have won",
    ),
    filter: TagFilter.parse(
        "player.role.werewolf | player.role.villager & !player.dead"),
  ),
  Step(
    "gameEndVillagersWon",
    TagCondition.parse("player.role.werewolf = 0"),
    const NextButtonBlock(
      endsGame: true,
      text: "Villagers have won",
    ),
    filter: TagFilter.parse("player.role.werewolf & !player.dead"),
  )
];
