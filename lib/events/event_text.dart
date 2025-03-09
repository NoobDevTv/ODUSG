import 'package:dart_mappable/dart_mappable.dart';
import 'package:odusg/events/tags.dart';

part 'event_text.mapper.dart';

@MappableClass()
class EventText  with EventTextMappable{
  final String text;
  final Tags tags;

  const EventText(this.text, {this.tags = const Tags([])});

  bool matches(List<Tag> myTags) => tags.matches(myTags);
}
