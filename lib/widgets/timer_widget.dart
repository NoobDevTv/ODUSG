import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';
import 'package:odusg/game_logic.dart';

class TimerWidget extends ConsumerWidget {
  final Duration tickFor;
  final Function elapsed;

  const TimerWidget({super.key, required this.tickFor, required this.elapsed});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final ticker =
        ref.watch(tickerProvider(const Duration(seconds: 1), tickFor));

    return ticker.whenData((s) {
          if (s == 0) elapsed();

          if (s <= 0) return const Text("00:00");
          return Text(
            DateFormat.ms().format(
              DateTime(2000).add(
                Duration(seconds: s),
              ),
            ),
          );
        }).valueOrNull ??
        const Text("");
  }
}
