import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/dynamic_logic/step.dart' as s;
import 'package:odusg/editor/step_edit_page.dart';
import 'package:odusg/models/scenario.dart';

class StepWidget extends HookWidget {
  const StepWidget({
    super.key,
    required this.step,
    required this.onChanged,
    required this.scenario,
  });

  final s.Step step;
  final void Function(s.Step) onChanged;
  final Scenario scenario;

  @override
  Widget build(BuildContext context) {
    final current = useState(step);
    useEffect(() {
      current.value = step;
      return null;
    }, [step]);

    return ListTile(
      title: Text(current.value.name),
      isThreeLine: false,
      trailing: Padding(
        padding: const EdgeInsets.only(right: 8.0),
        child: IconButton(
          onPressed: () {
            Clipboard.setData(ClipboardData(text: step.toJson()));
          },
          icon: Icon(Icons.copy),
        ),
      ),
      subtitle: Text(
        "${current.value.block.runtimeType}\n${current.value.entryGuard}",
      ),
      onTap: () async {
        final ret = await Navigator.push(
          context,
          MaterialPageRoute(
            builder:
                (context) =>
                    StepEditPage(step: current.value, scenario: scenario),
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
