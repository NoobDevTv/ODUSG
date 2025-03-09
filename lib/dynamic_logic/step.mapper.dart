// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'step.dart';

class StepMapper extends ClassMapperBase<Step> {
  StepMapper._();

  static StepMapper? _instance;
  static StepMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = StepMapper._());
      TagConditionMapper.ensureInitialized();
      BlockMapper.ensureInitialized();
      TagFilterMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Step';

  static String _$name(Step v) => v.name;
  static const Field<Step, String> _f$name = Field('name', _$name);
  static TagCondition _$entryGuard(Step v) => v.entryGuard;
  static const Field<Step, TagCondition> _f$entryGuard =
      Field('entryGuard', _$entryGuard);
  static Block _$block(Step v) => v.block;
  static const Field<Step, Block> _f$block = Field('block', _$block);
  static TagFilter _$filter(Step v) => v.filter;
  static const Field<Step, TagFilter> _f$filter =
      Field('filter', _$filter, opt: true, def: TagFilter.empty);

  @override
  final MappableFields<Step> fields = const {
    #name: _f$name,
    #entryGuard: _f$entryGuard,
    #block: _f$block,
    #filter: _f$filter,
  };

  static Step _instantiate(DecodingData data) {
    return Step(data.dec(_f$name), data.dec(_f$entryGuard), data.dec(_f$block),
        filter: data.dec(_f$filter));
  }

  @override
  final Function instantiate = _instantiate;

  static Step fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Step>(map);
  }

  static Step fromJson(String json) {
    return ensureInitialized().decodeJson<Step>(json);
  }
}

mixin StepMappable {
  String toJson() {
    return StepMapper.ensureInitialized().encodeJson<Step>(this as Step);
  }

  Map<String, dynamic> toMap() {
    return StepMapper.ensureInitialized().encodeMap<Step>(this as Step);
  }

  StepCopyWith<Step, Step, Step> get copyWith =>
      _StepCopyWithImpl(this as Step, $identity, $identity);
  @override
  String toString() {
    return StepMapper.ensureInitialized().stringifyValue(this as Step);
  }

  @override
  bool operator ==(Object other) {
    return StepMapper.ensureInitialized().equalsValue(this as Step, other);
  }

  @override
  int get hashCode {
    return StepMapper.ensureInitialized().hashValue(this as Step);
  }
}

extension StepValueCopy<$R, $Out> on ObjectCopyWith<$R, Step, $Out> {
  StepCopyWith<$R, Step, $Out> get $asStep =>
      $base.as((v, t, t2) => _StepCopyWithImpl(v, t, t2));
}

abstract class StepCopyWith<$R, $In extends Step, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  TagConditionCopyWith<$R, TagCondition, TagCondition> get entryGuard;
  TagFilterCopyWith<$R, TagFilter, TagFilter> get filter;
  $R call(
      {String? name,
      TagCondition? entryGuard,
      Block? block,
      TagFilter? filter});
  StepCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _StepCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Step, $Out>
    implements StepCopyWith<$R, Step, $Out> {
  _StepCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Step> $mapper = StepMapper.ensureInitialized();
  @override
  TagConditionCopyWith<$R, TagCondition, TagCondition> get entryGuard =>
      $value.entryGuard.copyWith.$chain((v) => call(entryGuard: v));
  @override
  TagFilterCopyWith<$R, TagFilter, TagFilter> get filter =>
      $value.filter.copyWith.$chain((v) => call(filter: v));
  @override
  $R call(
          {String? name,
          TagCondition? entryGuard,
          Block? block,
          TagFilter? filter}) =>
      $apply(FieldCopyWithData({
        if (name != null) #name: name,
        if (entryGuard != null) #entryGuard: entryGuard,
        if (block != null) #block: block,
        if (filter != null) #filter: filter
      }));
  @override
  Step $make(CopyWithData data) => Step(
      data.get(#name, or: $value.name),
      data.get(#entryGuard, or: $value.entryGuard),
      data.get(#block, or: $value.block),
      filter: data.get(#filter, or: $value.filter));

  @override
  StepCopyWith<$R2, Step, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _StepCopyWithImpl($value, $cast, t);
}
