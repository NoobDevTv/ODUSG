enum ConditionOperator {
  none(""),
  and("&"),
  or("|");

  final String representation;
  const ConditionOperator(this.representation);
}

enum TagOperator {
  none(""),
  less("<"),
  equals("="),
  greater(">");

  final String representation;
  const TagOperator(this.representation);
}

enum TagModifier {
  none(""),
  invert("!");

  final String representation;
  const TagModifier(this.representation);
}
