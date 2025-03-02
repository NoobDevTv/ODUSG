import 'package:odusg/events/tags.dart';
import 'package:odusg/models/roles.dart';

class Player {
  const Player(
      {required this.name,
      required this.role,
      required this.keyWord,
      required this.keyWordSet,
      required this.tags});

  final String name;

  ///The starting role of the player
  final Role role;

  final String keyWord;
  final List<String> keyWordSet;
  final Tags tags;

  List<Tag> getCompleteTags() {
    return tags.tags.map((x) => Tag("player.${x.tag}")).toList();
  }

  @override
  String toString() {
    return "Player $name, with tags ${tags.tags.join(", ")}";
  }
}
