import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/dynamic_logic/event_info_block.dart';
import 'package:odusg/dynamic_logic/next_button_block.dart';
import 'package:odusg/editor/widgets/block_widget.dart';

class EventInfoBlockWidget extends BlockWidget<EventInfoBlock> {
  const EventInfoBlockWidget({
    super.key,
    required super.block,
    required super.scenario,
  });

  @override
  List<Widget> listBuild(
    BuildContext context,
    ValueNotifier<EventInfoBlock> b,
  ) {
    return [
      ListTile(
        title: TextField(
          decoration: const InputDecoration(
            labelText: "Button Text",
            hintText: "The text to show on the Button",
          ),
        ),
      ),
    ];
  }
}
