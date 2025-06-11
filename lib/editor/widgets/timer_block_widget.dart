import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/dynamic_logic/timer_block.dart';
import 'package:odusg/editor/widgets/block_widget.dart';

class TimerBlockWidget extends BlockWidget<TimerBlock> {
  const TimerBlockWidget({
    super.key,
    required super.block,
    required super.scenario,
    required super.step,
  });

  @override
  List<Widget> listBuild(BuildContext context, ValueNotifier<TimerBlock> b) {
    final minTimerController = useTextEditingController(
      text: currentBlock.minTimer.inSeconds.toString(),
    );
    final minError = useState<String?>(null);
    final maxTimerController = useTextEditingController(
      text: currentBlock.maxTimer.inSeconds.toString(),
    );
    final maxError = useState<String?>(null);

    final minSeconds = useState(currentBlock.minTimer.inSeconds);
    final maxSeconds = useState(currentBlock.maxTimer.inSeconds);

    return [
      ListTile(
        title: TextField(
          controller: minTimerController,
          keyboardType: const TextInputType.numberWithOptions(),
          autocorrect: false,
          onChanged: (value) {
            validate(
              value,
              true,
              minError,
              maxError,
              minSeconds,
              maxSeconds.value,
              b,
            );
          },
          decoration: InputDecoration(
            labelText: "Min Timer in Seconds",
            errorText: minError.value,
          ),
        ),
      ),
      ListTile(
        title: TextField(
          controller: maxTimerController,
          keyboardType: const TextInputType.numberWithOptions(),
          autocorrect: false,
          onChanged: (value) {
            validate(
              value,
              false,
              maxError,
              minError,
              maxSeconds,
              minSeconds.value,
              b,
            );
          },
          decoration: InputDecoration(
            labelText: "max Timer in Seconds",
            errorText: maxError.value,
          ),
        ),
      ),
    ];
  }

  void validate(
    String value,
    bool minTimer,
    ValueNotifier<String?> error,
    ValueNotifier<String?> otherError,
    ValueNotifier<int> secondsVal,
    int otherSeconds,
    ValueNotifier<TimerBlock> b,
  ) {
    final val = int.tryParse(value);
    if (val == null) {
      error.value = "Please insert an integer";
      return;
    }
    if (val.isNegative) {
      error.value = "Only positive integers are allowed";
      return;
    }
    secondsVal.value = val;
    if ((minTimer && val > otherSeconds) || (!minTimer && val < otherSeconds)) {
      error.value =
          "Please insert a value ${minTimer ? 'smaller' : 'bigger'} than the ${minTimer ? 'max' : 'min'} timer $otherSeconds";
      return;
    }
    if (otherError.value?.contains("timer") ?? false) {
      otherError.value = null;
    }
    error.value = null;
    if (otherError.value == null && error.value == null) {
      b.value = b.value.copyWith(
        minTimer: Duration(seconds: minTimer ? secondsVal.value : otherSeconds),
        maxTimer: Duration(seconds: minTimer ? otherSeconds : secondsVal.value),
      );
    }
  }
}
