import 'dart:collection';
import 'dart:typed_data';

import 'package:dart_mappable/dart_mappable.dart';

part 'tags.mapper.dart';

@MappableEnum()
enum TagType {
  global("game"),
  player("player"),
  role("role"),
  playerRole("player.role"),
  wincondition("windondition"),
  name("player.name");

  final String representation;
  const TagType(this.representation);
}

@MappableClass()
class Tag with TagMappable {
  final String tag;
  final bool temporary;
  final TagType tagType;

  const Tag(this.tag, {this.temporary = false, this.tagType = TagType.global});

  static Tag parse(String s) {
    final lastPoint = s.lastIndexOf('.');
    if (lastPoint == -1) return Tag(s);
    final prefix = s.substring(0, lastPoint);
    final tag = s.substring(lastPoint + 1);
    return Tag(tag, tagType: _getTagTypeByLeading(prefix));
  }

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
    return getStringRepresantation();
  }

  String getStringRepresantation() {
    return "${_getTagTypeLeading()}$tag";
  }

  String _getTagTypeLeading() {
    return "${tagType.representation}.";
    return switch (tagType) {
      TagType.player => "player.",
      TagType.role => "role.",
      TagType.playerRole => "player.role.",
      TagType.wincondition => "wincondition.",
      TagType.name => "player.name.",
      TagType.global || _ => "game.",
    };
  }

  static TagType _getTagTypeByLeading(String leading) {
    return switch (leading) {
      "player" => TagType.player,
      "role" => TagType.role,
      "player.role" => TagType.playerRole,
      "wincondition" => TagType.wincondition,
      "player.name" => TagType.name,
      "game" || _ => TagType.global,
    };
  }
}

extension ABC on List<Tag> {
  bool matches(List<Tag> myTags) {
    if (isEmpty) return true;
    if (myTags.isEmpty) return false;

    for (var tag in this) {
      if (!myTags.contains(tag)) return false;
    }
    return true;
  }

  List<String> asStringList() {
    return map((x) => x.tag).toList(growable: false);
  }

  bool contains(Tag other) {
    if (isEmpty) return false;
    return contains(other);
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
