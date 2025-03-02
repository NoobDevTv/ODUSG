import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:odusg/dynamic_logic/block.dart';
import 'package:odusg/game_logic.dart';

class VotingBlockWidget extends HookConsumerWidget {
  final VotingBlock votingBlock;

  const VotingBlockWidget({super.key, required this.votingBlock});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    List<String> votings = useMemoized(
      () {
        return votingBlock.getPossibilities(ref);
      },
    );

    final selected = useState("");

    return Column(
      children: [
        SingleChildScrollView(
          child: Column(mainAxisSize: MainAxisSize.min, children: [
            Text(votingBlock.text),
            ...votings
                .map((x) => RadioListTile<String>(
                      value: x,
                      title: Text(x),
                      groupValue: selected.value,
                      onChanged: (val) => selected.value = val ?? "",
                    ))
                .toList(),
          ]),
        ),
        MaterialButton(
          child: Text("Vote"),
          onPressed: selected.value.isEmpty
              ? null
              : () {
                  votingBlock.finish(ref, selected.value);
                  ref.read(gameManagerProvider.notifier).advance();
                },
        ),
      ],
    );
  }
}
