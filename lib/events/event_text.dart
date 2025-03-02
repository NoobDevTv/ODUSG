import 'package:odusg/events/tags.dart';

class EventText {
  final String text;
  final Tags tags;

  const EventText(this.text, {this.tags = const Tags([])});

  bool matches(List<Tag> myTags) => tags.matches(myTags);
}
