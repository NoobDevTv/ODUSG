import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/dynamic_logic/step.dart' as s;
import 'package:odusg/editor/step_edit_page.dart';

class StepWidget extends HookWidget {
  const StepWidget({super.key, required this.step, required this.onChanged});

  final s.Step step;
  final void Function(s.Step) onChanged;

  @override
  Widget build(BuildContext context) {
    final current = useState(step);
    useEffect(() {
      current.value = step;
      return null;
    }, [step]);

    return ListTile(
      title: Text(current.value.name),
      leading: Text(current.value.block.runtimeType.toString()),
      subtitle: Text(current.value.entryGuard.toString()),

      onTap: () async {
        final ret = await Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => StepEditPage(step: current.value),
          ),
        );
        if (ret is s.Step) {
          current.value = ret;
          onChanged(ret);
        }
      },
    );
  }
}
