import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/game_logic.dart';
import 'package:stubble/stubble.dart';

final _stubble = Stubble();

class StubbleText extends ConsumerWidget {
  const StubbleText(this.template, {super.key});

  final String template;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final fn = _stubble.compile(template);
    final data = ref.read(gameManagerProvider.notifier).currentTags;

    final text = fn(data);

    return Text(text);
  }
}
