// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'single_child_executor_block.dart';

class SingleChildExecutorBlockMapper
    extends SubClassMapperBase<SingleChildExecutorBlock> {
  SingleChildExecutorBlockMapper._();

  static SingleChildExecutorBlockMapper? _instance;
  static SingleChildExecutorBlockMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals
          .use(_instance = SingleChildExecutorBlockMapper._());
      BlockMapper.ensureInitialized().addSubMapper(_instance!);
      StepMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'SingleChildExecutorBlock';

  static String _$text(SingleChildExecutorBlock v) => v.text;
  static const Field<SingleChildExecutorBlock, String> _f$text =
      Field('text', _$text);
  static bool _$cover(SingleChildExecutorBlock v) => v.cover;
  static const Field<SingleChildExecutorBlock, bool> _f$cover =
      Field('cover', _$cover, opt: true, def: false);
  static bool _$foreachPlayer(SingleChildExecutorBlock v) => v.foreachPlayer;
  static const Field<SingleChildExecutorBlock, bool> _f$foreachPlayer =
      Field('foreachPlayer', _$foreachPlayer, opt: true, def: false);
  static Map<String, String> _$perTagText(SingleChildExecutorBlock v) =>
      v.perTagText;
  static const Field<SingleChildExecutorBlock, Map<String, String>>
      _f$perTagText =
      Field('perTagText', _$perTagText, opt: true, def: const {});
  static List<Step> _$steps(SingleChildExecutorBlock v) => v.steps;
  static const Field<SingleChildExecutorBlock, List<Step>> _f$steps =
      Field('steps', _$steps);
  static bool _$randomOrder(SingleChildExecutorBlock v) => v.randomOrder;
  static const Field<SingleChildExecutorBlock, bool> _f$randomOrder =
      Field('randomOrder', _$randomOrder);
  static bool _$refillWhenEmpty(SingleChildExecutorBlock v) =>
      v.refillWhenEmpty;
  static const Field<SingleChildExecutorBlock, bool> _f$refillWhenEmpty =
      Field('refillWhenEmpty', _$refillWhenEmpty);
  static bool _$removeExecuted(SingleChildExecutorBlock v) => v.removeExecuted;
  static const Field<SingleChildExecutorBlock, bool> _f$removeExecuted =
      Field('removeExecuted', _$removeExecuted);
  static String? _$image(SingleChildExecutorBlock v) => v.image;
  static const Field<SingleChildExecutorBlock, String> _f$image =
      Field('image', _$image, opt: true);
  static String? _$ttsMessage(SingleChildExecutorBlock v) => v.ttsMessage;
  static const Field<SingleChildExecutorBlock, String> _f$ttsMessage =
      Field('ttsMessage', _$ttsMessage, opt: true);

  @override
  final MappableFields<SingleChildExecutorBlock> fields = const {
    #text: _f$text,
    #cover: _f$cover,
    #foreachPlayer: _f$foreachPlayer,
    #perTagText: _f$perTagText,
    #steps: _f$steps,
    #randomOrder: _f$randomOrder,
    #refillWhenEmpty: _f$refillWhenEmpty,
    #removeExecuted: _f$removeExecuted,
    #image: _f$image,
    #ttsMessage: _f$ttsMessage,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'SingleChildExecutorBlock';
  @override
  late final ClassMapperBase superMapper = BlockMapper.ensureInitialized();

  static SingleChildExecutorBlock _instantiate(DecodingData data) {
    return SingleChildExecutorBlock(
        text: data.dec(_f$text),
        cover: data.dec(_f$cover),
        foreachPlayer: data.dec(_f$foreachPlayer),
        perTagText: data.dec(_f$perTagText),
        steps: data.dec(_f$steps),
        randomOrder: data.dec(_f$randomOrder),
        refillWhenEmpty: data.dec(_f$refillWhenEmpty),
        removeExecuted: data.dec(_f$removeExecuted),
        image: data.dec(_f$image),
        ttsMessage: data.dec(_f$ttsMessage));
  }

  @override
  final Function instantiate = _instantiate;

  static SingleChildExecutorBlock fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<SingleChildExecutorBlock>(map);
  }

  static SingleChildExecutorBlock fromJson(String json) {
    return ensureInitialized().decodeJson<SingleChildExecutorBlock>(json);
  }
}

