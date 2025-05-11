import 'package:flutter/cupertino.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:odusg/dynamic_logic/block.dart';
import 'package:odusg/editor/widgets/base_block_widget.dart';

abstract class BlockWidget<T extends Block> extends BaseBlockWidget {
  const BlockWidget({super.key, required super.block, required super.scenario});

  T get currentBlock => super.block as T;

  @override
  Widget build(BuildContext context) {
    final b = useState(currentBlock);
    useEffect(() {
      b.value = currentBlock;
      return null;
    }, [currentBlock]);
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: listBuild(context, b),
    );
  }

  List<Widget> listBuild(BuildContext context, ValueNotifier<T> block);
}
