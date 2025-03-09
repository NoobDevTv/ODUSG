import 'package:dart_mappable/dart_mappable.dart';

part 'roles.mapper.dart';

@MappableEnum()
enum Role { undefined, bad, good }

@MappableClass()
class Roles with RolesMappable {
  final String tag;
  final String intlKey;
  final List<(int player, int min, int max)> getAssignableAmount;
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
