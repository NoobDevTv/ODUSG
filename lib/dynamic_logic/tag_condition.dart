import 'package:flutter/services.dart';
import 'package:odusg/dynamic_logic/condition_operator.dart';
import 'package:odusg/events/tags.dart';
import 'package:odusg/helpers/iterable_extensions.dart';
import 'package:odusg/models/player.dart';

class TagFilter {
  static const TagFilter empty = TagFilter(
    modifiers: [],
    conditionOperators: [],
    operands: [],
  );

  final List<TagModifier> modifiers;
  final List<ConditionOperator> conditionOperators;
  final List<dynamic> operands;

  const TagFilter({
    required this.modifiers,
    required this.conditionOperators,
    required this.operands,
  });

  bool evaluateSingle(List<Tag> tagList) {
    List<bool> matches = [];
    for (var i = 0; i < operands.length; i++) {
      final tag = Tag(operands[i]);
      final contained = tagList.contains(tag);

      final res = switch (modifiers[i]) {
        TagModifier.none => contained == true,
        TagModifier.invert => contained == false,
      };

      matches.add(res);
    }
    bool matched = true;
    if (matches.isEmpty) {
    } else if (matches.length == 1) {
      matched = matches.first;
    } else {
      for (var i = 1; i < matches.length; i++) {
        final operator = conditionOperators[i - 1];
        final m1 = matches[i - 1];
        final m2 = matches[i];
        matches[i] = switch (operator) {
          ConditionOperator.and => m1 && m2,
          ConditionOperator.or => m1 || m2,
          ConditionOperator.none => throw UnsupportedError(
              "None shouldn't be inside the parsed or created result"),
        };
      }
      matched = matches.last;
    }

    return matched;
  }

  Iterable<Tag> evaluate(List<List<Tag>> tags) sync* {
    for (var tagList in tags) {
      if (evaluateSingle(tagList)) {
        yield* tagList;
      }
    }
  }

  Iterable<Player> evaluatePlayers(List<Player> players) sync* {
    for (var player in players) {
      if (evaluateSingle(player.getCompleteTags())) yield player;
    }
  }

  static TagFilter parse(String str) {
    List<TagModifier> tagMod = [];
    List<String> operands = [];
    List<ConditionOperator> condOp = [];

    final buff = StringBuffer();
    var currentMod = TagModifier.none;
    for (var i = 0; i < str.length; i++) {
      final char = str[i];
      if (TextLayoutMetrics.isWhitespace(char.runes.first)) continue;
      if (TagModifier.values.firstWhere((x) => x.representation == char,
              orElse: () => TagModifier.none)
          case TagModifier op when op != TagModifier.none) {
        currentMod = op;
        buff.clear();
        continue;
      }

      if (ConditionOperator.values.firstWhere((x) => x.representation == char,
              orElse: () => ConditionOperator.none)
          case ConditionOperator op when op != ConditionOperator.none) {
        tagMod.add(currentMod);
        currentMod = TagModifier.none;
        operands.add(buff.toString());
        condOp.add(op);
        buff.clear();
        continue;
      }
      buff.write(char);
    }
    if (buff.isNotEmpty) {
      tagMod.add(currentMod);
      operands.add(buff.toString());
    }

    return TagFilter(
        modifiers: tagMod, conditionOperators: condOp, operands: operands);
  }

  Map<String, int> getTagMap(List<Player> players, List<Tag> gameTags) {
    final filtered = evaluate(
        [...players.map((x) => x.getCompleteTags()), gameTags].toList());
    final mapped = filtered.map((x) => x.tag).groupBy((x) => x);
    final map = mapped.map((key, value) => MapEntry(key, value.length));
    return map;
  }
}

class TagCondition {
  static const enter =
      TagCondition(tagOperators: [], conditionOperators: [], operands: []);

  final List<TagOperator> tagOperators;
  final List<ConditionOperator> conditionOperators;
  final List<dynamic> operands;

  const TagCondition({
    required this.tagOperators,
    required this.conditionOperators,
    required this.operands,
  });

  bool evaluate([Map<String, int> tags = const {}]) {
    bool? previousRes;
    for (var i = 0; i < tagOperators.length; i++) {
      final operator = tagOperators[i];
      final op1Raw = operands[i * 2];
      final op2Raw = operands[i * 2 + 1];
      var op1Num = op1Raw is num ? op1Raw : num.tryParse(op1Raw.toString());
      var op2Num = op2Raw is num ? op2Raw : num.tryParse(op2Raw.toString());
      op1Num ??= tags[op1Raw] ?? 0;
      op2Num ??= tags[op2Raw] ?? 0;

      final res = switch (operator) {
        TagOperator.less => op1Num < op2Num,
        TagOperator.equals => op1Num == op2Num,
        TagOperator.greater => op1Num > op2Num,
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

      if (conditionOperators.length <= i) return previousRes;
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
