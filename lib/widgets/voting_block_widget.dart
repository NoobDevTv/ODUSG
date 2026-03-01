import 'package:darq/darq.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/dynamic_logic/voting_block.dart';
import 'package:odusg/game_logic.dart';

class VotingBlockWidget extends HookConsumerWidget {
  final VotingBlock votingBlock;

  const VotingBlockWidget({super.key, required this.votingBlock});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> votings = useMemoized(() {
      return votingBlock.getPossibilities(ref);
    });

    final selected = useState<List<String>>([]);

    return (votingBlock.maxMultiselect > 1
        ? _multiSelection
        : _singleSelection)(ref, selected, votings);
  }

  Widget _multiSelection(
    WidgetRef ref,
    ValueNotifier<List<String>> selected,
    List<String> votings,
  ) {
    return Column(
      children: [
        Column(
          children:
              votings
                  .map(
                    (e) => CheckboxListTile(
                      title: Text(e),
                      value: selected.value.contains(e),
                      onChanged: (s) {
                        if (s == false) {
                          selected.value = selected.value.exclude(e).toList();
                          return;
                        }
                        if (s == true &&
                            selected.value.length <
                                votingBlock.maxMultiselect) {
                          selected.value = [...selected.value, e];
                        } else {
                          //Error to many selects
                        }
                      },
                    ),
                  )
                  .toList(),
        ),
        MaterialButton(
          onPressed: () {
            if (selected.value.length < votingBlock.minMultiselect ||
                selected.value.length > votingBlock.maxMultiselect) {
              return; //Error
            }

            votingBlock.finish(ref, selected.value);
            ref.read(advancingProvider.notifier).advance();
          },
          child: const Text("Select"),
        ),
      ],
    );
  }

  Widget _singleSelection(
    WidgetRef ref,
    ValueNotifier<List<String>> selected,
    List<String> votings,
  ) {
    return Column(
      children: [
        SingleChildScrollView(
          child: RadioGroup(
            groupValue: selected.value.firstOrNull,
            onChanged: (val) => selected.value = val == null ? [] : [val],
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(votingBlock.text),
                ...votings.map(
                  (x) => RadioListTile<String>(value: x, title: Text(x)),
                ),
              ],
            ),
          ),
        ),
        MaterialButton(
          onPressed:
              selected.value.isEmpty
                  ? null
                  : () {
                    votingBlock.finish(ref, selected.value);
                    ref.read(advancingProvider.notifier).advance();
                  },
          child: const Text("Vote"),
        ),
      ],
    );
  }
}
