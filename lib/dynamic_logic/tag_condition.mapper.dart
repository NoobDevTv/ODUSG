// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tag_condition.dart';

class TagFilterMapper extends ClassMapperBase<TagFilter> {
  TagFilterMapper._();

  static TagFilterMapper? _instance;
  static TagFilterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TagFilterMapper._());
      TagModifierMapper.ensureInitialized();
      ConditionOperatorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TagFilter';

  static List<TagModifier> _$modifiers(TagFilter v) => v.modifiers;
  static const Field<TagFilter, List<TagModifier>> _f$modifiers =
      Field('modifiers', _$modifiers);
  static List<ConditionOperator> _$conditionOperators(TagFilter v) =>
      v.conditionOperators;
  static const Field<TagFilter, List<ConditionOperator>> _f$conditionOperators =
      Field('conditionOperators', _$conditionOperators);
  static List<String> _$operands(TagFilter v) => v.operands;
  static const Field<TagFilter, List<String>> _f$operands =
      Field('operands', _$operands);

  @override
  final MappableFields<TagFilter> fields = const {
    #modifiers: _f$modifiers,
    #conditionOperators: _f$conditionOperators,
    #operands: _f$operands,
  };

  static TagFilter _instantiate(DecodingData data) {
    return TagFilter(
        modifiers: data.dec(_f$modifiers),
        conditionOperators: data.dec(_f$conditionOperators),
        operands: data.dec(_f$operands));
  }

  @override
  final Function instantiate = _instantiate;

  static TagFilter fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TagFilter>(map);
  }

  static TagFilter fromJson(String json) {
    return ensureInitialized().decodeJson<TagFilter>(json);
  }
}

mixin TagFilterMappable {
  String toJson() {
    return TagFilterMapper.ensureInitialized()
        .encodeJson<TagFilter>(this as TagFilter);
  }

  Map<String, dynamic> toMap() {
    return TagFilterMapper.ensureInitialized()
        .encodeMap<TagFilter>(this as TagFilter);
  }

  TagFilterCopyWith<TagFilter, TagFilter, TagFilter> get copyWith =>
      _TagFilterCopyWithImpl(this as TagFilter, $identity, $identity);
  @override
  String toString() {
    return TagFilterMapper.ensureInitialized()
        .stringifyValue(this as TagFilter);
  }

  @override
  bool operator ==(Object other) {
    return TagFilterMapper.ensureInitialized()
        .equalsValue(this as TagFilter, other);
  }

  @override
  int get hashCode {
    return TagFilterMapper.ensureInitialized().hashValue(this as TagFilter);
  }
}

extension TagFilterValueCopy<$R, $Out> on ObjectCopyWith<$R, TagFilter, $Out> {
  TagFilterCopyWith<$R, TagFilter, $Out> get $asTagFilter =>
      $base.as((v, t, t2) => _TagFilterCopyWithImpl(v, t, t2));
}

