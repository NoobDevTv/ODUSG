import 'package:odusg/events/event_info.dart';
import 'package:odusg/models/scenario.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_scenario.g.dart';

@Riverpod(keepAlive: true)
class CurrentScenario extends _$CurrentScenario {
  @override
  Scenario build() {
    return const Scenario(
      title: "",
      possibleEvents: [],
      endText: "",
      preGameWidget: PreGameWidget.roleAssignment,
      showAssignedEventAtEnd: false,
      description: "",
      roles: [],
      steps: [],
    );
  }

  void selectOther(Scenario scenario) {
    state = scenario;
  }

  void addNewEventToCurrent(EventInfo additionalEvent) {
    state = state
        .copyWith(possibleEvents: [...state.possibleEvents, additionalEvent]);
  }
}
