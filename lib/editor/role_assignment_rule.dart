import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class RoleAssignmentRule extends HookWidget {
  final (int requiredPlayers, int min, int max) assignables;
  final void Function((int requiredPlayers, int min, int max) newValue)
  onChanged;
  final void Function() deleted;

  const RoleAssignmentRule({
    super.key,
    required this.assignables,
    required this.onChanged,
    required this.deleted,
  });

  (int, int, int) _copyWith(
    (int, int, int) orig, {
    int? player,
    int? min,
    int? max,
  }) {
    final ret = (player ?? orig.$1, min ?? orig.$2, max ?? orig.$3);
    if (ret != orig) onChanged(ret);
    return ret;
  }

  @override
  Widget build(BuildContext context) {
    final playerController = useTextEditingController(
      text: assignables.$1.toString(),
    );
    final minController = useTextEditingController(
      text: assignables.$2.toString(),
    );
    final maxController = useTextEditingController(
      text: assignables.$3.toString(),
    );
    final state = useState(assignables);

    return Row(
      spacing: 16,
      children: [
        Flexible(
          child: TextField(
            controller: playerController,
            onChanged: (val) {
              final player = int.tryParse(val);
              if (player == null) return;
              state.value = _copyWith(state.value, player: player);
            },
            maxLines: 1,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              label: Text("Players"),
              hintText: "Min. required amount of players",
            ),
          ),
        ),
        Flexible(
          child: TextField(
            controller: minController,
            onChanged: (val) {
              final min = int.tryParse(val);
              if (min == null) return;
              state.value = _copyWith(state.value, min: min);
            },
            maxLines: 1,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              label: Text("Min"),
              hintText: "Minimum amount to assign",
            ),
          ),
        ),
        Flexible(
          child: TextField(
            controller: maxController,
            onChanged: (val) {
              final max = int.tryParse(val);
              if (max == null) return;
              state.value = _copyWith(state.value, max: max);
            },
            maxLines: 1,
            keyboardType: TextInputType.number,
            inputFormatters: [FilteringTextInputFormatter.digitsOnly],
            decoration: const InputDecoration(
              label: Text("Max"),
              hintText: "Maximum amount to assign",
            ),
          ),
        ),
        IconButton(
          onPressed: () => deleted(),
          icon: const Icon(Icons.delete_forever),
        ),
      ],
    );
  }
}