abstract class TagFilterCopyWith<$R, $In extends TagFilter, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, TagModifier, ObjectCopyWith<$R, TagModifier, TagModifier>>
      get modifiers;
  ListCopyWith<$R, ConditionOperator,
          ObjectCopyWith<$R, ConditionOperator, ConditionOperator>>
      get conditionOperators;
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get operands;
  $R call(
      {List<TagModifier>? modifiers,
      List<ConditionOperator>? conditionOperators,
      List<String>? operands});
  TagFilterCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TagFilterCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TagFilter, $Out>
    implements TagFilterCopyWith<$R, TagFilter, $Out> {
  _TagFilterCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TagFilter> $mapper =
      TagFilterMapper.ensureInitialized();
  @override
  ListCopyWith<$R, TagModifier, ObjectCopyWith<$R, TagModifier, TagModifier>>
      get modifiers => ListCopyWith($value.modifiers,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(modifiers: v));
  @override
  ListCopyWith<$R, ConditionOperator,
          ObjectCopyWith<$R, ConditionOperator, ConditionOperator>>
      get conditionOperators => ListCopyWith(
          $value.conditionOperators,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(conditionOperators: v));
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get operands =>
      ListCopyWith($value.operands, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(operands: v));
  @override
  $R call(
          {List<TagModifier>? modifiers,
          List<ConditionOperator>? conditionOperators,
          List<String>? operands}) =>
      $apply(FieldCopyWithData({
        if (modifiers != null) #modifiers: modifiers,
        if (conditionOperators != null) #conditionOperators: conditionOperators,
        if (operands != null) #operands: operands
      }));
  @override
  TagFilter $make(CopyWithData data) => TagFilter(
      modifiers: data.get(#modifiers, or: $value.modifiers),
      conditionOperators:
          data.get(#conditionOperators, or: $value.conditionOperators),
      operands: data.get(#operands, or: $value.operands));

  @override
  TagFilterCopyWith<$R2, TagFilter, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TagFilterCopyWithImpl($value, $cast, t);
}

class TagConditionMapper extends ClassMapperBase<TagCondition> {
  TagConditionMapper._();

  static TagConditionMapper? _instance;
  static TagConditionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TagConditionMapper._());
      TagOperatorMapper.ensureInitialized();
      ConditionOperatorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TagCondition';

  static List<TagOperator> _$tagOperators(TagCondition v) => v.tagOperators;
  static const Field<TagCondition, List<TagOperator>> _f$tagOperators =
      Field('tagOperators', _$tagOperators);
  static List<ConditionOperator> _$conditionOperators(TagCondition v) =>
      v.conditionOperators;
  static const Field<TagCondition, List<ConditionOperator>>
      _f$conditionOperators = Field('conditionOperators', _$conditionOperators);
  static List<dynamic> _$operands(TagCondition v) => v.operands;
  static const Field<TagCondition, List<dynamic>> _f$operands =
      Field('operands', _$operands);

  @override
  final MappableFields<TagCondition> fields = const {
    #tagOperators: _f$tagOperators,
    #conditionOperators: _f$conditionOperators,
    #operands: _f$operands,
  };

  static TagCondition _instantiate(DecodingData data) {
    return TagCondition(
        tagOperators: data.dec(_f$tagOperators),
        conditionOperators: data.dec(_f$conditionOperators),
        operands: data.dec(_f$operands));
  }

  @override
  final Function instantiate = _instantiate;

  static TagCondition fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TagCondition>(map);
  }

  static TagCondition fromJson(String json) {
    return ensureInitialized().decodeJson<TagCondition>(json);
  }
}

mixin TagConditionMappable {
  String toJson() {
    return TagConditionMapper.ensureInitialized()
        .encodeJson<TagCondition>(this as TagCondition);
  }

  Map<String, dynamic> toMap() {
    return TagConditionMapper.ensureInitialized()
        .encodeMap<TagCondition>(this as TagCondition);
  }

  TagConditionCopyWith<TagCondition, TagCondition, TagCondition> get copyWith =>
      _TagConditionCopyWithImpl(this as TagCondition, $identity, $identity);
  @override
  String toString() {
    return TagConditionMapper.ensureInitialized()
        .stringifyValue(this as TagCondition);
  }

  @override
  bool operator ==(Object other) {
    return TagConditionMapper.ensureInitialized()
        .equalsValue(this as TagCondition, other);
  }

  @override
  int get hashCode {
    return TagConditionMapper.ensureInitialized()
        .hashValue(this as TagCondition);
  }
}

extension TagConditionValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TagCondition, $Out> {
  TagConditionCopyWith<$R, TagCondition, $Out> get $asTagCondition =>
      $base.as((v, t, t2) => _TagConditionCopyWithImpl(v, t, t2));
}

abstract class TagConditionCopyWith<$R, $In extends TagCondition, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, TagOperator, ObjectCopyWith<$R, TagOperator, TagOperator>>
      get tagOperators;
  ListCopyWith<$R, ConditionOperator,
          ObjectCopyWith<$R, ConditionOperator, ConditionOperator>>
      get conditionOperators;
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>> get operands;
  $R call(
      {List<TagOperator>? tagOperators,
      List<ConditionOperator>? conditionOperators,
      List<dynamic>? operands});
  TagConditionCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TagConditionCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TagCondition, $Out>
    implements TagConditionCopyWith<$R, TagCondition, $Out> {
  _TagConditionCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TagCondition> $mapper =
      TagConditionMapper.ensureInitialized();
  @override
  ListCopyWith<$R, TagOperator, ObjectCopyWith<$R, TagOperator, TagOperator>>
      get tagOperators => ListCopyWith(
          $value.tagOperators,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(tagOperators: v));
  @override
  ListCopyWith<$R, ConditionOperator,
          ObjectCopyWith<$R, ConditionOperator, ConditionOperator>>
      get conditionOperators => ListCopyWith(
          $value.conditionOperators,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(conditionOperators: v));
  @override
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>>
      get operands => ListCopyWith($value.operands,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(operands: v));
  @override
  $R call(
          {List<TagOperator>? tagOperators,
          List<ConditionOperator>? conditionOperators,
          List<dynamic>? operands}) =>
      $apply(FieldCopyWithData({
        if (tagOperators != null) #tagOperators: tagOperators,
        if (conditionOperators != null) #conditionOperators: conditionOperators,
        if (operands != null) #operands: operands
      }));
  @override
  TagCondition $make(CopyWithData data) => TagCondition(
      tagOperators: data.get(#tagOperators, or: $value.tagOperators),
      conditionOperators:
          data.get(#conditionOperators, or: $value.conditionOperators),
      operands: data.get(#operands, or: $value.operands));

  @override
  TagConditionCopyWith<$R2, TagCondition, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TagConditionCopyWithImpl($value, $cast, t);
}
