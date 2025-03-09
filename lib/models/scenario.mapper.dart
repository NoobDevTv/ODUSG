// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'scenario.dart';

class PreGameWidgetMapper extends EnumMapper<PreGameWidget> {
  PreGameWidgetMapper._();

  static PreGameWidgetMapper? _instance;
  static PreGameWidgetMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PreGameWidgetMapper._());
    }
    return _instance!;
  }

  static PreGameWidget fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  PreGameWidget decode(dynamic value) {
    switch (value) {
      case 'roleAssignment':
        return PreGameWidget.roleAssignment;
      case 'textInput':
        return PreGameWidget.textInput;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(PreGameWidget self) {
    switch (self) {
      case PreGameWidget.roleAssignment:
        return 'roleAssignment';
      case PreGameWidget.textInput:
        return 'textInput';
    }
  }
}

extension PreGameWidgetMapperExtension on PreGameWidget {
  String toValue() {
    PreGameWidgetMapper.ensureInitialized();
    return MapperContainer.globals.toValue<PreGameWidget>(this) as String;
  }
}

class ScenarioMapper extends ClassMapperBase<Scenario> {
  ScenarioMapper._();

  static ScenarioMapper? _instance;
  static ScenarioMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ScenarioMapper._());
      EventInfoMapper.ensureInitialized();
      PreGameWidgetMapper.ensureInitialized();
      RolesMapper.ensureInitialized();
      StepMapper.ensureInitialized();
      TagMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Scenario';

  static String _$title(Scenario v) => v.title;
  static const Field<Scenario, String> _f$title = Field('title', _$title);
  static List<EventInfo> _$possibleEvents(Scenario v) => v.possibleEvents;
  static const Field<Scenario, List<EventInfo>> _f$possibleEvents =
      Field('possibleEvents', _$possibleEvents);
  static String _$endText(Scenario v) => v.endText;
  static const Field<Scenario, String> _f$endText = Field('endText', _$endText);
  static bool _$showAssignedEventAtEnd(Scenario v) => v.showAssignedEventAtEnd;
  static const Field<Scenario, bool> _f$showAssignedEventAtEnd =
      Field('showAssignedEventAtEnd', _$showAssignedEventAtEnd);
  static PreGameWidget _$preGameWidget(Scenario v) => v.preGameWidget;
  static const Field<Scenario, PreGameWidget> _f$preGameWidget =
      Field('preGameWidget', _$preGameWidget);
  static String _$description(Scenario v) => v.description;
  static const Field<Scenario, String> _f$description =
      Field('description', _$description);
  static List<Roles> _$roles(Scenario v) => v.roles;
  static const Field<Scenario, List<Roles>> _f$roles = Field('roles', _$roles);
  static List<Step> _$steps(Scenario v) => v.steps;
  static const Field<Scenario, List<Step>> _f$steps = Field('steps', _$steps);
  static List<Tag> _$startingTags(Scenario v) => v.startingTags;
  static const Field<Scenario, List<Tag>> _f$startingTags = Field(
      'startingTags', _$startingTags,
      opt: true, def: const [DefaultWinCondition.tag]);

  @override
  final MappableFields<Scenario> fields = const {
    #title: _f$title,
    #possibleEvents: _f$possibleEvents,
    #endText: _f$endText,
    #showAssignedEventAtEnd: _f$showAssignedEventAtEnd,
    #preGameWidget: _f$preGameWidget,
    #description: _f$description,
    #roles: _f$roles,
    #steps: _f$steps,
    #startingTags: _f$startingTags,
  };

  static Scenario _instantiate(DecodingData data) {
    return Scenario(
        title: data.dec(_f$title),
        possibleEvents: data.dec(_f$possibleEvents),
        endText: data.dec(_f$endText),
        showAssignedEventAtEnd: data.dec(_f$showAssignedEventAtEnd),
        preGameWidget: data.dec(_f$preGameWidget),
        description: data.dec(_f$description),
        roles: data.dec(_f$roles),
        steps: data.dec(_f$steps),
        startingTags: data.dec(_f$startingTags));
  }

  @override
  final Function instantiate = _instantiate;

  static Scenario fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Scenario>(map);
  }

  static Scenario fromJson(String json) {
    return ensureInitialized().decodeJson<Scenario>(json);
  }
}

mixin ScenarioMappable {
  String toJson() {
    return ScenarioMapper.ensureInitialized()
        .encodeJson<Scenario>(this as Scenario);
  }

  Map<String, dynamic> toMap() {
    return ScenarioMapper.ensureInitialized()
        .encodeMap<Scenario>(this as Scenario);
  }

  ScenarioCopyWith<Scenario, Scenario, Scenario> get copyWith =>
      _ScenarioCopyWithImpl(this as Scenario, $identity, $identity);
  @override
  String toString() {
    return ScenarioMapper.ensureInitialized().stringifyValue(this as Scenario);
  }

  @override
  bool operator ==(Object other) {
    return ScenarioMapper.ensureInitialized()
        .equalsValue(this as Scenario, other);
  }

  @override
  int get hashCode {
    return ScenarioMapper.ensureInitialized().hashValue(this as Scenario);
  }
}

extension ScenarioValueCopy<$R, $Out> on ObjectCopyWith<$R, Scenario, $Out> {
  ScenarioCopyWith<$R, Scenario, $Out> get $asScenario =>
      $base.as((v, t, t2) => _ScenarioCopyWithImpl(v, t, t2));
}

