import 'package:odusg/conditions/win_condition.dart';
import 'package:odusg/events/event_info.dart';
import 'package:odusg/events/event_text.dart';
import 'package:odusg/events/single_selection_event.dart';
import 'package:odusg/events/tag_event.dart';
import 'package:odusg/events/tags.dart';

const textEvents = [
  EventInfo([
    EventText(
        "Ein dunkler Schatten flackert zwischen {bad_1} und {good_1}. Was könnte das Bedeuten?"),
    EventText(
        "Ein dunkler Schatten flackert zwischen {good_1} und {bad_1}. Was könnte das Bedeuten?"),
  ]),
  EventInfo(
    [
      EventText(
          "Du erinnerst dich an die schönen Tage die du mit {good_1} schon erlebt hast. So ein Vertrauen ist viel wert.")
    ],
    requiredTags: Tags([Tag("Role.good")]),
  ),
  EventInfo(
    [
      EventText(
          "Du erinnerst dich an die schönen Tage die du mit {bad_1} schon erlebt hast. So ein Vertrauen ist viel wert.")
    ],
    requiredTags: Tags([Tag("Role.bad")]),
  ),
  EventInfo([
    EventText("Spieler {good_1} ist einer der guten"),
  ]),
  EventInfo(
    [
      EventText("Du traust {bad_1} nicht so richtig"),
    ],
    requiredTags: Tags([Tag("Role.good")]),
  ),
  EventInfo(
    [
      EventText(
          "Du siehst {bad_1} und {bad_2} immer nur zusammen. Führen die was im Schilde?"),
      EventText(
          "Du siehst {good_1} und {good_2} immer nur zusammen. Führen die was im Schilde?"),
    ],
    requiredTags: Tags([Tag("Role.good")]),
  ),
  EventInfo([
    EventText(
        "Du hast im dunklen {count_bad} Personen gesehen. Leider konntest du nicht erkennen, um wen es sich gehandelt hat."),
  ]),
  SingleSelectionEvent({
    0: [
      EventText("Wen möchtest du?"),
    ],
    1: [
      EventText(
        "Spieler {selected_1} ausgewählt, er ist gut",
        tags: Tags(
          [Tag("Role.good")],
        ),
      ),
      EventText(
        "Spieler {selected_1} ausgewählt, er ist böse",
        tags: Tags(
          [Tag("Role.bad")],
        ),
      ),
    ]
  }),
  TagEvent([
    EventText(
        "Du hast gehört, dass es im Gefängnis gutes gratis Essen gibt. Du gewinnst nur noch, wenn du eingesperrt wirst.")
  ], replacementTag: WantsToLooseCondition.tag),
];
