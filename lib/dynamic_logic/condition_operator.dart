import 'package:dart_mappable/dart_mappable.dart';

part 'condition_operator.mapper.dart';

@MappableEnum()
enum ConditionOperator {
  none(""),
  and("&"),
  or("|");

  final String representation;
  const ConditionOperator(this.representation);
}

@MappableEnum()
enum TagOperator {
  none(""),
  less("<"),
  equals("="),
  greater(">");

  final String representation;
  const TagOperator(this.representation);
}

@MappableEnum()
enum TagModifier {
  none(""),
  invert("!");

  final String representation;
  const TagModifier(this.representation);
}
