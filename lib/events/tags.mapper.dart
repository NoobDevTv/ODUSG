// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tags.dart';

class TagMapper extends ClassMapperBase<Tag> {
  TagMapper._();

  static TagMapper? _instance;
  static TagMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TagMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Tag';

  static String _$tag(Tag v) => v.tag;
  static const Field<Tag, String> _f$tag = Field('tag', _$tag);
  static bool _$temporary(Tag v) => v.temporary;
  static const Field<Tag, bool> _f$temporary =
      Field('temporary', _$temporary, opt: true, def: false);

  @override
  final MappableFields<Tag> fields = const {
    #tag: _f$tag,
    #temporary: _f$temporary,
  };

  static Tag _instantiate(DecodingData data) {
    return Tag(data.dec(_f$tag), temporary: data.dec(_f$temporary));
  }

  @override
  final Function instantiate = _instantiate;

  static Tag fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Tag>(map);
  }

  static Tag fromJson(String json) {
    return ensureInitialized().decodeJson<Tag>(json);
  }
}

mixin TagMappable {
  String toJson() {
    return TagMapper.ensureInitialized().encodeJson<Tag>(this as Tag);
  }

  Map<String, dynamic> toMap() {
    return TagMapper.ensureInitialized().encodeMap<Tag>(this as Tag);
  }

  TagCopyWith<Tag, Tag, Tag> get copyWith =>
      _TagCopyWithImpl(this as Tag, $identity, $identity);
  @override
  String toString() {
    return TagMapper.ensureInitialized().stringifyValue(this as Tag);
  }

  @override
  bool operator ==(Object other) {
    return TagMapper.ensureInitialized().equalsValue(this as Tag, other);
  }

  @override
  int get hashCode {
    return TagMapper.ensureInitialized().hashValue(this as Tag);
  }
}

extension TagValueCopy<$R, $Out> on ObjectCopyWith<$R, Tag, $Out> {
  TagCopyWith<$R, Tag, $Out> get $asTag =>
      $base.as((v, t, t2) => _TagCopyWithImpl(v, t, t2));
}

abstract class TagCopyWith<$R, $In extends Tag, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? tag, bool? temporary});
  TagCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TagCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Tag, $Out>
    implements TagCopyWith<$R, Tag, $Out> {
  _TagCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Tag> $mapper = TagMapper.ensureInitialized();
  @override
  $R call({String? tag, bool? temporary}) => $apply(FieldCopyWithData({
        if (tag != null) #tag: tag,
        if (temporary != null) #temporary: temporary
      }));
  @override
  Tag $make(CopyWithData data) => Tag(data.get(#tag, or: $value.tag),
      temporary: data.get(#temporary, or: $value.temporary));

  @override
  TagCopyWith<$R2, Tag, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TagCopyWithImpl($value, $cast, t);
}

class TagsMapper extends ClassMapperBase<Tags> {
  TagsMapper._();

  static TagsMapper? _instance;
  static TagsMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TagsMapper._());
      TagMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Tags';

  static List<Tag> _$tags(Tags v) => v.tags;
  static const Field<Tags, List<Tag>> _f$tags = Field('tags', _$tags);

  @override
  final MappableFields<Tags> fields = const {
    #tags: _f$tags,
  };

  static Tags _instantiate(DecodingData data) {
    return Tags(data.dec(_f$tags));
  }

  @override
  final Function instantiate = _instantiate;

  static Tags fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Tags>(map);
  }

  static Tags fromJson(String json) {
    return ensureInitialized().decodeJson<Tags>(json);
  }
}

mixin TagsMappable {
  String toJson() {
    return TagsMapper.ensureInitialized().encodeJson<Tags>(this as Tags);
  }

  Map<String, dynamic> toMap() {
    return TagsMapper.ensureInitialized().encodeMap<Tags>(this as Tags);
  }

  TagsCopyWith<Tags, Tags, Tags> get copyWith =>
      _TagsCopyWithImpl(this as Tags, $identity, $identity);
  @override
  String toString() {
    return TagsMapper.ensureInitialized().stringifyValue(this as Tags);
  }

  @override
  bool operator ==(Object other) {
    return TagsMapper.ensureInitialized().equalsValue(this as Tags, other);
  }

  @override
  int get hashCode {
    return TagsMapper.ensureInitialized().hashValue(this as Tags);
  }
}

extension TagsValueCopy<$R, $Out> on ObjectCopyWith<$R, Tags, $Out> {
  TagsCopyWith<$R, Tags, $Out> get $asTags =>
      $base.as((v, t, t2) => _TagsCopyWithImpl(v, t, t2));
}

abstract class TagsCopyWith<$R, $In extends Tags, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Tag, TagCopyWith<$R, Tag, Tag>> get tags;
  $R call({List<Tag>? tags});
  TagsCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TagsCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Tags, $Out>
    implements TagsCopyWith<$R, Tags, $Out> {
  _TagsCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Tags> $mapper = TagsMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Tag, TagCopyWith<$R, Tag, Tag>> get tags => ListCopyWith(
      $value.tags, (v, t) => v.copyWith.$chain(t), (v) => call(tags: v));
  @override
  $R call({List<Tag>? tags}) =>
      $apply(FieldCopyWithData({if (tags != null) #tags: tags}));
  @override
  Tags $make(CopyWithData data) => Tags(data.get(#tags, or: $value.tags));

  @override
  TagsCopyWith<$R2, Tags, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _TagsCopyWithImpl($value, $cast, t);
}
