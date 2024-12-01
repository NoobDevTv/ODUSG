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
