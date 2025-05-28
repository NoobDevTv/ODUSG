// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'change_tag_block.dart';

class ChangeTagBlockMapper extends SubClassMapperBase<ChangeTagBlock> {
  ChangeTagBlockMapper._();

  static ChangeTagBlockMapper? _instance;
  static ChangeTagBlockMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChangeTagBlockMapper._());
      BlockMapper.ensureInitialized().addSubMapper(_instance!);
      TagFilterMapper.ensureInitialized();
      TagMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ChangeTagBlock';

  static String _$text(ChangeTagBlock v) => v.text;
  static const Field<ChangeTagBlock, String> _f$text =
      Field('text', _$text, opt: true, def: "");
  static TagFilter? _$affectedPlayers(ChangeTagBlock v) => v.affectedPlayers;
  static const Field<ChangeTagBlock, TagFilter> _f$affectedPlayers =
      Field('affectedPlayers', _$affectedPlayers, opt: true);
  static List<Tag> _$tags(ChangeTagBlock v) => v.tags;
  static const Field<ChangeTagBlock, List<Tag>> _f$tags = Field('tags', _$tags);
  static bool _$remove(ChangeTagBlock v) => v.remove;
  static const Field<ChangeTagBlock, bool> _f$remove =
      Field('remove', _$remove, opt: true, def: false);
  static bool _$cover(ChangeTagBlock v) => v.cover;
  static const Field<ChangeTagBlock, bool> _f$cover =
      Field('cover', _$cover, opt: true, def: false);
  static bool _$foreachPlayer(ChangeTagBlock v) => v.foreachPlayer;
  static const Field<ChangeTagBlock, bool> _f$foreachPlayer =
      Field('foreachPlayer', _$foreachPlayer, opt: true, def: false);
  static Map<String, String> _$perTagText(ChangeTagBlock v) => v.perTagText;
  static const Field<ChangeTagBlock, Map<String, String>> _f$perTagText =
      Field('perTagText', _$perTagText, opt: true, def: const {});

  @override
  final MappableFields<ChangeTagBlock> fields = const {
    #text: _f$text,
    #affectedPlayers: _f$affectedPlayers,
    #tags: _f$tags,
    #remove: _f$remove,
    #cover: _f$cover,
    #foreachPlayer: _f$foreachPlayer,
    #perTagText: _f$perTagText,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = "ChangeTagBlock";
  @override
  late final ClassMapperBase superMapper = BlockMapper.ensureInitialized();

  static ChangeTagBlock _instantiate(DecodingData data) {
    return ChangeTagBlock(
        text: data.dec(_f$text),
        affectedPlayers: data.dec(_f$affectedPlayers),
        tags: data.dec(_f$tags),
        remove: data.dec(_f$remove),
        cover: data.dec(_f$cover),
        foreachPlayer: data.dec(_f$foreachPlayer),
        perTagText: data.dec(_f$perTagText));
  }

  @override
  final Function instantiate = _instantiate;

  static ChangeTagBlock fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChangeTagBlock>(map);
  }

  static ChangeTagBlock fromJson(String json) {
    return ensureInitialized().decodeJson<ChangeTagBlock>(json);
  }
}

mixin ChangeTagBlockMappable {
  String toJson() {
    return ChangeTagBlockMapper.ensureInitialized()
        .encodeJson<ChangeTagBlock>(this as ChangeTagBlock);
  }

  Map<String, dynamic> toMap() {
    return ChangeTagBlockMapper.ensureInitialized()
        .encodeMap<ChangeTagBlock>(this as ChangeTagBlock);
  }

  ChangeTagBlockCopyWith<ChangeTagBlock, ChangeTagBlock, ChangeTagBlock>
      get copyWith => _ChangeTagBlockCopyWithImpl(
          this as ChangeTagBlock, $identity, $identity);
  @override
  String toString() {
    return ChangeTagBlockMapper.ensureInitialized()
        .stringifyValue(this as ChangeTagBlock);
  }

  @override
  bool operator ==(Object other) {
    return ChangeTagBlockMapper.ensureInitialized()
        .equalsValue(this as ChangeTagBlock, other);
  }

  @override
  int get hashCode {
    return ChangeTagBlockMapper.ensureInitialized()
        .hashValue(this as ChangeTagBlock);
  }
}

extension ChangeTagBlockValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChangeTagBlock, $Out> {
  ChangeTagBlockCopyWith<$R, ChangeTagBlock, $Out> get $asChangeTagBlock =>
      $base.as((v, t, t2) => _ChangeTagBlockCopyWithImpl(v, t, t2));
}

abstract class ChangeTagBlockCopyWith<$R, $In extends ChangeTagBlock, $Out>
    implements BlockCopyWith<$R, $In, $Out> {
  TagFilterCopyWith<$R, TagFilter, TagFilter>? get affectedPlayers;
  ListCopyWith<$R, Tag, TagCopyWith<$R, Tag, Tag>> get tags;
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText;
  @override
  $R call(
      {String? text,
      TagFilter? affectedPlayers,
      List<Tag>? tags,
      bool? remove,
      bool? cover,
      bool? foreachPlayer,
      Map<String, String>? perTagText});
  ChangeTagBlockCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ChangeTagBlockCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChangeTagBlock, $Out>
    implements ChangeTagBlockCopyWith<$R, ChangeTagBlock, $Out> {
  _ChangeTagBlockCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChangeTagBlock> $mapper =
      ChangeTagBlockMapper.ensureInitialized();
  @override
  TagFilterCopyWith<$R, TagFilter, TagFilter>? get affectedPlayers =>
      $value.affectedPlayers?.copyWith.$chain((v) => call(affectedPlayers: v));
  @override
  ListCopyWith<$R, Tag, TagCopyWith<$R, Tag, Tag>> get tags => ListCopyWith(
      $value.tags, (v, t) => v.copyWith.$chain(t), (v) => call(tags: v));
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText => MapCopyWith(
          $value.perTagText,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(perTagText: v));
  @override
  $R call(
          {String? text,
          Object? affectedPlayers = $none,
          List<Tag>? tags,
          bool? remove,
          bool? cover,
          bool? foreachPlayer,
          Map<String, String>? perTagText}) =>
      $apply(FieldCopyWithData({
        if (text != null) #text: text,
        if (affectedPlayers != $none) #affectedPlayers: affectedPlayers,
        if (tags != null) #tags: tags,
        if (remove != null) #remove: remove,
        if (cover != null) #cover: cover,
        if (foreachPlayer != null) #foreachPlayer: foreachPlayer,
        if (perTagText != null) #perTagText: perTagText
      }));
  @override
  ChangeTagBlock $make(CopyWithData data) => ChangeTagBlock(
      text: data.get(#text, or: $value.text),
      affectedPlayers: data.get(#affectedPlayers, or: $value.affectedPlayers),
      tags: data.get(#tags, or: $value.tags),
      remove: data.get(#remove, or: $value.remove),
      cover: data.get(#cover, or: $value.cover),
      foreachPlayer: data.get(#foreachPlayer, or: $value.foreachPlayer),
      perTagText: data.get(#perTagText, or: $value.perTagText));

  @override
  ChangeTagBlockCopyWith<$R2, ChangeTagBlock, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ChangeTagBlockCopyWithImpl($value, $cast, t);
}
