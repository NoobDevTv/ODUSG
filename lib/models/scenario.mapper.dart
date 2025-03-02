// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'scenario.dart';

class ScenarioMapper extends ClassMapperBase<Scenario> {
  ScenarioMapper._();

  static ScenarioMapper? _instance;
  static ScenarioMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ScenarioMapper._());
    }
    return _instance!;
  }

  @override
  final String id = 'Scenario';

  static ScenarioType _$type(Scenario v) => v.type;
  static const Field<Scenario, ScenarioType> _f$type = Field('type', _$type);
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
    #type: _f$type,
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
        type: data.dec(_f$type),
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
  ListCopyWith<$R, EventInfo, ObjectCopyWith<$R, EventInfo, EventInfo>>
      get possibleEvents;
  ListCopyWith<$R, Roles, ObjectCopyWith<$R, Roles, Roles>> get roles;
  ListCopyWith<$R, Step, ObjectCopyWith<$R, Step, Step>> get steps;
  ListCopyWith<$R, Tag, ObjectCopyWith<$R, Tag, Tag>> get startingTags;
  $R call(
      {ScenarioType? type,
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
  ListCopyWith<$R, EventInfo, ObjectCopyWith<$R, EventInfo, EventInfo>>
      get possibleEvents => ListCopyWith(
          $value.possibleEvents,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(possibleEvents: v));
  @override
  ListCopyWith<$R, Roles, ObjectCopyWith<$R, Roles, Roles>> get roles =>
      ListCopyWith($value.roles, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(roles: v));
  @override
  ListCopyWith<$R, Step, ObjectCopyWith<$R, Step, Step>> get steps =>
      ListCopyWith($value.steps, (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(steps: v));
  @override
  ListCopyWith<$R, Tag, ObjectCopyWith<$R, Tag, Tag>> get startingTags =>
      ListCopyWith(
          $value.startingTags,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(startingTags: v));
  @override
  $R call(
          {ScenarioType? type,
          List<EventInfo>? possibleEvents,
          String? endText,
          bool? showAssignedEventAtEnd,
          PreGameWidget? preGameWidget,
          String? description,
          List<Roles>? roles,
          List<Step>? steps,
          List<Tag>? startingTags}) =>
      $apply(FieldCopyWithData({
        if (type != null) #type: type,
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
      type: data.get(#type, or: $value.type),
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
