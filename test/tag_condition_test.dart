import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:odusg/dynamic_logic/condition_operator.dart';
import 'package:odusg/dynamic_logic/tag_condition.dart';

import 'package:odusg/main.dart';
import 'package:parameterized_test/parameterized_test.dart';
import 'package:collection/collection.dart';

void main() {
  void doTest(
      List<TagOperator> tagOperators,
      List<ConditionOperator> conditionOperators,
      List<dynamic> operands,
      bool expects) {
    final cond = TagCondition(
        conditionOperators: conditionOperators,
        tagOperators: tagOperators,
        operands: operands);
    expect(cond.evaluate(), expects);
  }

  void doParseTest(String input, List<TagOperator> tagOperators,
      List<ConditionOperator> conditionOperators, List<dynamic> operands) {
    final parsed = TagCondition.parse(input);
    final res1 = const DeepCollectionEquality()
        .equals(parsed.tagOperators, tagOperators);
    final res2 = const DeepCollectionEquality()
        .equals(parsed.conditionOperators, conditionOperators);
    final res3 =
        const DeepCollectionEquality().equals(parsed.operands, operands);
    expect(res1, true);
    expect(res2, true);
    expect(res3, true);
  }

  void doParseThenEvaluate(String input, bool expects) {
    final parsed = TagCondition.parse(input);
    expect(parsed.evaluate(), expects);
  }

  void doParseThenEvaluateWT(
      String input, Map<String, int> tags, bool expects) {
    final parsed = TagCondition.parse(input);
    expect(parsed.evaluate(tags), expects);
  }

  group('Parse', () {
    parameterizedTest(
        'String Parsing Success',
        [
          [
            "4 > 2 | 1.2 = 1 & 7 < 1",
            [TagOperator.greater, TagOperator.equals, TagOperator.less],
            <ConditionOperator>[ConditionOperator.or, ConditionOperator.and],
            <dynamic>["4", "2", "1.2", "1", "7", "1"],
          ],
          [
            "player.names = 2 | randomString=test&704 < 1",
            [TagOperator.equals, TagOperator.equals, TagOperator.less],
            <ConditionOperator>[ConditionOperator.or, ConditionOperator.and],
            <dynamic>["player.names", "2", "randomString", "test", "704", "1"],
          ],
        ],
        doParseTest);
  });

  group('ParseEqualsToString', () {
    parameterizedTest('String Parsing Success', [
      [
        "4>2|1.2=1&7<1",
      ],
    ], (String input) {
      final cond = TagCondition.parse(input);
      expect(cond.toString(), input);
    });
  });

  group('Complex Tests', () {
    parameterizedTest(
        'Tests single and and or combinations and condition',
        [
          [
            [TagOperator.less, TagOperator.equals],
            <ConditionOperator>[ConditionOperator.and],
            <dynamic>[1, 2, 3, 3],
            true
          ],
          [
            [TagOperator.less, TagOperator.equals],
            <ConditionOperator>[ConditionOperator.or],
            <dynamic>[1, 2, 3, 3],
            true
          ],
          [
            [TagOperator.less, TagOperator.greater],
            <ConditionOperator>[ConditionOperator.or],
            <dynamic>[1, 2, 3, 3],
            true
          ],
          [
            [TagOperator.less, TagOperator.greater],
            <ConditionOperator>[ConditionOperator.and],
            <dynamic>[1, 2, 3, 3],
            false
          ],
          [
            [TagOperator.less, TagOperator.greater],
            <ConditionOperator>[ConditionOperator.or],
            <dynamic>[2, 11, 3, 3],
            true
          ],
        ],
        doTest);

    parameterizedTest(
        'Tests and or combinations and condition',
        [
          [
            [TagOperator.less, TagOperator.equals, TagOperator.greater],
            <ConditionOperator>[ConditionOperator.and, ConditionOperator.and],
            <dynamic>[1, 2, 3, 3, 4, 2],
            true
          ],
          [
            [TagOperator.less, TagOperator.equals, TagOperator.greater],
            <ConditionOperator>[ConditionOperator.and, ConditionOperator.and],
            <dynamic>[1, 2, 3, 3, 2, 4],
            false
          ],
        ],
        doTest);
  });
  group('Parse Evaluate', () {
    parameterizedTest(
        'String Parsing Success',
        [
          [
            "2 < 11",
            true,
          ],
          ["1 < 5", true],
          ["1.5 < 5", true],
          ["5.5 < 5", false],
          ["0.1 > 0.01", true],
        ],
        doParseThenEvaluate);
  });
  group('Parse Evaluate With Tags', () {
    parameterizedTest(
        'String Parsing Success',
        [
          [
            "player.alive < 11",
            {"player.alive": 12},
            false,
          ],
          [
            "player.alive < 5",
            <String, int>{},
            true,
          ],
          [
            "player.alive < 11",
            {"player.alive": 10},
            true,
          ],
          [
            "player.alive > 1",
            {"players.alive": 10},
            false,
          ],
        ],
        doParseThenEvaluateWT);
  });

  group('Simple Conditions', () {
    parameterizedTest(
        'Tests simple less condition',
        [
          [
            [TagOperator.less],
            <ConditionOperator>[],
            <dynamic>[1, 2],
            true
          ],
          [
            [TagOperator.less],
            <ConditionOperator>[],
            <dynamic>[2, 1],
            false
          ],
          [
            [TagOperator.less],
            <ConditionOperator>[],
            <dynamic>[2, 2],
            false
          ],
          [
            <TagOperator>[],
            <ConditionOperator>[],
            <dynamic>[],
            true,
          ]
        ],
        doTest);

    parameterizedTest(
        'Tests simple greater condition',
        [
          [
            [TagOperator.greater],
            <ConditionOperator>[],
            <dynamic>[1, 2],
            false
          ],
          [
            [TagOperator.greater],
            <ConditionOperator>[],
            <dynamic>[2, 1],
            true
          ],
          [
            [TagOperator.greater],
            <ConditionOperator>[],
            <dynamic>[2, 2],
            false
          ]
        ],
        doTest);

    parameterizedTest(
        'Tests simple equal condition',
        [
          [
            [TagOperator.equals],
            <ConditionOperator>[],
            <dynamic>[1, 2],
            false
          ],
          [
            [TagOperator.equals],
            <ConditionOperator>[],
            <dynamic>[2, 1],
            false
          ],
          [
            [TagOperator.equals],
            <ConditionOperator>[],
            <dynamic>[2, 2],
            true
          ]
        ],
        doTest);
  });
}
