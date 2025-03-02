import 'dart:math';

import 'package:flutter_test/flutter_test.dart';
import 'package:odusg/dynamic_logic/condition_operator.dart';
import 'package:odusg/dynamic_logic/tag_condition.dart';
import 'package:odusg/events/tags.dart';
import 'package:odusg/helpers/iterable_extensions.dart';

import 'package:odusg/main.dart';
import 'package:parameterized_test/parameterized_test.dart';
import 'package:collection/collection.dart';

void main() {
  void doParseTest(String input, List<TagModifier> tagMods,
      List<ConditionOperator> conditionOperators, List<dynamic> operands) {
    final parsed = TagFilter.parse(input);
    final res1 =
        const DeepCollectionEquality().equals(parsed.modifiers, tagMods);
    final res2 = const DeepCollectionEquality()
        .equals(parsed.conditionOperators, conditionOperators);
    final res3 =
        const DeepCollectionEquality().equals(parsed.operands, operands);
    expect(res1, true);
    expect(res2, true);
    expect(res3, true);
  }

  void doParseEvaluate(
      String input, List<List<String>> tags, List<String> result) {
    final parsed = TagFilter.parse(input);
    final res = parsed
        .evaluate(tags
            .map((x) => [
                  ...x.map(
                    (e) => Tag(e),
                  )
                ])
            .toList())
        .toList();
    res.sort();
    final sortedRes = result.toList();
    sortedRes.sort();
    expect(res, sortedRes);
  }

  group('Parse', () {
    parameterizedTest(
        'Single tag parsing',
        [
          [
            "player.name",
            [TagModifier.none],
            <ConditionOperator>[],
            <dynamic>["player.name"],
          ],
          [
            "!player.name",
            [TagModifier.invert],
            <ConditionOperator>[],
            <dynamic>["player.name"],
          ],
        ],
        doParseTest);

    parameterizedTest(
        'Multi tag parsing',
        [
          [
            "player.name & player.date",
            [TagModifier.none, TagModifier.none],
            <ConditionOperator>[ConditionOperator.and],
            <dynamic>["player.name", "player.date"],
          ],
          [
            "!player.name | player.date",
            [TagModifier.invert, TagModifier.none],
            <ConditionOperator>[ConditionOperator.or],
            <dynamic>["player.name", "player.date"],
          ],
          [
            "!player.name | player.date & !player.test",
            [TagModifier.invert, TagModifier.none, TagModifier.invert],
            <ConditionOperator>[ConditionOperator.or, ConditionOperator.and],
            <dynamic>["player.name", "player.date", "player.test"],
          ],
        ],
        doParseTest);
  });

  group('Parse and Filter', () {
    parameterizedTest(
        'Single tag',
        [
          [
            "player.name",
            [
              ["player.name"],
              ["player.eman"]
            ],
            ["player.name"],
          ],
          [
            "!player.name",
            [
              ["player.name"],
              ["player.eman"]
            ],
            ["player.eman"],
          ],
        ],
        doParseEvaluate);
    parameterizedTest(
        'Mutli tag',
        [
          [
            "player.name & player.dot",
            [
              ["player.name", "player.dot"],
              ["player.eman", "player.dot"]
            ],
            ["player.name", "player.dot"],
          ],
          [
            "player.name | player.dot",
            [
              ["player.name", "player.dot"],
              ["player.eman", "player.dot"]
            ],
            ["player.name", "player.dot", "player.eman", "player.dot"],
          ],
          [
            "player.name & !player.dot",
            [
              ["player.name", "player.dot"],
              ["player.eman", "player.dot"]
            ],
            <String>[],
          ],
          [
            "player.name & !player.dot | player.wolf",
            [
              ["player.name", "player.dot"],
              ["player.eman", "player.dot"],
              ["player.wolf"]
            ],
            ["player.wolf"],
          ],
          [
            "player.name & !player.dot | !player.wolf",
            [
              ["player.name", "player.dot"],
              ["player.eman", "player.dot"],
              ["player.wolf"]
            ],
            ["player.name", "player.dot", "player.eman", "player.dot"],
          ],
          [
            "!player.name & !player.dot | !player.wolf",
            [
              ["player.name", "player.dot"],
              ["player.eman", "player.dot"],
              ["player.wolf"]
            ],
            [
              "player.name",
              "player.dot",
              "player.eman",
              "player.dot",
              "player.wolf",
            ],
          ],
          [
            "player.name & !player.dot | player.wolf",
            [
              ["player.name", "player.dot"],
              ["player.eman", "player.dot"],
              ["player.eman", "player.dot", "player.wolf"]
            ],
            ["player.eman", "player.dot", "player.wolf"],
          ],
        ],
        doParseEvaluate);

    parameterizedTest(
        'Empty filter',
        [
          [
            "",
            [
              ["player.name", "player.dot"],
              ["player.eman", "player.dot"]
            ],
            ["player.name", "player.dot", "player.eman", "player.dot"],
          ],
        ],
        doParseEvaluate);
  });
}
