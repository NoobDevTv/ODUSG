import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/dynamic_logic/event_info_block.dart';
import 'package:odusg/editor/widgets/block_widget.dart';
import 'package:odusg/events/event_info.dart';

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
    final inOrder = useState(b.value.inOrder);

    return [
      CheckboxListTile(
        title: const Text("Execute events in order"),
        value: inOrder.value,
        onChanged: (value) {
          inOrder.value = value ?? false;
          b.value = b.value.copyWith(inOrder: inOrder.value);
        },
      ),
      const ListTile(
        title: TextField(
          decoration: InputDecoration(
            labelText: "Button Text",
            hintText: "The text to show on the Button",
          ),
        ),
      ),
      const Divider(),
      const ListTile(title: Text("Event Infos")),
      ...b.value.eventInfos.map((x) => EventInfoDisplay(info: x, block: b)),
      ListTile(
        title: IconButton(
          onPressed: () {
            b.value = b.value.copyWith.eventInfos.add(const EventInfo([]));
          },
          icon: const Icon(Icons.add),
        ),
      ),
    ];
  }
}

class EventInfoDisplay extends HookWidget {
  const EventInfoDisplay({super.key, required this.info, required this.block});

  final EventInfo info;
  final ValueNotifier<EventInfoBlock> block;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(info.name),
      subtitle: Text(
        "Alterations: ${info.textAlterations.length}, Amount: ${info.maximumAmount}",
      ),
      onTap: () async {
        await showDialog(
          context: context,
          builder:
              (c) => EventInfoEdit(
                info: info,
                closed: (newInfo) {
                  if (newInfo != null) {
                    final idx = block.value.eventInfos.indexOf(info);
                    block.value = block.value.copyWith.eventInfos.replace(
                      idx,
                      newInfo,
                    );
                  }
                  Navigator.of(context).pop();
                },
              ),
          barrierDismissible: true,
        );
      },
    );
  }
}

class EventInfoEdit extends HookWidget {
  const EventInfoEdit({super.key, required this.info, required this.closed});
  final EventInfo info;
  final Function(EventInfo? newInfo) closed;

  @override
  Widget build(BuildContext context) {
    final state = useState(info);
    return AlertDialog(
      title: const Text("Edit Info"),
      content: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: TextField(
              controller: useTextEditingController(text: info.name),
              onChanged:
                  (value) => state.value = state.value.copyWith(name: value),
            ),
          ),
        ],
      ),
      actions: [
        TextButton(onPressed: () => closed(null), child: const Text("Close")),
        TextButton(
          onPressed: () => closed(state.value),
          child: const Text("Save"),
        ),
      ],
    );
  }
}
