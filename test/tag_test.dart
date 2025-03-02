import 'package:flutter_test/flutter_test.dart';
import 'package:odusg/events/tags.dart';

void main() {
  test('DoEquality ', () {
    const tag1 = Tag("abv");
    const tag2 = Tag("abv", temporary: true);
    expect(tag1 == tag2, true);
  });

  test('No Equality ', () {
    const tag1 = Tag("abv");
    const tag2 = Tag("abv2", temporary: true);
    expect(tag1 == tag2, false);
  });
}
