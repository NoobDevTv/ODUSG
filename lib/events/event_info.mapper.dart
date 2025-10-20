// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'event_info.dart';

class EventInfoMapper extends ClassMapperBase<EventInfo> {
  EventInfoMapper._();

  static EventInfoMapper? _instance;
  static EventInfoMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = EventInfoMapper._());
      TagEventMapper.ensureInitialized();
      SingleSelectionEventMapper.ensureInitialized();
      EventTextMapper.ensureInitialized();
      TagsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'EventInfo';

  static List<EventText> _$textAlterations(EventInfo v) => v.textAlterations;
  static const Field<EventInfo, List<EventText>> _f$textAlterations =
      Field('textAlterations', _$textAlterations);
  static String _$name(EventInfo v) => v.name;
  static const Field<EventInfo, String> _f$name =
      Field('name', _$name, opt: true, def: "");
  static int _$maximumAmount(EventInfo v) => v.maximumAmount;
  static const Field<EventInfo, int> _f$maximumAmount =
      Field('maximumAmount', _$maximumAmount, opt: true, def: 1);
  static Tags _$requiredTags(EventInfo v) => v.requiredTags;
  static const Field<EventInfo, Tags> _f$requiredTags =
      Field('requiredTags', _$requiredTags, opt: true, def: const Tags([]));

  @override
  final MappableFields<EventInfo> fields = const {
    #textAlterations: _f$textAlterations,
    #name: _f$name,
    #maximumAmount: _f$maximumAmount,
    #requiredTags: _f$requiredTags,
  };

  static EventInfo _instantiate(DecodingData data) {
    return EventInfo(data.dec(_f$textAlterations),
        name: data.dec(_f$name),
        maximumAmount: data.dec(_f$maximumAmount),
        requiredTags: data.dec(_f$requiredTags));
  }

  @override
  final Function instantiate = _instantiate;

  static EventInfo fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<EventInfo>(map);
  }

  static EventInfo fromJson(String json) {
    return ensureInitialized().decodeJson<EventInfo>(json);
  }
}

mixin EventInfoMappable {
  String toJson() {
    return EventInfoMapper.ensureInitialized()
        .encodeJson<EventInfo>(this as EventInfo);
  }

  Map<String, dynamic> toMap() {
    return EventInfoMapper.ensureInitialized()
        .encodeMap<EventInfo>(this as EventInfo);
  }

  EventInfoCopyWith<EventInfo, EventInfo, EventInfo> get copyWith =>
      _EventInfoCopyWithImpl<EventInfo, EventInfo>(
          this as EventInfo, $identity, $identity);
  @override
  String toString() {
    return EventInfoMapper.ensureInitialized()
        .stringifyValue(this as EventInfo);
  }

  @override
  bool operator ==(Object other) {
    return EventInfoMapper.ensureInitialized()
        .equalsValue(this as EventInfo, other);
  }

  @override
  int get hashCode {
    return EventInfoMapper.ensureInitialized().hashValue(this as EventInfo);
  }
}

extension EventInfoValueCopy<$R, $Out> on ObjectCopyWith<$R, EventInfo, $Out> {
  EventInfoCopyWith<$R, EventInfo, $Out> get $asEventInfo =>
      $base.as((v, t, t2) => _EventInfoCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class EventInfoCopyWith<$R, $In extends EventInfo, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  TagsCopyWith<$R, Tags, Tags> get requiredTags;
  $R call({String? name, int? maximumAmount, Tags? requiredTags});
  EventInfoCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _EventInfoCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, EventInfo, $Out>
    implements EventInfoCopyWith<$R, EventInfo, $Out> {
  _EventInfoCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<EventInfo> $mapper =
      EventInfoMapper.ensureInitialized();
  @override
  TagsCopyWith<$R, Tags, Tags> get requiredTags =>
      $value.requiredTags.copyWith.$chain((v) => call(requiredTags: v));
  @override
  $R call({String? name, int? maximumAmount, Tags? requiredTags}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (maximumAmount != null) #maximumAmount: maximumAmount,
        if (requiredTags != null) #requiredTags: requiredTags
      }));
  @override
  EventInfo $make(CopyWithData data) =>
      EventInfo(data.get(#textAlterations, or: $value.textAlterations),
          name: data.get(#name, or: $value.name),
          maximumAmount: data.get(#maximumAmount, or: $value.maximumAmount),
          requiredTags: data.get(#requiredTags, or: $value.requiredTags));

  @override
  EventInfoCopyWith<$R2, EventInfo, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _EventInfoCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
