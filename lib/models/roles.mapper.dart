// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'roles.dart';

class RoleMapper extends EnumMapper<Role> {
  RoleMapper._();

  static RoleMapper? _instance;
  static RoleMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RoleMapper._());
    }
    return _instance!;
  }

  static Role fromValue(dynamic value) {
    ensureInitialized();
    return MapperContainer.globals.fromValue(value);
  }

  @override
  Role decode(dynamic value) {
    switch (value) {
      case 'undefined':
        return Role.undefined;
      case 'bad':
        return Role.bad;
      case 'good':
        return Role.good;
      default:
        throw MapperException.unknownEnumValue(value);
    }
  }

  @override
  dynamic encode(Role self) {
    switch (self) {
      case Role.undefined:
        return 'undefined';
      case Role.bad:
        return 'bad';
      case Role.good:
        return 'good';
    }
  }
}

extension RoleMapperExtension on Role {
  String toValue() {
    RoleMapper.ensureInitialized();
    return MapperContainer.globals.toValue<Role>(this) as String;
  }
}

class RolesMapper extends ClassMapperBase<Roles> {
  RolesMapper._();

  static RolesMapper? _instance;
  static RolesMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = RolesMapper._());
      _t$_R0Mapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Roles';

  static String _$tag(Roles v) => v.tag;
  static const Field<Roles, String> _f$tag = Field('tag', _$tag);
  static String _$intlKey(Roles v) => v.intlKey;
  static const Field<Roles, String> _f$intlKey = Field('intlKey', _$intlKey);
  static List<_t$_R0<int, int, int>> _$getAssignableAmount(Roles v) =>
      v.getAssignableAmount;
  static const Field<Roles, List<_t$_R0<int, int, int>>>
      _f$getAssignableAmount =
      Field('getAssignableAmount', _$getAssignableAmount);
  static int _$priority(Roles v) => v.priority;
  static const Field<Roles, int> _f$priority =
      Field('priority', _$priority, opt: true, def: 0);
  static bool _$isDefault(Roles v) => v.isDefault;
  static const Field<Roles, bool> _f$isDefault =
      Field('isDefault', _$isDefault, opt: true, def: false);

  @override
  final MappableFields<Roles> fields = const {
    #tag: _f$tag,
    #intlKey: _f$intlKey,
    #getAssignableAmount: _f$getAssignableAmount,
    #priority: _f$priority,
    #isDefault: _f$isDefault,
  };

  static Roles _instantiate(DecodingData data) {
    return Roles(
        tag: data.dec(_f$tag),
        intlKey: data.dec(_f$intlKey),
        getAssignableAmount: data.dec(_f$getAssignableAmount),
        priority: data.dec(_f$priority),
        isDefault: data.dec(_f$isDefault));
  }

  @override
  final Function instantiate = _instantiate;

  static Roles fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Roles>(map);
  }

  static Roles fromJson(String json) {
    return ensureInitialized().decodeJson<Roles>(json);
  }
}

mixin RolesMappable {
  String toJson() {
    return RolesMapper.ensureInitialized().encodeJson<Roles>(this as Roles);
  }

  Map<String, dynamic> toMap() {
    return RolesMapper.ensureInitialized().encodeMap<Roles>(this as Roles);
  }

  RolesCopyWith<Roles, Roles, Roles> get copyWith =>
      _RolesCopyWithImpl(this as Roles, $identity, $identity);
  @override
  String toString() {
    return RolesMapper.ensureInitialized().stringifyValue(this as Roles);
  }

  @override
  bool operator ==(Object other) {
    return RolesMapper.ensureInitialized().equalsValue(this as Roles, other);
  }

  @override
  int get hashCode {
    return RolesMapper.ensureInitialized().hashValue(this as Roles);
  }
}

extension RolesValueCopy<$R, $Out> on ObjectCopyWith<$R, Roles, $Out> {
  RolesCopyWith<$R, Roles, $Out> get $asRoles =>
      $base.as((v, t, t2) => _RolesCopyWithImpl(v, t, t2));
}

abstract class RolesCopyWith<$R, $In extends Roles, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, _t$_R0<int, int, int>,
          ObjectCopyWith<$R, _t$_R0<int, int, int>, _t$_R0<int, int, int>>>
      get getAssignableAmount;
  $R call(
      {String? tag,
      String? intlKey,
      List<_t$_R0<int, int, int>>? getAssignableAmount,
      int? priority,
      bool? isDefault});
  RolesCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _RolesCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Roles, $Out>
    implements RolesCopyWith<$R, Roles, $Out> {
  _RolesCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Roles> $mapper = RolesMapper.ensureInitialized();
  @override
  ListCopyWith<$R, _t$_R0<int, int, int>,
          ObjectCopyWith<$R, _t$_R0<int, int, int>, _t$_R0<int, int, int>>>
      get getAssignableAmount => ListCopyWith(
          $value.getAssignableAmount,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(getAssignableAmount: v));
  @override
  $R call(
          {String? tag,
          String? intlKey,
          List<_t$_R0<int, int, int>>? getAssignableAmount,
          int? priority,
          bool? isDefault}) =>
      $apply(FieldCopyWithData({
        if (tag != null) #tag: tag,
        if (intlKey != null) #intlKey: intlKey,
        if (getAssignableAmount != null)
          #getAssignableAmount: getAssignableAmount,
        if (priority != null) #priority: priority,
        if (isDefault != null) #isDefault: isDefault
      }));
  @override
  Roles $make(CopyWithData data) => Roles(
      tag: data.get(#tag, or: $value.tag),
      intlKey: data.get(#intlKey, or: $value.intlKey),
      getAssignableAmount:
          data.get(#getAssignableAmount, or: $value.getAssignableAmount),
      priority: data.get(#priority, or: $value.priority),
      isDefault: data.get(#isDefault, or: $value.isDefault));

  @override
  RolesCopyWith<$R2, Roles, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _RolesCopyWithImpl($value, $cast, t);
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