abstract class ScenarioCopyWith<$R, $In extends Scenario, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, EventInfo, EventInfoCopyWith<$R, EventInfo, EventInfo>>
      get possibleEvents;
  ListCopyWith<$R, Roles, RolesCopyWith<$R, Roles, Roles>> get roles;
  ListCopyWith<$R, Step, StepCopyWith<$R, Step, Step>> get steps;
  ListCopyWith<$R, Tag, TagCopyWith<$R, Tag, Tag>> get startingTags;
  $R call(
      {String? title,
      List<EventInfo>? possibleEvents,
      String? endText,
      bool? showAssignedEventAtEnd,
      PreGameWidget? preGameWidget,
      String? description,
      List<Roles>? roles,
      List<Step>? steps,
      List<Tag>? startingTags});
  ScenarioCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ScenarioCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, Scenario, $Out>
    implements ScenarioCopyWith<$R, Scenario, $Out> {
  _ScenarioCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Scenario> $mapper =
      ScenarioMapper.ensureInitialized();
  @override
  ListCopyWith<$R, EventInfo, EventInfoCopyWith<$R, EventInfo, EventInfo>>
      get possibleEvents => ListCopyWith($value.possibleEvents,
          (v, t) => v.copyWith.$chain(t), (v) => call(possibleEvents: v));
  @override
  ListCopyWith<$R, Roles, RolesCopyWith<$R, Roles, Roles>> get roles =>
      ListCopyWith(
          $value.roles, (v, t) => v.copyWith.$chain(t), (v) => call(roles: v));
  @override
  ListCopyWith<$R, Step, StepCopyWith<$R, Step, Step>> get steps =>
      ListCopyWith(
          $value.steps, (v, t) => v.copyWith.$chain(t), (v) => call(steps: v));
  @override
  ListCopyWith<$R, Tag, TagCopyWith<$R, Tag, Tag>> get startingTags =>
      ListCopyWith($value.startingTags, (v, t) => v.copyWith.$chain(t),
          (v) => call(startingTags: v));
  @override
  $R call(
          {String? title,
          List<EventInfo>? possibleEvents,
          String? endText,
          bool? showAssignedEventAtEnd,
          PreGameWidget? preGameWidget,
          String? description,
          List<Roles>? roles,
          List<Step>? steps,
          List<Tag>? startingTags}) =>
      $apply(FieldCopyWithData({
        if (title != null) #title: title,
        if (possibleEvents != null) #possibleEvents: possibleEvents,
        if (endText != null) #endText: endText,
        if (showAssignedEventAtEnd != null)
          #showAssignedEventAtEnd: showAssignedEventAtEnd,
        if (preGameWidget != null) #preGameWidget: preGameWidget,
        if (description != null) #description: description,
        if (roles != null) #roles: roles,
        if (steps != null) #steps: steps,
        if (startingTags != null) #startingTags: startingTags
      }));
  @override
  Scenario $make(CopyWithData data) => Scenario(
      title: data.get(#title, or: $value.title),
      possibleEvents: data.get(#possibleEvents, or: $value.possibleEvents),
      endText: data.get(#endText, or: $value.endText),
      showAssignedEventAtEnd:
          data.get(#showAssignedEventAtEnd, or: $value.showAssignedEventAtEnd),
      preGameWidget: data.get(#preGameWidget, or: $value.preGameWidget),
      description: data.get(#description, or: $value.description),
      roles: data.get(#roles, or: $value.roles),
      steps: data.get(#steps, or: $value.steps),
      startingTags: data.get(#startingTags, or: $value.startingTags));

  @override
  ScenarioCopyWith<$R2, Scenario, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ScenarioCopyWithImpl($value, $cast, t);
}

typedef _t$_R0<A, B, C> = (A, B, C);

class _t$_R0Mapper extends RecordMapperBase<_t$_R0> {
  static _t$_R0Mapper? _instance;
  _t$_R0Mapper._();

  static _t$_R0Mapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = _t$_R0Mapper._());
      MapperBase.addType(<A, B, C>(f) => f<(A, B, C)>());
    }
    return _instance!;
  }

  static dynamic _$$1(_t$_R0 v) => v.$1;
  static dynamic _arg$$1<A, B, C>(f) => f<A>();
  static const Field<_t$_R0, dynamic> _f$$1 = Field('\$1', _$$1, arg: _arg$$1);
  static dynamic _$$2(_t$_R0 v) => v.$2;
  static dynamic _arg$$2<A, B, C>(f) => f<B>();
  static const Field<_t$_R0, dynamic> _f$$2 = Field('\$2', _$$2, arg: _arg$$2);
  static dynamic _$$3(_t$_R0 v) => v.$3;
  static dynamic _arg$$3<A, B, C>(f) => f<C>();
  static const Field<_t$_R0, dynamic> _f$$3 = Field('\$3', _$$3, arg: _arg$$3);

  @override
  final MappableFields<_t$_R0> fields = const {
    #$1: _f$$1,
    #$2: _f$$2,
    #$3: _f$$3,
  };

  @override
  Function get typeFactory => <A, B, C>(f) => f<_t$_R0<A, B, C>>();

  static _t$_R0<A, B, C> _instantiate<A, B, C>(DecodingData<_t$_R0> data) {
    return (data.dec(_f$$1), data.dec(_f$$2), data.dec(_f$$3));
  }

  @override
  final Function instantiate = _instantiate;

  static _t$_R0<A, B, C> fromMap<A, B, C>(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<_t$_R0<A, B, C>>(map);
  }

  static _t$_R0<A, B, C> fromJson<A, B, C>(String json) {
    return ensureInitialized().decodeJson<_t$_R0<A, B, C>>(json);
  }
}
