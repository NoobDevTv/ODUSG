// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'event_text.dart';

class EventTextMapper extends ClassMapperBase<EventText> {
  EventTextMapper._();

  static EventTextMapper? _instance;
  static EventTextMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EventTextMapper._());
      TagsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'EventText';

  static String _$text(EventText v) => v.text;
  static const Field<EventText, String> _f$text = Field('text', _$text);
  static Tags _$tags(EventText v) => v.tags;
  static const Field<EventText, Tags> _f$tags =
      Field('tags', _$tags, opt: true, def: const Tags([]));

  @override
  final MappableFields<EventText> fields = const {
    #text: _f$text,
    #tags: _f$tags,
  };

  static EventText _instantiate(DecodingData data) {
    return EventText(data.dec(_f$text), tags: data.dec(_f$tags));
  }

  @override
  final Function instantiate = _instantiate;

  static EventText fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EventText>(map);
  }

  static EventText fromJson(String json) {
    return ensureInitialized().decodeJson<EventText>(json);
  }
}

mixin EventTextMappable {
  String toJson() {
    return EventTextMapper.ensureInitialized()
        .encodeJson<EventText>(this as EventText);
  }

  Map<String, dynamic> toMap() {
    return EventTextMapper.ensureInitialized()
        .encodeMap<EventText>(this as EventText);
  }

  EventTextCopyWith<EventText, EventText, EventText> get copyWith =>
      _EventTextCopyWithImpl(this as EventText, $identity, $identity);
  @override
  String toString() {
    return EventTextMapper.ensureInitialized()
        .stringifyValue(this as EventText);
  }

  @override
  bool operator ==(Object other) {
    return EventTextMapper.ensureInitialized()
        .equalsValue(this as EventText, other);
  }

  @override
  int get hashCode {
    return EventTextMapper.ensureInitialized().hashValue(this as EventText);
  }
}

extension EventTextValueCopy<$R, $Out> on ObjectCopyWith<$R, EventText, $Out> {
  EventTextCopyWith<$R, EventText, $Out> get $asEventText =>
      $base.as((v, t, t2) => _EventTextCopyWithImpl(v, t, t2));
}

abstract class EventTextCopyWith<$R, $In extends EventText, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  TagsCopyWith<$R, Tags, Tags> get tags;
  $R call({String? text, Tags? tags});
  EventTextCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _EventTextCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, EventText, $Out>
    implements EventTextCopyWith<$R, EventText, $Out> {
  _EventTextCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<EventText> $mapper =
      EventTextMapper.ensureInitialized();
  @override
  TagsCopyWith<$R, Tags, Tags> get tags =>
      $value.tags.copyWith.$chain((v) => call(tags: v));
  @override
  $R call({String? text, Tags? tags}) => $apply(FieldCopyWithData(
      {if (text != null) #text: text, if (tags != null) #tags: tags}));
  @override
  EventText $make(CopyWithData data) =>
      EventText(data.get(#text, or: $value.text),
          tags: data.get(#tags, or: $value.tags));

  @override
  EventTextCopyWith<$R2, EventText, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _EventTextCopyWithImpl($value, $cast, t);
}
