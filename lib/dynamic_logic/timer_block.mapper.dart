// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'timer_block.dart';

class TimerBlockMapper extends SubClassMapperBase<TimerBlock> {
  TimerBlockMapper._();

  static TimerBlockMapper? _instance;
  static TimerBlockMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TimerBlockMapper._());
      BlockMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'TimerBlock';

  static Duration _$minTimer(TimerBlock v) => v.minTimer;
  static const Field<TimerBlock, Duration> _f$minTimer =
      Field('minTimer', _$minTimer);
  static Duration _$maxTimer(TimerBlock v) => v.maxTimer;
  static const Field<TimerBlock, Duration> _f$maxTimer =
      Field('maxTimer', _$maxTimer);
  static String _$text(TimerBlock v) => v.text;
  static const Field<TimerBlock, String> _f$text = Field('text', _$text);
  static bool _$cover(TimerBlock v) => v.cover;
  static const Field<TimerBlock, bool> _f$cover =
      Field('cover', _$cover, opt: true, def: false);
  static bool _$foreachPlayer(TimerBlock v) => v.foreachPlayer;
  static const Field<TimerBlock, bool> _f$foreachPlayer =
      Field('foreachPlayer', _$foreachPlayer, opt: true, def: false);
  static Map<String, String> _$perTagText(TimerBlock v) => v.perTagText;
  static const Field<TimerBlock, Map<String, String>> _f$perTagText =
      Field('perTagText', _$perTagText, opt: true, def: const {});
  static String? _$image(TimerBlock v) => v.image;
  static const Field<TimerBlock, String> _f$image =
      Field('image', _$image, opt: true);
  static String? _$ttsMessage(TimerBlock v) => v.ttsMessage;
  static const Field<TimerBlock, String> _f$ttsMessage =
      Field('ttsMessage', _$ttsMessage, opt: true);

  @override
  final MappableFields<TimerBlock> fields = const {
    #minTimer: _f$minTimer,
    #maxTimer: _f$maxTimer,
    #text: _f$text,
    #cover: _f$cover,
    #foreachPlayer: _f$foreachPlayer,
    #perTagText: _f$perTagText,
    #image: _f$image,
    #ttsMessage: _f$ttsMessage,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'TimerBlock';
  @override
  late final ClassMapperBase superMapper = BlockMapper.ensureInitialized();

  static TimerBlock _instantiate(DecodingData data) {
    return TimerBlock(
        minTimer: data.dec(_f$minTimer),
        maxTimer: data.dec(_f$maxTimer),
        text: data.dec(_f$text),
        cover: data.dec(_f$cover),
        foreachPlayer: data.dec(_f$foreachPlayer),
        perTagText: data.dec(_f$perTagText),
        image: data.dec(_f$image),
        ttsMessage: data.dec(_f$ttsMessage));
  }

  @override
  final Function instantiate = _instantiate;

  static TimerBlock fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TimerBlock>(map);
  }

  static TimerBlock fromJson(String json) {
    return ensureInitialized().decodeJson<TimerBlock>(json);
  }
}

mixin TimerBlockMappable {
  String toJson() {
    return TimerBlockMapper.ensureInitialized()
        .encodeJson<TimerBlock>(this as TimerBlock);
  }

  Map<String, dynamic> toMap() {
    return TimerBlockMapper.ensureInitialized()
        .encodeMap<TimerBlock>(this as TimerBlock);
  }

  TimerBlockCopyWith<TimerBlock, TimerBlock, TimerBlock> get copyWith =>
      _TimerBlockCopyWithImpl<TimerBlock, TimerBlock>(
          this as TimerBlock, $identity, $identity);
  @override
  String toString() {
    return TimerBlockMapper.ensureInitialized()
        .stringifyValue(this as TimerBlock);
  }

  @override
  bool operator ==(Object other) {
    return TimerBlockMapper.ensureInitialized()
        .equalsValue(this as TimerBlock, other);
  }

  @override
  int get hashCode {
    return TimerBlockMapper.ensureInitialized().hashValue(this as TimerBlock);
  }
}

extension TimerBlockValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TimerBlock, $Out> {
  TimerBlockCopyWith<$R, TimerBlock, $Out> get $asTimerBlock =>
      $base.as((v, t, t2) => _TimerBlockCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TimerBlockCopyWith<$R, $In extends TimerBlock, $Out>
    implements BlockCopyWith<$R, $In, $Out> {
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText;
  @override
  $R call(
      {Duration? minTimer,
      Duration? maxTimer,
      String? text,
      bool? cover,
      bool? foreachPlayer,
      Map<String, String>? perTagText,
      String? image,
      String? ttsMessage});
  TimerBlockCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TimerBlockCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TimerBlock, $Out>
    implements TimerBlockCopyWith<$R, TimerBlock, $Out> {
  _TimerBlockCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TimerBlock> $mapper =
      TimerBlockMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText => MapCopyWith(
          $value.perTagText,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(perTagText: v));
  @override
  $R call(
          {Duration? minTimer,
          Duration? maxTimer,
          String? text,
          bool? cover,
          bool? foreachPlayer,
          Map<String, String>? perTagText,
          Object? image = $none,
          Object? ttsMessage = $none}) =>
      $apply(FieldCopyWithData({
        if (minTimer != null) #minTimer: minTimer,
        if (maxTimer != null) #maxTimer: maxTimer,
        if (text != null) #text: text,
        if (cover != null) #cover: cover,
        if (foreachPlayer != null) #foreachPlayer: foreachPlayer,
        if (perTagText != null) #perTagText: perTagText,
        if (image != $none) #image: image,
        if (ttsMessage != $none) #ttsMessage: ttsMessage
      }));
  @override
  TimerBlock $make(CopyWithData data) => TimerBlock(
      minTimer: data.get(#minTimer, or: $value.minTimer),
      maxTimer: data.get(#maxTimer, or: $value.maxTimer),
      text: data.get(#text, or: $value.text),
      cover: data.get(#cover, or: $value.cover),
      foreachPlayer: data.get(#foreachPlayer, or: $value.foreachPlayer),
      perTagText: data.get(#perTagText, or: $value.perTagText),
      image: data.get(#image, or: $value.image),
      ttsMessage: data.get(#ttsMessage, or: $value.ttsMessage));

  @override
  TimerBlockCopyWith<$R2, TimerBlock, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TimerBlockCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
