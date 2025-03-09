// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'condition_operator.dart';

class ConditionOperatorMapper extends EnumMapper<ConditionOperator> {
  ConditionOperatorMapper._();

  static ConditionOperatorMapper? _instance;
  static ConditionOperatorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ConditionOperatorMapper._());
    }
    return _instance!;
  }

  static ConditionOperator fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  ConditionOperator decode(dynamic value) {
    switch (value) {
      case 'none':
        return ConditionOperator.none;
      case 'and':
        return ConditionOperator.and;
      case 'or':
        return ConditionOperator.or;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(ConditionOperator self) {
    switch (self) {
      case ConditionOperator.none:
        return 'none';
      case ConditionOperator.and:
        return 'and';
      case ConditionOperator.or:
        return 'or';
    }
  }
}

extension ConditionOperatorMapperExtension on ConditionOperator {
  String toValue() {
    ConditionOperatorMapper.ensureInitialized();
    return MapperContainer.globals.toValue<ConditionOperator>(this) as String;
  }
}

class TagOperatorMapper extends EnumMapper<TagOperator> {
  TagOperatorMapper._();

  static TagOperatorMapper? _instance;
  static TagOperatorMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TagOperatorMapper._());
    }
    return _instance!;
  }

  static TagOperator fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TagOperator decode(dynamic value) {
    switch (value) {
      case 'none':
        return TagOperator.none;
      case 'less':
        return TagOperator.less;
      case 'equals':
        return TagOperator.equals;
      case 'greater':
        return TagOperator.greater;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TagOperator self) {
    switch (self) {
      case TagOperator.none:
        return 'none';
      case TagOperator.less:
        return 'less';
      case TagOperator.equals:
        return 'equals';
      case TagOperator.greater:
        return 'greater';
    }
  }
}

extension TagOperatorMapperExtension on TagOperator {
  String toValue() {
    TagOperatorMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TagOperator>(this) as String;
  }
}

class TagModifierMapper extends EnumMapper<TagModifier> {
  TagModifierMapper._();

  static TagModifierMapper? _instance;
  static TagModifierMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TagModifierMapper._());
    }
    return _instance!;
  }

  static TagModifier fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  TagModifier decode(dynamic value) {
    switch (value) {
      case 'none':
        return TagModifier.none;
      case 'invert':
        return TagModifier.invert;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(TagModifier self) {
    switch (self) {
      case TagModifier.none:
        return 'none';
      case TagModifier.invert:
        return 'invert';
    }
  }
}

extension TagModifierMapperExtension on TagModifier {
  String toValue() {
    TagModifierMapper.ensureInitialized();
    return MapperContainer.globals.toValue<TagModifier>(this) as String;
  }
}
