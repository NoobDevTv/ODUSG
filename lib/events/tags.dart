class Tags {
  final List<String> tags;

  const Tags(this.tags);

  bool matches(List<String> myTags) {
    if (tags.isEmpty) return true;
    if (myTags.isEmpty) return false;

    for (var tag in tags) {
      if (!myTags.contains(tag)) return false;
    }
    return true;
  }

  bool contains(String other) {
    if (tags.isEmpty) return false;
    return tags.contains(other);
  }
}
