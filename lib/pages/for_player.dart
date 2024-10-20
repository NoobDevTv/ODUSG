import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/models/player.dart';

class ForPlayer extends HookConsumerWidget {
  final Player player;
  final Widget hiddenContent;

  const ForPlayer(
      {super.key, required this.player, required this.hiddenContent});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final hasUnlocked = useState(false);
    useValueChanged(
      player,
      (_, __) => hasUnlocked.value = false,
    );

    if (hasUnlocked.value) {
      return hiddenContent;
    }

    return Column(
      children: [
        Padding(
          padding:
              const EdgeInsets.only(left: 8.0, top: 8, bottom: 8, right: 0),
          child: Text("Information für: ${player.name}"),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: ElevatedButton(
            onLongPress: () => hasUnlocked.value = true,
            onPressed: () {},
            child: const Text("Hold to Unlock"),
          ),
        )
      ],
    );
  }
}
