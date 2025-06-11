// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'group_block.dart';

class GroupBlockMapper extends SubClassMapperBase<GroupBlock> {
  GroupBlockMapper._();

  static GroupBlockMapper? _instance;
  static GroupBlockMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = GroupBlockMapper._());
      BlockMapper.ensureInitialized().addSubMapper(_instance!);
      StepMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'GroupBlock';

  static String _$text(GroupBlock v) => v.text;
  static const Field<GroupBlock, String> _f$text = Field('text', _$text);
  static List<Step> _$steps(GroupBlock v) => v.steps;
  static const Field<GroupBlock, List<Step>> _f$steps = Field('steps', _$steps);
  static bool _$cover(GroupBlock v) => v.cover;
  static const Field<GroupBlock, bool> _f$cover =
      Field('cover', _$cover, opt: true, def: false);
  static bool _$foreachPlayer(GroupBlock v) => v.foreachPlayer;
  static const Field<GroupBlock, bool> _f$foreachPlayer =
      Field('foreachPlayer', _$foreachPlayer, opt: true, def: false);
  static Map<String, String> _$perTagText(GroupBlock v) => v.perTagText;
  static const Field<GroupBlock, Map<String, String>> _f$perTagText =
      Field('perTagText', _$perTagText, opt: true, def: const {});

  @override
  final MappableFields<GroupBlock> fields = const {
    #text: _f$text,
    #steps: _f$steps,
    #cover: _f$cover,
    #foreachPlayer: _f$foreachPlayer,
    #perTagText: _f$perTagText,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'GroupBlock';
  @override
  late final ClassMapperBase superMapper = BlockMapper.ensureInitialized();

  static GroupBlock _instantiate(DecodingData data) {
    return GroupBlock(
        text: data.dec(_f$text),
        steps: data.dec(_f$steps),
        cover: data.dec(_f$cover),
        foreachPlayer: data.dec(_f$foreachPlayer),
        perTagText: data.dec(_f$perTagText));
  }

  @override
  final Function instantiate = _instantiate;

  static GroupBlock fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<GroupBlock>(map);
  }

  static GroupBlock fromJson(String json) {
    return ensureInitialized().decodeJson<GroupBlock>(json);
  }
}

mixin GroupBlockMappable {
  String toJson() {
    return GroupBlockMapper.ensureInitialized()
        .encodeJson<GroupBlock>(this as GroupBlock);
  }

  Map<String, dynamic> toMap() {
    return GroupBlockMapper.ensureInitialized()
        .encodeMap<GroupBlock>(this as GroupBlock);
  }

  GroupBlockCopyWith<GroupBlock, GroupBlock, GroupBlock> get copyWith =>
      _GroupBlockCopyWithImpl(this as GroupBlock, $identity, $identity);
  @override
  String toString() {
    return GroupBlockMapper.ensureInitialized()
        .stringifyValue(this as GroupBlock);
  }

  @override
  bool operator ==(Object other) {
    return GroupBlockMapper.ensureInitialized()
        .equalsValue(this as GroupBlock, other);
  }

  @override
  int get hashCode {
    return GroupBlockMapper.ensureInitialized().hashValue(this as GroupBlock);
  }
}

extension GroupBlockValueCopy<$R, $Out>
    on ObjectCopyWith<$R, GroupBlock, $Out> {
  GroupBlockCopyWith<$R, GroupBlock, $Out> get $asGroupBlock =>
      $base.as((v, t, t2) => _GroupBlockCopyWithImpl(v, t, t2));
}

abstract class GroupBlockCopyWith<$R, $In extends GroupBlock, $Out>
    implements BlockCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Step, StepCopyWith<$R, Step, Step>> get steps;
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText;
  @override
  $R call(
      {String? text,
      List<Step>? steps,
      bool? cover,
      bool? foreachPlayer,
      Map<String, String>? perTagText});
  GroupBlockCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _GroupBlockCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, GroupBlock, $Out>
    implements GroupBlockCopyWith<$R, GroupBlock, $Out> {
  _GroupBlockCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<GroupBlock> $mapper =
      GroupBlockMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Step, StepCopyWith<$R, Step, Step>> get steps =>
      ListCopyWith(
          $value.steps, (v, t) => v.copyWith.$chain(t), (v) => call(steps: v));
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText => MapCopyWith(
          $value.perTagText,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(perTagText: v));
  @override
  $R call(
          {String? text,
          List<Step>? steps,
          bool? cover,
          bool? foreachPlayer,
          Map<String, String>? perTagText}) =>
      $apply(FieldCopyWithData({
        if (text != null) #text: text,
        if (steps != null) #steps: steps,
        if (cover != null) #cover: cover,
        if (foreachPlayer != null) #foreachPlayer: foreachPlayer,
        if (perTagText != null) #perTagText: perTagText
      }));
  @override
  GroupBlock $make(CopyWithData data) => GroupBlock(
      text: data.get(#text, or: $value.text),
      steps: data.get(#steps, or: $value.steps),
      cover: data.get(#cover, or: $value.cover),
      foreachPlayer: data.get(#foreachPlayer, or: $value.foreachPlayer),
      perTagText: data.get(#perTagText, or: $value.perTagText));

  @override
  GroupBlockCopyWith<$R2, GroupBlock, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _GroupBlockCopyWithImpl($value, $cast, t);
}
