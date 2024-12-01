import 'package:odusg/events/event_info.dart';
import 'package:odusg/game_logic.dart';
import 'package:odusg/models/scenario.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_scenario.g.dart';

@Riverpod(keepAlive: true)
class CurrentScenario extends _$CurrentScenario {
  @override
  Scenario build() {
    return const Scenario(
      type: ScenarioType.none,
      possibleEvents: [],
      endText: "",
      preGameWidget: PreGameWidget.roleAssignment,
      showAssignedEventAtEnd: false,
      description: "",
      roles: [],
    );
  }

  void selectOther(Scenario scenario) {
    state = scenario;
    final players = ref.read(playerManagerProvider);
    scenario.preparePlayers(players);
  }

  void addNewEventToCurrent(EventInfo additionalEvent) {
    state = state
        .copyWith(possibleEvents: [...state.possibleEvents, additionalEvent]);
  }
}
