import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/dynamic_logic/block.dart';
import 'package:odusg/game_logic.dart';
import 'package:odusg/widgets/stubble_text.dart';

class NextButton extends HookConsumerWidget {
  const NextButton({super.key, required this.block});
  final NextButtonBlock block;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final nextButton = MaterialButton(
      child: Text(block.buttonText),
      onPressed: () {
        next(context, ref);
      },
    );

    String? textMatched;
    if (block.perTagText.isNotEmpty) {
      final curPlayer = ref.read(nextPlayerProvider);
      textMatched = useMemoized(() {
        final playerTags =
            curPlayer?.getCompleteTags().map((x) => x.tag).toList() ?? [];
        for (var element in block.perTagText.entries) {
          if (playerTags.contains(element.key)) return element.value;
        }
        return null;
      }, [curPlayer]);
    }

    return Column(
      children: [
        if (block.text.isNotEmpty) StubbleText(block.text),
        if (textMatched != null) StubbleText(textMatched),
        nextButton,
      ],
    );
  }

  void next(BuildContext context, WidgetRef ref) {
    if (block.endsGame) {
      ref.invalidate(gameManagerProvider);
      Navigator.pushReplacementNamed(context, "/scenario_selector");

      return;
    }

    if (block.foreachPlayer) {
      ref.invalidate(nextPlayerProvider);
      final player = ref.read(nextPlayerProvider);
      if (player == null) {
        ref.read(gameManagerProvider.notifier).advance();
      }
    } else {
      ref.read(gameManagerProvider.notifier).advance();
    }
  }
}
