import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/dynamic_logic/block.dart';
import 'package:odusg/dynamic_logic/step.dart' as s;
import 'package:odusg/models/scenario.dart';

abstract class BlockWidget<T extends Block> extends HookWidget {
  const BlockWidget({
    super.key,
    required this.block,
    required this.scenario,
    required this.step,
  });

  final ValueNotifier<T> block;
  final Scenario scenario;
  final s.Step step;
  T get currentBlock => block.value;

  @override
  Widget build(BuildContext context) {
    // final b = useState(currentBlock);
    // useEffect(() {
    //   b.value = currentBlock;
    //   return null;
    // }, [currentBlock]);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: listBuild(context, block),
    );
  }

  List<Widget> listBuild(BuildContext context, ValueNotifier<T> block);
}
