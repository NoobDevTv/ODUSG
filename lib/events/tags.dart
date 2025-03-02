class Tag {
  final String tag;
  final bool temporary;

  const Tag(
    this.tag, {
    this.temporary = false,
  });

  @override
  bool operator ==(covariant Tag other) {
    if (identical(this, other)) return true;

    return tag == other.tag;
  }

  @override
  int get hashCode => tag.hashCode;

  @override
  String toString() {
    if (temporary) return "Temporary $tag";
    return tag;
  }
}

class Tags {
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
