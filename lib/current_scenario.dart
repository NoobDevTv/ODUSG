import 'package:odusg/models/scenario.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'current_scenario.g.dart';

@Riverpod(keepAlive: true)
class CurrentScenario extends _$CurrentScenario {
  @override
  Scenario build() {
    return const Scenario(
      fileVersion: 0,
      saveCounter: 0,
      uid: "",
      title: "",
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
}
