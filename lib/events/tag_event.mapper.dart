// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tag_event.dart';

class TagEventMapper extends SubClassMapperBase<TagEvent> {
  TagEventMapper._();

  static TagEventMapper? _instance;
  static TagEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TagEventMapper._());
      EventInfoMapper.ensureInitialized().addSubMapper(_instance!);
      EventTextMapper.ensureInitialized();
      TagMapper.ensureInitialized();
      TagsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TagEvent';

  static List<EventText> _$textAlterations(TagEvent v) => v.textAlterations;
  static const Field<TagEvent, List<EventText>> _f$textAlterations =
      Field('textAlterations', _$textAlterations);
  static Tag? _$replacementTag(TagEvent v) => v.replacementTag;
  static const Field<TagEvent, Tag> _f$replacementTag =
      Field('replacementTag', _$replacementTag, opt: true);
  static Tag? _$newTag(TagEvent v) => v.newTag;
  static const Field<TagEvent, Tag> _f$newTag =
      Field('newTag', _$newTag, opt: true);
  static int _$maximumAmount(TagEvent v) => v.maximumAmount;
  static const Field<TagEvent, int> _f$maximumAmount =
      Field('maximumAmount', _$maximumAmount, opt: true, def: 1);
  static Tags _$requiredTags(TagEvent v) => v.requiredTags;
  static const Field<TagEvent, Tags> _f$requiredTags =
      Field('requiredTags', _$requiredTags, opt: true, def: const Tags([]));
  static String _$name(TagEvent v) => v.name;
  static const Field<TagEvent, String> _f$name =
      Field('name', _$name, opt: true, def: "");

  @override
  final MappableFields<TagEvent> fields = const {
    #textAlterations: _f$textAlterations,
    #replacementTag: _f$replacementTag,
    #newTag: _f$newTag,
    #maximumAmount: _f$maximumAmount,
    #requiredTags: _f$requiredTags,
    #name: _f$name,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'TagEvent';
  @override
  late final ClassMapperBase superMapper = EventInfoMapper.ensureInitialized();

  static TagEvent _instantiate(DecodingData data) {
    return TagEvent(data.dec(_f$textAlterations),
        replacementTag: data.dec(_f$replacementTag),
        newTag: data.dec(_f$newTag),
        maximumAmount: data.dec(_f$maximumAmount),
        requiredTags: data.dec(_f$requiredTags),
        name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static TagEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TagEvent>(map);
  }

  static TagEvent fromJson(String json) {
    return ensureInitialized().decodeJson<TagEvent>(json);
  }
}

mixin TagEventMappable {
  String toJson() {
    return TagEventMapper.ensureInitialized()
        .encodeJson<TagEvent>(this as TagEvent);
  }

  Map<String, dynamic> toMap() {
    return TagEventMapper.ensureInitialized()
        .encodeMap<TagEvent>(this as TagEvent);
  }

  TagEventCopyWith<TagEvent, TagEvent, TagEvent> get copyWith =>
      _TagEventCopyWithImpl(this as TagEvent, $identity, $identity);
  @override
  String toString() {
    return TagEventMapper.ensureInitialized().stringifyValue(this as TagEvent);
  }

  @override
  bool operator ==(Object other) {
    return TagEventMapper.ensureInitialized()
        .equalsValue(this as TagEvent, other);
  }

  @override
  int get hashCode {
    return TagEventMapper.ensureInitialized().hashValue(this as TagEvent);
  }
}

extension TagEventValueCopy<$R, $Out> on ObjectCopyWith<$R, TagEvent, $Out> {
  TagEventCopyWith<$R, TagEvent, $Out> get $asTagEvent =>
      $base.as((v, t, t2) => _TagEventCopyWithImpl(v, t, t2));
}

abstract class TagEventCopyWith<$R, $In extends TagEvent, $Out>
    implements EventInfoCopyWith<$R, $In, $Out> {
  @override
  ListCopyWith<$R, EventText, EventTextCopyWith<$R, EventText, EventText>>
      get textAlterations;
  TagCopyWith<$R, Tag, Tag>? get replacementTag;
  TagCopyWith<$R, Tag, Tag>? get newTag;
  @override
  TagsCopyWith<$R, Tags, Tags> get requiredTags;
  @override
  $R call(
      {List<EventText>? textAlterations,
      Tag? replacementTag,
      Tag? newTag,
      int? maximumAmount,
      Tags? requiredTags,
      String? name});
  TagEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TagEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TagEvent, $Out>
    implements TagEventCopyWith<$R, TagEvent, $Out> {
  _TagEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TagEvent> $mapper =
      TagEventMapper.ensureInitialized();
  @override
  ListCopyWith<$R, EventText, EventTextCopyWith<$R, EventText, EventText>>
      get textAlterations => ListCopyWith($value.textAlterations,
          (v, t) => v.copyWith.$chain(t), (v) => call(textAlterations: v));
  @override
  TagCopyWith<$R, Tag, Tag>? get replacementTag =>
      $value.replacementTag?.copyWith.$chain((v) => call(replacementTag: v));
  @override
  TagCopyWith<$R, Tag, Tag>? get newTag =>
      $value.newTag?.copyWith.$chain((v) => call(newTag: v));
  @override
  TagsCopyWith<$R, Tags, Tags> get requiredTags =>
      $value.requiredTags.copyWith.$chain((v) => call(requiredTags: v));
  @override
  $R call(
          {List<EventText>? textAlterations,
          Object? replacementTag = $none,
          Object? newTag = $none,
          int? maximumAmount,
          Tags? requiredTags,
          String? name}) =>
      $apply(FieldCopyWithData({
        if (textAlterations != null) #textAlterations: textAlterations,
        if (replacementTag != $none) #replacementTag: replacementTag,
        if (newTag != $none) #newTag: newTag,
        if (maximumAmount != null) #maximumAmount: maximumAmount,
        if (requiredTags != null) #requiredTags: requiredTags,
        if (name != null) #name: name
      }));
  @override
  TagEvent $make(CopyWithData data) =>
      TagEvent(data.get(#textAlterations, or: $value.textAlterations),
          replacementTag: data.get(#replacementTag, or: $value.replacementTag),
          newTag: data.get(#newTag, or: $value.newTag),
          maximumAmount: data.get(#maximumAmount, or: $value.maximumAmount),
          requiredTags: data.get(#requiredTags, or: $value.requiredTags),
          name: data.get(#name, or: $value.name));

  @override
  TagEventCopyWith<$R2, TagEvent, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TagEventCopyWithImpl($value, $cast, t);
}
