import 'package:odusg/current_scenario.dart';
import 'package:odusg/events/event_info.dart';
import 'package:odusg/events/tag_event.dart';
import 'package:odusg/game_logic.dart';
import 'package:odusg/models/player.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'event_manager.g.dart';

@Riverpod(keepAlive: true)
class EventManager extends _$EventManager {
  final Map<EventInfo, int> _usedEvents = {};
  final Map<Player, EventInfo> assignedEvents = {};

  @override
  EventInfo? build() {
    return null;
  }

  EventInfo? generateNewEvent() {
    final nextPlayer = ref.refresh(nextPlayerProvider);
    if (nextPlayer == null) {
      // ref.read(gameStateMachineProvider.notifier).advance();
      state = null;
      return null;
    }
    final scenario = ref.watch(currentScenarioProvider);

    final matchingEvents = scenario.possibleEvents
        .where((x) =>
            x.requiredTags.matches(nextPlayer.tags.tags) &&
            (!_usedEvents.containsKey(x) || _usedEvents[x]! < x.maximumAmount))
        .toList();

    final random = ref.read(randomProvider);

    final chosen =
        matchingEvents.where((x) => x.runtimeType == TagEvent).firstOrNull ??
            matchingEvents[random.nextInt(matchingEvents.length)];
    if (_usedEvents.containsKey(chosen)) {
      _usedEvents[chosen] = _usedEvents[chosen]! + 1;
    } else {
      _usedEvents[chosen] = 1;
    }
    assignedEvents[nextPlayer] = chosen;

    state = chosen;
    return chosen;
  }

  void finish() {
    state = null;
  }
}
