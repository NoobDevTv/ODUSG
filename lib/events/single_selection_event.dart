import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:format/format.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/event_manager.dart';
import 'package:odusg/events/event_info.dart';
import 'package:odusg/events/event_text.dart';
import 'package:odusg/models/player.dart';

class SingleSelectionEvent extends EventInfo {
  final Map<int, List<EventText>> textAlterationsPerPage;

  const SingleSelectionEvent(this.textAlterationsPerPage,
      {super.maximumAmount, super.requiredTags})
      : super(const []);
  @override
  Widget getWidget(List<Player> players, Player self) {
    return _SingleSelectionEventWidget(this, players, self);
  }

  @override
  bool canShowMore(int pageIndex) =>
      textAlterationsPerPage.containsKey(pageIndex + 1);
}

class SinglePlayerSelectionWidget extends HookWidget {
  const SinglePlayerSelectionWidget(this.players, this.playerSelected,
      {super.key});
  final List<Player> players;
  final void Function(Player?) playerSelected;

  @override
  Widget build(BuildContext context) {
    final selectedPlayer = useState<Player?>(null);
    return ListView.builder(
        itemCount: players.length,
        itemBuilder: (context, index) {
          final player = players[index];

          return RadioListTile(
            title: Text(player.name),
            value: player,
            groupValue: selectedPlayer.value,
            onChanged: (a) {
              selectedPlayer.value = a;
              playerSelected(a);
            },
          );
        });
  }
}

class _SingleSelectionEventWidget extends HookConsumerWidget {
  final SingleSelectionEvent eventInfo;
  final List<Player> players;
  final Player self;
  const _SingleSelectionEventWidget(this.eventInfo, this.players, this.self);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Map<String, String> formatArgs = getFormatArgs(shuffled);
    final playersExceptSelf = players.where((x) => x != self).toList();
    final childIndex = useState(0);
    final selectedPlayer = useState<Player?>(null);
    final text = eventInfo.textAlterationsPerPage[childIndex.value]!.firstWhere(
        (x) => x.tags.matches(selectedPlayer.value?.tags.tags ?? []));
    final canGoNext = useState(false);

    return Column(
      children: [
        Expanded(
          child: _getChildWidget(childIndex, playersExceptSelf, text.text,
              selectedPlayer, canGoNext),
        ),
        OutlinedButton(
            onPressed: selectedPlayer.value == null
                ? null
                : () {
                    if (eventInfo.canShowMore(childIndex.value)) {
                      childIndex.value++;
                    } else {
                      ref.read(eventManagerProvider.notifier).finish();
                    }
                  },
            child: const Text("Next"))
      ],
    );
  }

  Widget _getChildWidget(
      ValueNotifier<int> childIndex,
      List<Player> playersExceptSelf,
      String text,
      ValueNotifier<Player?> selectedPlayer,
      ValueNotifier<bool> canGoNext) {
    Widget child;
    if (childIndex.value == 0) {
      child = Column(
        children: [
          ListTile(
            title: Text(text),
          ),
          Expanded(
            child: SinglePlayerSelectionWidget(
              playersExceptSelf,
              (p) => selectedPlayer.value = p,
            ),
          ),
        ],
      );
    } else {
      List<Player> shuffled = eventInfo.getShuffledWithoutSelf(players, self);
      final formatArgs = eventInfo.getFormatArgs(shuffled);
      formatArgs.addAll({
        "selected_1": selectedPlayer.value!.name,
        "selected_1_role": selectedPlayer.value!.role.name
      });
      child = Text(text.format(formatArgs));
    }
    return child;
  }
}
