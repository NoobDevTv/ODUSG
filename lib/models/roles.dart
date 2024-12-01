enum Role { bad, good }

class Roles {
  final String tag;
  final String intlKey;
  final (int, int) Function(int) getAssignableAmount;
  final int priority;

  const Roles({
    required this.tag,
    required this.intlKey,
    required this.getAssignableAmount,
    this.priority = 0,
  });
}
