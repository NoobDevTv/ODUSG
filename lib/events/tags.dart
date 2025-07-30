import 'package:dart_mappable/dart_mappable.dart';

part 'tags.mapper.dart';

enum TagType { global, player, role, playerRole, wincondition }

@MappableClass()
class Tag with TagMappable {
  final String tag;
  final bool temporary;
  final TagType tagType;

  const Tag(this.tag, {this.temporary = false, this.tagType = TagType.global});

  @override
  bool operator ==(covariant Tag other) {
    if (identical(this, other)) return true;

    return tag == other.tag && tagType == other.tagType;
  }

  @override
  int get hashCode => tag.hashCode ^ tagType.hashCode;

  @override
  String toString() {
    if (temporary) return "Temporary $tag";
    return "${_getTagTypeLeading()}$tag";
  }

  String _getTagTypeLeading() {
    return switch (tagType) {
      TagType.player => "player.",
      TagType.role => "role.",
      TagType.playerRole => "player.role.",
      TagType.wincondition => "wincondition.",
      TagType.global || _ => "game.",
    };
  }
}

@MappableClass()
class Tags with TagsMappable {
  final List<Tag> tags;

  const Tags(this.tags);

  Tags.mutable(this.tags);

  bool matches(List<Tag> myTags) {
    if (tags.isEmpty) return true;
    if (myTags.isEmpty) return false;

    for (var tag in tags) {
      if (!myTags.contains(tag)) return false;
    }
    return true;
  }

  List<String> asStringList() {
    return tags.map((x) => x.tag).toList(growable: false);
  }

  bool contains(Tag other) {
    if (tags.isEmpty) return false;
    return tags.contains(other);
  }
}
