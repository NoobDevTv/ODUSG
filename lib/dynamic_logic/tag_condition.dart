import 'package:flutter/services.dart';
import 'package:odusg/dynamic_logic/condition_operator.dart';

class TagCondition {
  final List<TagOperator> tagOperators;
  final List<ConditionOperator> conditionOperators;
  final List<dynamic> operands;

  TagCondition({
    required this.tagOperators,
    required this.conditionOperators,
    required this.operands,
  });

  bool evaluate() {
    bool? previousRes;
    for (var i = 0; i < tagOperators.length; i++) {
      final operator = tagOperators[i];
      final op1 = operands[i * 2];
      final op2 = operands[i * 2 + 1];
      final res = switch (operator) {
        TagOperator.less => op1 < op2,
        TagOperator.equals => op1 == op2,
        TagOperator.greater => op1 > op2,
        TagOperator.none => throw UnsupportedError(
            "None shouldn't be inside the parsed or created result"),
      };
      if (i > 0) {
        final cond = conditionOperators[i - 1];
        previousRes = switch (cond) {
          ConditionOperator.and => (previousRes ?? true) && res,
          ConditionOperator.or => (previousRes ?? false) || res,
          ConditionOperator.none => throw UnsupportedError(
              "None shouldn't be inside the parsed or created result"),
        };
      } else {
        previousRes = res;
      }

      if (conditionOperators.length <= i) return previousRes!;
    }
    return true;
  }

  static TagCondition parse(String str) {
    List<TagOperator> tagOp = [];
    List<ConditionOperator> condOp = [];
    List<String> operands = [];

    final buff = StringBuffer();
    for (var i = 0; i < str.length; i++) {
      final char = str[i];
      if (TextLayoutMetrics.isWhitespace(char.runes.first)) continue;

      if (TagOperator.values.firstWhere((x) => x.representation == char,
              orElse: () => TagOperator.none)
          case TagOperator op when op != TagOperator.none) {
        tagOp.add(op);
        operands.add(buff.toString());
        buff.clear();
        continue;
      }
      if (ConditionOperator.values.firstWhere((x) => x.representation == char,
              orElse: () => ConditionOperator.none)
          case ConditionOperator op when op != ConditionOperator.none) {
        condOp.add(op);
        operands.add(buff.toString());
        buff.clear();
        continue;
      }
      buff.write(char);
    }

    operands.add(buff.toString());

    return TagCondition(
        tagOperators: tagOp, conditionOperators: condOp, operands: operands);
  }

  @override
  String toString() {
    final retBuffer = StringBuffer();
    for (var i = 0; i < tagOperators.length; i++) {
      final operator = tagOperators[i];
      final op1 = operands[i * 2];
      final op2 = operands[i * 2 + 1];
      retBuffer.write(op1);
      retBuffer.write(operator.representation);
      retBuffer.write(op2);
      if (conditionOperators.length > i) {
        final cond = conditionOperators[i];
        retBuffer.write(cond.representation);
      }
    }
    return retBuffer.toString();
  }
}
