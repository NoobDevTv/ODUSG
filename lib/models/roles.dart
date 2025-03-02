enum Role { undefined, bad, good }

class Roles {
  final String tag;
  final String intlKey;
  final (int, int) Function(int) getAssignableAmount;
  final int priority;
  final bool isDefault;

  const Roles({
    required this.tag,
    required this.intlKey,
    required this.getAssignableAmount,
    this.priority = 0,
    this.isDefault = false,
  });
}
