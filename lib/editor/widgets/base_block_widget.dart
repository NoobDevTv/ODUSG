import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/dynamic_logic/block.dart';
import 'package:odusg/dynamic_logic/tag_condition.dart';

class BaseBlockWidget extends HookWidget {
  const BaseBlockWidget({super.key, required this.block});
  final Block block;

  @override
  Widget build(BuildContext context) {
    final b = useState(block);
    useEffect(() {
      b.value = block;
      return null;
    }, [block]);
    final textController = useTextEditingController(text: block.text);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        ListTile(
          title: TextField(
            controller: textController,
            decoration: const InputDecoration(
                labelText: "Display Text",
                hintText: "The text to show during gameplay"),
          ),
        ),
        CheckboxListTile(
          value: b.value.cover,
          title: const Text("Display Cover"),
          onChanged: (v) => b.value = b.value.copyWith(cover: v ?? false),
        ),
        CheckboxListTile(
          value: b.value.cover,
          title: const Text("Execute for each player"),
          onChanged: (v) =>
              b.value = b.value.copyWith(foreachPlayer: v ?? false),
        ),
        const Text("Insert Per Tag Text Widget here"),
        switch (block) {
          NextButtonBlock b => NextButtonBlockWidget(block: b),
          TimerBlock b => TimerBlockWidget(block: b),
          PlayerVotingBlock b => PlayerVotingBlockWidget(block: b),
          ChangeTagBlock b => ChangeTagBlockWidget(block: b),
          _ => const SizedBox(),
        }
      ],
    );
  }
}

abstract class BlockWidget<T extends Block> extends HookWidget {
  const BlockWidget({super.key, required this.block});

  final T block;

  @override
  Widget build(BuildContext context) {
    final b = useState(block);
    useEffect(() {
      b.value = block;
      return null;
    }, [block]);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: listBuild(context, b),
    );
  }

  List<Widget> listBuild(BuildContext context, ValueNotifier<T> block);
}

class NextButtonBlockWidget extends BlockWidget<NextButtonBlock> {
  const NextButtonBlockWidget({super.key, required super.block});

  @override
  List<Widget> listBuild(
      BuildContext context, ValueNotifier<NextButtonBlock> b) {
    final textController = useTextEditingController(text: block.buttonText);
    return [
      ListTile(
        title: TextField(
          controller: textController,
          decoration: const InputDecoration(
              labelText: "Button Text",
              hintText: "The text to show on the Button"),
        ),
      ),
      CheckboxListTile(
        value: b.value.endsGame,
        title: const Text("Ends Game"),
        onChanged: (v) => b.value = b.value.copyWith(endsGame: v ?? false),
      ),
    ];
  }
}

class TimerBlockWidget extends BlockWidget<TimerBlock> {
  const TimerBlockWidget({super.key, required super.block});

  @override
  List<Widget> listBuild(BuildContext context, ValueNotifier<TimerBlock> b) {
    final minTimerController =
        useTextEditingController(text: block.minTimer.inSeconds.toString());
    final minError = useState<String?>(null);
    final maxTimerController =
        useTextEditingController(text: block.maxTimer.inSeconds.toString());
    final maxError = useState<String?>(null);

    final minSeconds = useState(block.minTimer.inSeconds);
    final maxSeconds = useState(block.maxTimer.inSeconds);

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
      ValueNotifier<TimerBlock> b) {
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
          "Please insert a value ${minTimer ? 'smaller' : 'bigger'} than the ${minTimer ? 'max' : 'min'} timer ${otherSeconds}";
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

class PlayerVotingBlockWidget extends BlockWidget<PlayerVotingBlock> {
  const PlayerVotingBlockWidget({super.key, required super.block});

  @override
  List<Widget> listBuild(
      BuildContext context, ValueNotifier<PlayerVotingBlock> b) {
    return [
      ListTile(
        title: TagFilterWidget(
          tagFilter: block.votingTargetPossibilities,
          label: Text("Player Votings"),
          hintText: "Tag Filter for player voting candidates",
          onChanged: (newFilter) =>
              b.value = b.value.copyWith(votingTargetPossibilities: newFilter),
        ),
      ),
    ];
  }
}

class TagFilterWidget extends HookWidget {
  const TagFilterWidget(
      {super.key,
      required this.tagFilter,
      required this.label,
      this.hintText,
      required this.onChanged});

  final TagFilter? tagFilter;
  final Widget label;
  final String? hintText;
  final void Function(TagFilter? newFilter) onChanged;

  @override
  Widget build(BuildContext context) {
    final filterController =
        useTextEditingController(text: tagFilter?.toString() ?? "");
    final filterError = useState<String?>(null);

    return TextField(
      controller: filterController,
      onEditingComplete: () {
        try {
          final newFilter = TagFilter.parse(filterController.text);
          onChanged(newFilter);
          filterError.value = null;
        } catch (e) {
          filterError.value = e.toString();
        }
      },
      decoration: InputDecoration(
        label: label,
        error: filterError.value == null ? null : Text(filterError.value!),
        hintText: hintText,
      ),
    );
  }
}

class ChangeTagBlockWidget extends BlockWidget<ChangeTagBlock> {
  const ChangeTagBlockWidget({super.key, required super.block});

/*
  final TagFilter? affectedPlayers;
  final List<Tag> tags;
  final bool remove;
*/

  @override
  List<Widget> listBuild(
      BuildContext context, ValueNotifier<ChangeTagBlock> b) {
    return [
      ListTile(
          title: TagFilterWidget(
        label: Text("Affected Players"),
        hintText: "Players where these tags should be added / removed",
        tagFilter: b.value.affectedPlayers,
        onChanged: (newFilter) =>
            b.value = b.value.copyWith(affectedPlayers: newFilter),
      )),
      CheckboxListTile(
        value: b.value.remove,
        onChanged: (val) {
          b.value = b.value.copyWith(remove: val);
        },
        title: Text("Remove tags"),
      ),
    ];
  }
}
