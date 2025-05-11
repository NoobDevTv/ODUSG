// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'event_info_block.dart';

class EventInfoBlockMapper extends SubClassMapperBase<EventInfoBlock> {
  EventInfoBlockMapper._();

  static EventInfoBlockMapper? _instance;
  static EventInfoBlockMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EventInfoBlockMapper._());
      BlockMapper.ensureInitialized().addSubMapper(_instance!);
      EventInfoMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'EventInfoBlock';

  static String _$text(EventInfoBlock v) => v.text;
  static const Field<EventInfoBlock, String> _f$text = Field('text', _$text);
  static List<EventInfo> _$eventInfos(EventInfoBlock v) => v.eventInfos;
  static const Field<EventInfoBlock, List<EventInfo>> _f$eventInfos =
      Field('eventInfos', _$eventInfos);
  static bool _$inOrder(EventInfoBlock v) => v.inOrder;
  static const Field<EventInfoBlock, bool> _f$inOrder =
      Field('inOrder', _$inOrder);
  static bool _$cover(EventInfoBlock v) => v.cover;
  static const Field<EventInfoBlock, bool> _f$cover =
      Field('cover', _$cover, opt: true, def: false);
  static bool _$foreachPlayer(EventInfoBlock v) => v.foreachPlayer;
  static const Field<EventInfoBlock, bool> _f$foreachPlayer =
      Field('foreachPlayer', _$foreachPlayer, opt: true, def: false);
  static Map<String, String> _$perTagText(EventInfoBlock v) => v.perTagText;
  static const Field<EventInfoBlock, Map<String, String>> _f$perTagText =
      Field('perTagText', _$perTagText, opt: true, def: const {});

  @override
  final MappableFields<EventInfoBlock> fields = const {
    #text: _f$text,
    #eventInfos: _f$eventInfos,
    #inOrder: _f$inOrder,
    #cover: _f$cover,
    #foreachPlayer: _f$foreachPlayer,
    #perTagText: _f$perTagText,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'EventInfoBlock';
  @override
  late final ClassMapperBase superMapper = BlockMapper.ensureInitialized();

  static EventInfoBlock _instantiate(DecodingData data) {
    return EventInfoBlock(
        text: data.dec(_f$text),
        eventInfos: data.dec(_f$eventInfos),
        inOrder: data.dec(_f$inOrder),
        cover: data.dec(_f$cover),
        foreachPlayer: data.dec(_f$foreachPlayer),
        perTagText: data.dec(_f$perTagText));
  }

  @override
  final Function instantiate = _instantiate;

  static EventInfoBlock fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EventInfoBlock>(map);
  }

  static EventInfoBlock fromJson(String json) {
    return ensureInitialized().decodeJson<EventInfoBlock>(json);
  }
}

mixin EventInfoBlockMappable {
  String toJson() {
    return EventInfoBlockMapper.ensureInitialized()
        .encodeJson<EventInfoBlock>(this as EventInfoBlock);
  }

  Map<String, dynamic> toMap() {
    return EventInfoBlockMapper.ensureInitialized()
        .encodeMap<EventInfoBlock>(this as EventInfoBlock);
  }

  EventInfoBlockCopyWith<EventInfoBlock, EventInfoBlock, EventInfoBlock>
      get copyWith => _EventInfoBlockCopyWithImpl(
          this as EventInfoBlock, $identity, $identity);
  @override
  String toString() {
    return EventInfoBlockMapper.ensureInitialized()
        .stringifyValue(this as EventInfoBlock);
  }

  @override
  bool operator ==(Object other) {
    return EventInfoBlockMapper.ensureInitialized()
        .equalsValue(this as EventInfoBlock, other);
  }

  @override
  int get hashCode {
    return EventInfoBlockMapper.ensureInitialized()
        .hashValue(this as EventInfoBlock);
  }
}

extension EventInfoBlockValueCopy<$R, $Out>
    on ObjectCopyWith<$R, EventInfoBlock, $Out> {
  EventInfoBlockCopyWith<$R, EventInfoBlock, $Out> get $asEventInfoBlock =>
      $base.as((v, t, t2) => _EventInfoBlockCopyWithImpl(v, t, t2));
}

abstract class EventInfoBlockCopyWith<$R, $In extends EventInfoBlock, $Out>
    implements BlockCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, EventInfo, EventInfoCopyWith<$R, EventInfo, EventInfo>>
      get eventInfos;
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText;
  @override
  $R call(
      {String? text,
      List<EventInfo>? eventInfos,
      bool? inOrder,
      bool? cover,
      bool? foreachPlayer,
      Map<String, String>? perTagText});
  EventInfoBlockCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _EventInfoBlockCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, EventInfoBlock, $Out>
    implements EventInfoBlockCopyWith<$R, EventInfoBlock, $Out> {
  _EventInfoBlockCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<EventInfoBlock> $mapper =
      EventInfoBlockMapper.ensureInitialized();
  @override
  ListCopyWith<$R, EventInfo, EventInfoCopyWith<$R, EventInfo, EventInfo>>
      get eventInfos => ListCopyWith($value.eventInfos,
          (v, t) => v.copyWith.$chain(t), (v) => call(eventInfos: v));
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText => MapCopyWith(
          $value.perTagText,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(perTagText: v));
  @override
  $R call(
          {String? text,
          List<EventInfo>? eventInfos,
          bool? inOrder,
          bool? cover,
          bool? foreachPlayer,
          Map<String, String>? perTagText}) =>
      $apply(FieldCopyWithData({
        if (text != null) #text: text,
        if (eventInfos != null) #eventInfos: eventInfos,
        if (inOrder != null) #inOrder: inOrder,
        if (cover != null) #cover: cover,
        if (foreachPlayer != null) #foreachPlayer: foreachPlayer,
        if (perTagText != null) #perTagText: perTagText
      }));
  @override
  EventInfoBlock $make(CopyWithData data) => EventInfoBlock(
      text: data.get(#text, or: $value.text),
      eventInfos: data.get(#eventInfos, or: $value.eventInfos),
      inOrder: data.get(#inOrder, or: $value.inOrder),
      cover: data.get(#cover, or: $value.cover),
      foreachPlayer: data.get(#foreachPlayer, or: $value.foreachPlayer),
      perTagText: data.get(#perTagText, or: $value.perTagText));

  @override
  EventInfoBlockCopyWith<$R2, EventInfoBlock, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _EventInfoBlockCopyWithImpl($value, $cast, t);
}