mixin SingleChildExecutorBlockMappable {
  String toJson() {
    return SingleChildExecutorBlockMapper.ensureInitialized()
        .encodeJson<SingleChildExecutorBlock>(this as SingleChildExecutorBlock);
  }

  Map<String, dynamic> toMap() {
    return SingleChildExecutorBlockMapper.ensureInitialized()
        .encodeMap<SingleChildExecutorBlock>(this as SingleChildExecutorBlock);
  }

  SingleChildExecutorBlockCopyWith<SingleChildExecutorBlock,
          SingleChildExecutorBlock, SingleChildExecutorBlock>
      get copyWith => _SingleChildExecutorBlockCopyWithImpl<
              SingleChildExecutorBlock, SingleChildExecutorBlock>(
          this as SingleChildExecutorBlock, $identity, $identity);
  @override
  String toString() {
    return SingleChildExecutorBlockMapper.ensureInitialized()
        .stringifyValue(this as SingleChildExecutorBlock);
  }

  @override
  bool operator ==(Object other) {
    return SingleChildExecutorBlockMapper.ensureInitialized()
        .equalsValue(this as SingleChildExecutorBlock, other);
  }

  @override
  int get hashCode {
    return SingleChildExecutorBlockMapper.ensureInitialized()
        .hashValue(this as SingleChildExecutorBlock);
  }
}

extension SingleChildExecutorBlockValueCopy<$R, $Out>
    on ObjectCopyWith<$R, SingleChildExecutorBlock, $Out> {
  SingleChildExecutorBlockCopyWith<$R, SingleChildExecutorBlock, $Out>
      get $asSingleChildExecutorBlock => $base.as((v, t, t2) =>
          _SingleChildExecutorBlockCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class SingleChildExecutorBlockCopyWith<
    $R,
    $In extends SingleChildExecutorBlock,
    $Out> implements BlockCopyWith<$R, $In, $Out> {
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText;
  ListCopyWith<$R, Step, StepCopyWith<$R, Step, Step>> get steps;
  @override
  $R call(
      {String? text,
      bool? cover,
      bool? foreachPlayer,
      Map<String, String>? perTagText,
      List<Step>? steps,
      bool? randomOrder,
      bool? refillWhenEmpty,
      bool? removeExecuted,
      String? image,
      String? ttsMessage});
  SingleChildExecutorBlockCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _SingleChildExecutorBlockCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, SingleChildExecutorBlock, $Out>
    implements
        SingleChildExecutorBlockCopyWith<$R, SingleChildExecutorBlock, $Out> {
  _SingleChildExecutorBlockCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<SingleChildExecutorBlock> $mapper =
      SingleChildExecutorBlockMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText => MapCopyWith(
          $value.perTagText,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(perTagText: v));
  @override
  ListCopyWith<$R, Step, StepCopyWith<$R, Step, Step>> get steps =>
      ListCopyWith(
          $value.steps, (v, t) => v.copyWith.$chain(t), (v) => call(steps: v));
  @override
  $R call(
          {String? text,
          bool? cover,
          bool? foreachPlayer,
          Map<String, String>? perTagText,
          List<Step>? steps,
          bool? randomOrder,
          bool? refillWhenEmpty,
          bool? removeExecuted,
          Object? image = $none,
          Object? ttsMessage = $none}) =>
      $apply(FieldCopyWithData({
        if (text != null) #text: text,
        if (cover != null) #cover: cover,
        if (foreachPlayer != null) #foreachPlayer: foreachPlayer,
        if (perTagText != null) #perTagText: perTagText,
        if (steps != null) #steps: steps,
        if (randomOrder != null) #randomOrder: randomOrder,
        if (refillWhenEmpty != null) #refillWhenEmpty: refillWhenEmpty,
        if (removeExecuted != null) #removeExecuted: removeExecuted,
        if (image != $none) #image: image,
        if (ttsMessage != $none) #ttsMessage: ttsMessage
      }));
  @override
  SingleChildExecutorBlock $make(CopyWithData data) => SingleChildExecutorBlock(
      text: data.get(#text, or: $value.text),
      cover: data.get(#cover, or: $value.cover),
      foreachPlayer: data.get(#foreachPlayer, or: $value.foreachPlayer),
      perTagText: data.get(#perTagText, or: $value.perTagText),
      steps: data.get(#steps, or: $value.steps),
      randomOrder: data.get(#randomOrder, or: $value.randomOrder),
      refillWhenEmpty: data.get(#refillWhenEmpty, or: $value.refillWhenEmpty),
      removeExecuted: data.get(#removeExecuted, or: $value.removeExecuted),
      image: data.get(#image, or: $value.image),
      ttsMessage: data.get(#ttsMessage, or: $value.ttsMessage));

  @override
  SingleChildExecutorBlockCopyWith<$R2, SingleChildExecutorBlock, $Out2>
      $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
          _SingleChildExecutorBlockCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
