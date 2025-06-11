import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/dynamic_logic/block_types.dart';
import 'package:odusg/editor/widgets/block_widget.dart';

class NextButtonBlockWidget extends BlockWidget<NextButtonBlock> {
  const NextButtonBlockWidget({
    super.key,
    required super.block,
    required super.scenario,
    required super.step,
  });

  @override
  List<Widget> listBuild(
    BuildContext context,
    ValueNotifier<NextButtonBlock> b,
  ) {
    final textController = useTextEditingController(
      text: currentBlock.buttonText,
    );
    return [
      ListTile(
        title: TextField(
          controller: textController,
          decoration: const InputDecoration(
            labelText: "Button Text",
            hintText: "The text to show on the Button",
          ),
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
