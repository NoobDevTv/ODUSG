import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/dynamic_logic/block.dart';
import 'package:odusg/game_logic.dart';
import 'package:odusg/widgets/timer_widget.dart';

class TimerBlockWidget extends ConsumerWidget {
  final TimerBlock timer;

  const TimerBlockWidget({super.key, required this.timer});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final random = ref.read(randomProvider);
    final variance = timer.maxTimer - timer.minTimer;
    final Duration duration;
    if (variance.isNegative || variance.inMilliseconds == 0) {
      duration = timer.minTimer;
    } else {
      duration = timer.minTimer +
          Duration(
            milliseconds: random.nextInt(variance.inMilliseconds),
          );
    }

    return Column(
      children: [
        Text(timer.text),
        TimerWidget(
          tickFor: duration,
          elapsed: () => WidgetsBinding.instance.addPostFrameCallback(
              (_) => ref.read(gameManagerProvider.notifier).advance()),
        ),
      ],
    );
  }
}
