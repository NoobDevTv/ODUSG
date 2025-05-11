// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'block.dart';

class BlockMapper extends ClassMapperBase<Block> {
  BlockMapper._();

  static BlockMapper? _instance;
  static BlockMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BlockMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Block';

  static String _$text(Block v) => v.text;
  static const Field<Block, String> _f$text = Field('text', _$text);
  static bool _$cover(Block v) => v.cover;
  static const Field<Block, bool> _f$cover =
      Field('cover', _$cover, opt: true, def: false);
  static bool _$foreachPlayer(Block v) => v.foreachPlayer;
  static const Field<Block, bool> _f$foreachPlayer =
      Field('foreachPlayer', _$foreachPlayer, opt: true, def: false);
  static Map<String, String> _$perTagText(Block v) => v.perTagText;
  static const Field<Block, Map<String, String>> _f$perTagText =
      Field('perTagText', _$perTagText, opt: true, def: const {});

  @override
  final MappableFields<Block> fields = const {
    #text: _f$text,
    #cover: _f$cover,
    #foreachPlayer: _f$foreachPlayer,
    #perTagText: _f$perTagText,
  };

  static Block _instantiate(DecodingData data) {
    return Block(
        text: data.dec(_f$text),
        cover: data.dec(_f$cover),
        foreachPlayer: data.dec(_f$foreachPlayer),
        perTagText: data.dec(_f$perTagText));
  }

  @override
  final Function instantiate = _instantiate;

  static Block fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Block>(map);
  }

  static Block fromJson(String json) {
    return ensureInitialized().decodeJson<Block>(json);
  }
}

mixin BlockMappable {
  String toJson() {
    return BlockMapper.ensureInitialized().encodeJson<Block>(this as Block);
  }

  Map<String, dynamic> toMap() {
    return BlockMapper.ensureInitialized().encodeMap<Block>(this as Block);
  }

  BlockCopyWith<Block, Block, Block> get copyWith =>
      _BlockCopyWithImpl(this as Block, $identity, $identity);
  @override
  String toString() {
    return BlockMapper.ensureInitialized().stringifyValue(this as Block);
  }

  @override
  bool operator ==(Object other) {
    return BlockMapper.ensureInitialized().equalsValue(this as Block, other);
  }

  @override
  int get hashCode {
    return BlockMapper.ensureInitialized().hashValue(this as Block);
  }
}

extension BlockValueCopy<$R, $Out> on ObjectCopyWith<$R, Block, $Out> {
  BlockCopyWith<$R, Block, $Out> get $asBlock =>
      $base.as((v, t, t2) => _BlockCopyWithImpl(v, t, t2));
}

abstract class BlockCopyWith<$R, $In extends Block, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText;
  $R call(
      {String? text,
      bool? cover,
      bool? foreachPlayer,
      Map<String, String>? perTagText});
  BlockCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _BlockCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Block, $Out>
    implements BlockCopyWith<$R, Block, $Out> {
  _BlockCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Block> $mapper = BlockMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText => MapCopyWith(
          $value.perTagText,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(perTagText: v));
  @override
  $R call(
          {String? text,
          bool? cover,
          bool? foreachPlayer,
          Map<String, String>? perTagText}) =>
      $apply(FieldCopyWithData({
        if (text != null) #text: text,
        if (cover != null) #cover: cover,
        if (foreachPlayer != null) #foreachPlayer: foreachPlayer,
        if (perTagText != null) #perTagText: perTagText
      }));
  @override
  Block $make(CopyWithData data) => Block(
      text: data.get(#text, or: $value.text),
      cover: data.get(#cover, or: $value.cover),
      foreachPlayer: data.get(#foreachPlayer, or: $value.foreachPlayer),
      perTagText: data.get(#perTagText, or: $value.perTagText));

  @override
  BlockCopyWith<$R2, Block, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _BlockCopyWithImpl($value, $cast, t);
}
