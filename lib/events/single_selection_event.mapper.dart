// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'single_selection_event.dart';

class SingleSelectionEventMapper
    extends SubClassMapperBase<SingleSelectionEvent> {
  SingleSelectionEventMapper._();

  static SingleSelectionEventMapper? _instance;
  static SingleSelectionEventMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = SingleSelectionEventMapper._());
      EventInfoMapper.ensureInitialized().addSubMapper(_instance!);
      MapperContainer.globals.useAll([IntMapEventTextMapper()]);
      EventTextMapper.ensureInitialized();
      TagsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SingleSelectionEvent';

  static Map<int, List<EventText>> _$textAlterationsPerPage(
          SingleSelectionEvent v) =>
      v.textAlterationsPerPage;
  static const Field<SingleSelectionEvent, Map<int, List<EventText>>>
      _f$textAlterationsPerPage =
      Field('textAlterationsPerPage', _$textAlterationsPerPage);
  static int _$maximumAmount(SingleSelectionEvent v) => v.maximumAmount;
  static const Field<SingleSelectionEvent, int> _f$maximumAmount =
      Field('maximumAmount', _$maximumAmount, opt: true, def: 1);
  static Tags _$requiredTags(SingleSelectionEvent v) => v.requiredTags;
  static const Field<SingleSelectionEvent, Tags> _f$requiredTags =
      Field('requiredTags', _$requiredTags, opt: true, def: const Tags([]));
  static String _$name(SingleSelectionEvent v) => v.name;
  static const Field<SingleSelectionEvent, String> _f$name =
      Field('name', _$name, opt: true, def: "");
  static List<EventText> _$textAlterations(SingleSelectionEvent v) =>
      v.textAlterations;
  static const Field<SingleSelectionEvent, List<EventText>> _f$textAlterations =
      Field('textAlterations', _$textAlterations, mode: FieldMode.member);

  @override
  final MappableFields<SingleSelectionEvent> fields = const {
    #textAlterationsPerPage: _f$textAlterationsPerPage,
    #maximumAmount: _f$maximumAmount,
    #requiredTags: _f$requiredTags,
    #name: _f$name,
    #textAlterations: _f$textAlterations,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'SingleSelectionEvent';
  @override
  late final ClassMapperBase superMapper = EventInfoMapper.ensureInitialized();

  static SingleSelectionEvent _instantiate(DecodingData data) {
    return SingleSelectionEvent(data.dec(_f$textAlterationsPerPage),
        maximumAmount: data.dec(_f$maximumAmount),
        requiredTags: data.dec(_f$requiredTags),
        name: data.dec(_f$name));
  }

  @override
  final Function instantiate = _instantiate;

  static SingleSelectionEvent fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SingleSelectionEvent>(map);
  }

  static SingleSelectionEvent fromJson(String json) {
    return ensureInitialized().decodeJson<SingleSelectionEvent>(json);
  }
}

mixin SingleSelectionEventMappable {
  String toJson() {
    return SingleSelectionEventMapper.ensureInitialized()
        .encodeJson<SingleSelectionEvent>(this as SingleSelectionEvent);
  }

  Map<String, dynamic> toMap() {
    return SingleSelectionEventMapper.ensureInitialized()
        .encodeMap<SingleSelectionEvent>(this as SingleSelectionEvent);
  }

  SingleSelectionEventCopyWith<SingleSelectionEvent, SingleSelectionEvent,
          SingleSelectionEvent>
      get copyWith => _SingleSelectionEventCopyWithImpl(
          this as SingleSelectionEvent, $identity, $identity);
  @override
  String toString() {
    return SingleSelectionEventMapper.ensureInitialized()
        .stringifyValue(this as SingleSelectionEvent);
  }

  @override
  bool operator ==(Object other) {
    return SingleSelectionEventMapper.ensureInitialized()
        .equalsValue(this as SingleSelectionEvent, other);
  }

  @override
  int get hashCode {
    return SingleSelectionEventMapper.ensureInitialized()
        .hashValue(this as SingleSelectionEvent);
  }
}

extension SingleSelectionEventValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SingleSelectionEvent, $Out> {
  SingleSelectionEventCopyWith<$R, SingleSelectionEvent, $Out>
      get $asSingleSelectionEvent =>
          $base.as((v, t, t2) => _SingleSelectionEventCopyWithImpl(v, t, t2));
}

abstract class SingleSelectionEventCopyWith<
    $R,
    $In extends SingleSelectionEvent,
    $Out> implements EventInfoCopyWith<$R, $In, $Out> {
  MapCopyWith<$R, int, List<EventText>,
          ObjectCopyWith<$R, List<EventText>, List<EventText>>>
      get textAlterationsPerPage;
  @override
  TagsCopyWith<$R, Tags, Tags> get requiredTags;
  @override
  $R call(
      {Map<int, List<EventText>>? textAlterationsPerPage,
      int? maximumAmount,
      Tags? requiredTags,
      String? name});
  SingleSelectionEventCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SingleSelectionEventCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SingleSelectionEvent, $Out>
    implements SingleSelectionEventCopyWith<$R, SingleSelectionEvent, $Out> {
  _SingleSelectionEventCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SingleSelectionEvent> $mapper =
      SingleSelectionEventMapper.ensureInitialized();
  @override
  MapCopyWith<$R, int, List<EventText>,
          ObjectCopyWith<$R, List<EventText>, List<EventText>>>
      get textAlterationsPerPage => MapCopyWith(
          $value.textAlterationsPerPage,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(textAlterationsPerPage: v));
  @override
  TagsCopyWith<$R, Tags, Tags> get requiredTags =>
      $value.requiredTags.copyWith.$chain((v) => call(requiredTags: v));
  @override
  $R call(
          {Map<int, List<EventText>>? textAlterationsPerPage,
          int? maximumAmount,
          Tags? requiredTags,
          String? name}) =>
      $apply(FieldCopyWithData({
        if (textAlterationsPerPage != null)
          #textAlterationsPerPage: textAlterationsPerPage,
        if (maximumAmount != null) #maximumAmount: maximumAmount,
        if (requiredTags != null) #requiredTags: requiredTags,
        if (name != null) #name: name
      }));
  @override
  SingleSelectionEvent $make(CopyWithData data) => SingleSelectionEvent(
      data.get(#textAlterationsPerPage, or: $value.textAlterationsPerPage),
      maximumAmount: data.get(#maximumAmount, or: $value.maximumAmount),
      requiredTags: data.get(#requiredTags, or: $value.requiredTags),
      name: data.get(#name, or: $value.name));

  @override
  SingleSelectionEventCopyWith<$R2, SingleSelectionEvent, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SingleSelectionEventCopyWithImpl($value, $cast, t);
}
