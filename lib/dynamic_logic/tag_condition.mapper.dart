// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'tag_condition.dart';

class TagEntryBaseMapper extends ClassMapperBase<TagEntryBase> {
  TagEntryBaseMapper._();

  static TagEntryBaseMapper? _instance;
  static TagEntryBaseMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TagEntryBaseMapper._());
      TagFilterMapper.ensureInitialized();
      TagConditionMapper.ensureInitialized();
      TagModifierMapper.ensureInitialized();
      TagOperatorMapper.ensureInitialized();
      ConditionOperatorMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TagEntryBase';
  @override
  Function get typeFactory => <TOperand>(f) => f<TagEntryBase<TOperand>>();

  static List<TagModifier> _$modifiers(TagEntryBase v) => v.modifiers;
  static const Field<TagEntryBase, List<TagModifier>> _f$modifiers =
      Field('modifiers', _$modifiers);
  static List<TagOperator> _$operators(TagEntryBase v) => v.operators;
  static const Field<TagEntryBase, List<TagOperator>> _f$operators =
      Field('operators', _$operators);
  static List<ConditionOperator> _$conditionOperators(TagEntryBase v) =>
      v.conditionOperators;
  static const Field<TagEntryBase, List<ConditionOperator>>
      _f$conditionOperators = Field('conditionOperators', _$conditionOperators);
  static List<dynamic> _$operands(TagEntryBase v) => v.operands;
  static dynamic _arg$operands<TOperand>(f) => f<List<TOperand>>();
  static const Field<TagEntryBase, List<dynamic>> _f$operands =
      Field('operands', _$operands, arg: _arg$operands);

  @override
  final MappableFields<TagEntryBase> fields = const {
    #modifiers: _f$modifiers,
    #operators: _f$operators,
    #conditionOperators: _f$conditionOperators,
    #operands: _f$operands,
  };

  static TagEntryBase<TOperand> _instantiate<TOperand>(DecodingData data) {
    throw MapperException.missingSubclass(
        'TagEntryBase', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static TagEntryBase<TOperand> fromMap<TOperand>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TagEntryBase<TOperand>>(map);
  }

  static TagEntryBase<TOperand> fromJson<TOperand>(String json) {
    return ensureInitialized().decodeJson<TagEntryBase<TOperand>>(json);
  }
}

mixin TagEntryBaseMappable<TOperand> {
  String toJson();
  Map<String, dynamic> toMap();
  TagEntryBaseCopyWith<TagEntryBase<TOperand>, TagEntryBase<TOperand>,
      TagEntryBase<TOperand>, TOperand> get copyWith;
}

