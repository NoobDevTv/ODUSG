// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'next_button_block.dart';

class NextButtonBlockMapper extends SubClassMapperBase<NextButtonBlock> {
  NextButtonBlockMapper._();

  static NextButtonBlockMapper? _instance;
  static NextButtonBlockMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NextButtonBlockMapper._());
      BlockMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'NextButtonBlock';

  static bool _$endsGame(NextButtonBlock v) => v.endsGame;
  static const Field<NextButtonBlock, bool> _f$endsGame =
      Field('endsGame', _$endsGame);
  static String _$text(NextButtonBlock v) => v.text;
  static const Field<NextButtonBlock, String> _f$text = Field('text', _$text);
  static String _$buttonText(NextButtonBlock v) => v.buttonText;
  static const Field<NextButtonBlock, String> _f$buttonText =
      Field('buttonText', _$buttonText, opt: true, def: "Next");
  static bool _$cover(NextButtonBlock v) => v.cover;
  static const Field<NextButtonBlock, bool> _f$cover =
      Field('cover', _$cover, opt: true, def: false);
  static bool _$foreachPlayer(NextButtonBlock v) => v.foreachPlayer;
  static const Field<NextButtonBlock, bool> _f$foreachPlayer =
      Field('foreachPlayer', _$foreachPlayer, opt: true, def: false);
  static Map<String, String> _$perTagText(NextButtonBlock v) => v.perTagText;
  static const Field<NextButtonBlock, Map<String, String>> _f$perTagText =
      Field('perTagText', _$perTagText, opt: true, def: const {});
  static String? _$image(NextButtonBlock v) => v.image;
  static const Field<NextButtonBlock, String> _f$image =
      Field('image', _$image, opt: true);
  static String? _$ttsMessage(NextButtonBlock v) => v.ttsMessage;
  static const Field<NextButtonBlock, String> _f$ttsMessage =
      Field('ttsMessage', _$ttsMessage, opt: true);

  @override
  final MappableFields<NextButtonBlock> fields = const {
    #endsGame: _f$endsGame,
    #text: _f$text,
    #buttonText: _f$buttonText,
    #cover: _f$cover,
    #foreachPlayer: _f$foreachPlayer,
    #perTagText: _f$perTagText,
    #image: _f$image,
    #ttsMessage: _f$ttsMessage,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'NextButtonBlock';
  @override
  late final ClassMapperBase superMapper = BlockMapper.ensureInitialized();

  static NextButtonBlock _instantiate(DecodingData data) {
    return NextButtonBlock(
        endsGame: data.dec(_f$endsGame),
        text: data.dec(_f$text),
        buttonText: data.dec(_f$buttonText),
        cover: data.dec(_f$cover),
        foreachPlayer: data.dec(_f$foreachPlayer),
        perTagText: data.dec(_f$perTagText),
        image: data.dec(_f$image),
        ttsMessage: data.dec(_f$ttsMessage));
  }

  @override
  final Function instantiate = _instantiate;

  static NextButtonBlock fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NextButtonBlock>(map);
  }

  static NextButtonBlock fromJson(String json) {
    return ensureInitialized().decodeJson<NextButtonBlock>(json);
  }
}

mixin NextButtonBlockMappable {
  String toJson() {
    return NextButtonBlockMapper.ensureInitialized()
        .encodeJson<NextButtonBlock>(this as NextButtonBlock);
  }

  Map<String, dynamic> toMap() {
    return NextButtonBlockMapper.ensureInitialized()
        .encodeMap<NextButtonBlock>(this as NextButtonBlock);
  }

  NextButtonBlockCopyWith<NextButtonBlock, NextButtonBlock, NextButtonBlock>
      get copyWith =>
          _NextButtonBlockCopyWithImpl<NextButtonBlock, NextButtonBlock>(
              this as NextButtonBlock, $identity, $identity);
  @override
  String toString() {
    return NextButtonBlockMapper.ensureInitialized()
        .stringifyValue(this as NextButtonBlock);
  }

  @override
  bool operator ==(Object other) {
    return NextButtonBlockMapper.ensureInitialized()
        .equalsValue(this as NextButtonBlock, other);
  }

  @override
  int get hashCode {
    return NextButtonBlockMapper.ensureInitialized()
        .hashValue(this as NextButtonBlock);
  }
}

extension NextButtonBlockValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NextButtonBlock, $Out> {
  NextButtonBlockCopyWith<$R, NextButtonBlock, $Out> get $asNextButtonBlock =>
      $base.as((v, t, t2) => _NextButtonBlockCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class NextButtonBlockCopyWith<$R, $In extends NextButtonBlock, $Out>
    implements BlockCopyWith<$R, $In, $Out> {
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText;
  @override
  $R call(
      {bool? endsGame,
      String? text,
      String? buttonText,
      bool? cover,
      bool? foreachPlayer,
      Map<String, String>? perTagText,
      String? image,
      String? ttsMessage});
  NextButtonBlockCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NextButtonBlockCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NextButtonBlock, $Out>
    implements NextButtonBlockCopyWith<$R, NextButtonBlock, $Out> {
  _NextButtonBlockCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NextButtonBlock> $mapper =
      NextButtonBlockMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText => MapCopyWith(
          $value.perTagText,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(perTagText: v));
  @override
  $R call(
          {bool? endsGame,
          String? text,
          String? buttonText,
          bool? cover,
          bool? foreachPlayer,
          Map<String, String>? perTagText,
          Object? image = $none,
          Object? ttsMessage = $none}) =>
      $apply(FieldCopyWithData({
        if (endsGame != null) #endsGame: endsGame,
        if (text != null) #text: text,
        if (buttonText != null) #buttonText: buttonText,
        if (cover != null) #cover: cover,
        if (foreachPlayer != null) #foreachPlayer: foreachPlayer,
        if (perTagText != null) #perTagText: perTagText,
        if (image != $none) #image: image,
        if (ttsMessage != $none) #ttsMessage: ttsMessage
      }));
  @override
  NextButtonBlock $make(CopyWithData data) => NextButtonBlock(
      endsGame: data.get(#endsGame, or: $value.endsGame),
      text: data.get(#text, or: $value.text),
      buttonText: data.get(#buttonText, or: $value.buttonText),
      cover: data.get(#cover, or: $value.cover),
      foreachPlayer: data.get(#foreachPlayer, or: $value.foreachPlayer),
      perTagText: data.get(#perTagText, or: $value.perTagText),
      image: data.get(#image, or: $value.image),
      ttsMessage: data.get(#ttsMessage, or: $value.ttsMessage));

  @override
  NextButtonBlockCopyWith<$R2, NextButtonBlock, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NextButtonBlockCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
