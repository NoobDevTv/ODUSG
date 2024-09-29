import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/event_manager.dart';
import 'package:odusg/events/event_info.dart';

class DefaultEventWidget extends HookConsumerWidget {
  const DefaultEventWidget(
      {required this.child, required this.currentEvent, super.key});
  final Widget child;
  final EventInfo currentEvent;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final childIndex = useState(0);
    return Column(
      children: [
        Expanded(
          child: child,
        ),
        OutlinedButton(
            onPressed: () {
              if (currentEvent.canShowMore(childIndex.value)) {
                childIndex.value++;
              } else {
                ref.read(eventManagerProvider.notifier).finish();
              }
            },
            child: const Text("Next"))
      ],
    );
  }
}