abstract class TagEntryBaseCopyWith<$R, $In extends TagEntryBase<TOperand>,
    $Out, TOperand> implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, TagModifier, ObjectCopyWith<$R, TagModifier, TagModifier>?>
      get modifiers;
  ListCopyWith<$R, TagOperator, ObjectCopyWith<$R, TagOperator, TagOperator>?>
      get operators;
  ListCopyWith<$R, ConditionOperator,
          ObjectCopyWith<$R, ConditionOperator, ConditionOperator>?>
      get conditionOperators;
  ListCopyWith<$R, TOperand, ObjectCopyWith<$R, TOperand, TOperand>?>
      get operands;
  $R call(
      {List<TagModifier>? modifiers,
      List<TagOperator>? operators,
      List<ConditionOperator>? conditionOperators,
      List<TOperand>? operands});
  TagEntryBaseCopyWith<$R2, $In, $Out2, TOperand> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class TagFilterMapper extends SubClassMapperBase<TagFilter> {
  TagFilterMapper._();

  static TagFilterMapper? _instance;
  static TagFilterMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TagFilterMapper._());
      TagEntryBaseMapper.ensureInitialized().addSubMapper(_instance!);
      TagModifierMapper.ensureInitialized();
      ConditionOperatorMapper.ensureInitialized();
      TagOperatorMapper.ensureInitialized();
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
  static List<TagOperator> _$operators(TagFilter v) => v.operators;
  static const Field<TagFilter, List<TagOperator>> _f$operators =
      Field('operators', _$operators, opt: true, def: const []);

  @override
  final MappableFields<TagFilter> fields = const {
    #modifiers: _f$modifiers,
    #conditionOperators: _f$conditionOperators,
    #operands: _f$operands,
    #operators: _f$operators,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'TagFilter';
  @override
  late final ClassMapperBase superMapper =
      TagEntryBaseMapper.ensureInitialized();

  @override
  DecodingContext inherit(DecodingContext context) {
    return context.inherit(args: () => []);
  }

  static TagFilter _instantiate(DecodingData data) {
    return TagFilter(
        modifiers: data.dec(_f$modifiers),
        conditionOperators: data.dec(_f$conditionOperators),
        operands: data.dec(_f$operands),
        operators: data.dec(_f$operators));
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
      _TagFilterCopyWithImpl<TagFilter, TagFilter>(
          this as TagFilter, $identity, $identity);
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
      $base.as((v, t, t2) => _TagFilterCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TagFilterCopyWith<$R, $In extends TagFilter, $Out>
    implements TagEntryBaseCopyWith<$R, $In, $Out, String> {
  @override
  ListCopyWith<$R, TagModifier, ObjectCopyWith<$R, TagModifier, TagModifier>>
      get modifiers;
  @override
  ListCopyWith<$R, ConditionOperator,
          ObjectCopyWith<$R, ConditionOperator, ConditionOperator>>
      get conditionOperators;
  @override
  ListCopyWith<$R, String, ObjectCopyWith<$R, String, String>> get operands;
  @override
  ListCopyWith<$R, TagOperator, ObjectCopyWith<$R, TagOperator, TagOperator>>
      get operators;
  @override
  $R call(
      {List<TagModifier>? modifiers,
      List<ConditionOperator>? conditionOperators,
      List<String>? operands,
      List<TagOperator>? operators});
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
  ListCopyWith<$R, TagOperator, ObjectCopyWith<$R, TagOperator, TagOperator>>
      get operators => ListCopyWith($value.operators,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(operators: v));
  @override
  $R call(
          {List<TagModifier>? modifiers,
          List<ConditionOperator>? conditionOperators,
          List<String>? operands,
          List<TagOperator>? operators}) =>
      $apply(FieldCopyWithData({
        if (modifiers != null) #modifiers: modifiers,
        if (conditionOperators != null) #conditionOperators: conditionOperators,
        if (operands != null) #operands: operands,
        if (operators != null) #operators: operators
      }));
  @override
  TagFilter $make(CopyWithData data) => TagFilter(
      modifiers: data.get(#modifiers, or: $value.modifiers),
      conditionOperators:
          data.get(#conditionOperators, or: $value.conditionOperators),
      operands: data.get(#operands, or: $value.operands),
      operators: data.get(#operators, or: $value.operators));

  @override
  TagFilterCopyWith<$R2, TagFilter, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TagFilterCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class TagConditionMapper extends SubClassMapperBase<TagCondition> {
  TagConditionMapper._();

  static TagConditionMapper? _instance;
  static TagConditionMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TagConditionMapper._());
      TagEntryBaseMapper.ensureInitialized().addSubMapper(_instance!);
      TagOperatorMapper.ensureInitialized();
      ConditionOperatorMapper.ensureInitialized();
      TagModifierMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'TagCondition';

  static List<TagOperator> _$operators(TagCondition v) => v.operators;
  static const Field<TagCondition, List<TagOperator>> _f$operators =
      Field('operators', _$operators);
  static List<ConditionOperator> _$conditionOperators(TagCondition v) =>
      v.conditionOperators;
  static const Field<TagCondition, List<ConditionOperator>>
      _f$conditionOperators = Field('conditionOperators', _$conditionOperators);
  static List<dynamic> _$operands(TagCondition v) => v.operands;
  static const Field<TagCondition, List<dynamic>> _f$operands =
      Field('operands', _$operands);
  static List<TagModifier> _$modifiers(TagCondition v) => v.modifiers;
  static const Field<TagCondition, List<TagModifier>> _f$modifiers =
      Field('modifiers', _$modifiers, opt: true, def: const []);

  @override
  final MappableFields<TagCondition> fields = const {
    #operators: _f$operators,
    #conditionOperators: _f$conditionOperators,
    #operands: _f$operands,
    #modifiers: _f$modifiers,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'TagCondition';
  @override
  late final ClassMapperBase superMapper =
      TagEntryBaseMapper.ensureInitialized();

  @override
  DecodingContext inherit(DecodingContext context) {
    return context.inherit(args: () => []);
  }

  static TagCondition _instantiate(DecodingData data) {
    return TagCondition(
        operators: data.dec(_f$operators),
        conditionOperators: data.dec(_f$conditionOperators),
        operands: data.dec(_f$operands),
        modifiers: data.dec(_f$modifiers));
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
      _TagConditionCopyWithImpl<TagCondition, TagCondition>(
          this as TagCondition, $identity, $identity);
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
      $base.as((v, t, t2) => _TagConditionCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class TagConditionCopyWith<$R, $In extends TagCondition, $Out>
    implements TagEntryBaseCopyWith<$R, $In, $Out, dynamic> {
  @override
  ListCopyWith<$R, TagOperator, ObjectCopyWith<$R, TagOperator, TagOperator>>
      get operators;
  @override
  ListCopyWith<$R, ConditionOperator,
          ObjectCopyWith<$R, ConditionOperator, ConditionOperator>>
      get conditionOperators;
  @override
  ListCopyWith<$R, dynamic, ObjectCopyWith<$R, dynamic, dynamic>> get operands;
  @override
  ListCopyWith<$R, TagModifier, ObjectCopyWith<$R, TagModifier, TagModifier>>
      get modifiers;
  @override
  $R call(
      {List<TagOperator>? operators,
      List<ConditionOperator>? conditionOperators,
      List<dynamic>? operands,
      List<TagModifier>? modifiers});
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
      get operators => ListCopyWith($value.operators,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(operators: v));
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
  ListCopyWith<$R, TagModifier, ObjectCopyWith<$R, TagModifier, TagModifier>>
      get modifiers => ListCopyWith($value.modifiers,
          (v, t) => ObjectCopyWith(v, $identity, t), (v) => call(modifiers: v));
  @override
  $R call(
          {List<TagOperator>? operators,
          List<ConditionOperator>? conditionOperators,
          List<dynamic>? operands,
          List<TagModifier>? modifiers}) =>
      $apply(FieldCopyWithData({
        if (operators != null) #operators: operators,
        if (conditionOperators != null) #conditionOperators: conditionOperators,
        if (operands != null) #operands: operands,
        if (modifiers != null) #modifiers: modifiers
      }));
  @override
  TagCondition $make(CopyWithData data) => TagCondition(
      operators: data.get(#operators, or: $value.operators),
      conditionOperators:
          data.get(#conditionOperators, or: $value.conditionOperators),
      operands: data.get(#operands, or: $value.operands),
      modifiers: data.get(#modifiers, or: $value.modifiers));

  @override
  TagConditionCopyWith<$R2, TagCondition, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TagConditionCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
