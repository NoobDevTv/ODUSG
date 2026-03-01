import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/game_logic.dart';
import 'package:odusg/i18n/strings.g.dart';
import 'package:stubble/stubble.dart';

final _stubble = Stubble();

class StubbleText extends ConsumerWidget {
  const StubbleText(this.template, {super.key});

  final String template;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final translated = t[template] ?? template;
    final fn = _stubble.compile(translated);
    final data = ref.read(gameManagerProvider.notifier).displayTags;

    final text = fn(data);

    return Align(
      alignment: Alignment.topCenter,
      child: Padding(
        padding: EdgeInsetsGeometry.all(8),
        child: Text(text, textAlign: TextAlign.center),
      ),
    );
  }
}
