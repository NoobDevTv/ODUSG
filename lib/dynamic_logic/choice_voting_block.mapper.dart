// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'choice_voting_block.dart';

class ChoiceMapper extends ClassMapperBase<Choice> {
  ChoiceMapper._();

  static ChoiceMapper? _instance;
  static ChoiceMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChoiceMapper._());
      TagMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Choice';

  static List<Tag> _$tags(Choice v) => v.tags;
  static const Field<Choice, List<Tag>> _f$tags = Field('tags', _$tags);
  static String _$text(Choice v) => v.text;
  static const Field<Choice, String> _f$text = Field('text', _$text);

  @override
  final MappableFields<Choice> fields = const {
    #tags: _f$tags,
    #text: _f$text,
  };

  static Choice _instantiate(DecodingData data) {
    return Choice(tags: data.dec(_f$tags), text: data.dec(_f$text));
  }

  @override
  final Function instantiate = _instantiate;

  static Choice fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Choice>(map);
  }

  static Choice fromJson(String json) {
    return ensureInitialized().decodeJson<Choice>(json);
  }
}

mixin ChoiceMappable {
  String toJson() {
    return ChoiceMapper.ensureInitialized().encodeJson<Choice>(this as Choice);
  }

  Map<String, dynamic> toMap() {
    return ChoiceMapper.ensureInitialized().encodeMap<Choice>(this as Choice);
  }

  ChoiceCopyWith<Choice, Choice, Choice> get copyWith =>
      _ChoiceCopyWithImpl<Choice, Choice>(this as Choice, $identity, $identity);
  @override
  String toString() {
    return ChoiceMapper.ensureInitialized().stringifyValue(this as Choice);
  }

  @override
  bool operator ==(Object other) {
    return ChoiceMapper.ensureInitialized().equalsValue(this as Choice, other);
  }

  @override
  int get hashCode {
    return ChoiceMapper.ensureInitialized().hashValue(this as Choice);
  }
}

extension ChoiceValueCopy<$R, $Out> on ObjectCopyWith<$R, Choice, $Out> {
  ChoiceCopyWith<$R, Choice, $Out> get $asChoice =>
      $base.as((v, t, t2) => _ChoiceCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChoiceCopyWith<$R, $In extends Choice, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  ListCopyWith<$R, Tag, TagCopyWith<$R, Tag, Tag>> get tags;
  $R call({List<Tag>? tags, String? text});
  ChoiceCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _ChoiceCopyWithImpl<$R, $Out> extends ClassCopyWithBase<$R, Choice, $Out>
    implements ChoiceCopyWith<$R, Choice, $Out> {
  _ChoiceCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<Choice> $mapper = ChoiceMapper.ensureInitialized();
  @override
  ListCopyWith<$R, Tag, TagCopyWith<$R, Tag, Tag>> get tags => ListCopyWith(
      $value.tags, (v, t) => v.copyWith.$chain(t), (v) => call(tags: v));
  @override
  $R call({List<Tag>? tags, String? text}) => $apply(FieldCopyWithData(
      {if (tags != null) #tags: tags, if (text != null) #text: text}));
  @override
  Choice $make(CopyWithData data) => Choice(
      tags: data.get(#tags, or: $value.tags),
      text: data.get(#text, or: $value.text));

  @override
  ChoiceCopyWith<$R2, Choice, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t) =>
      _ChoiceCopyWithImpl<$R2, $Out2>($value, $cast, t);
}

class ChoiceVotingBlockMapper extends SubClassMapperBase<ChoiceVotingBlock> {
  ChoiceVotingBlockMapper._();

  static ChoiceVotingBlockMapper? _instance;
  static ChoiceVotingBlockMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChoiceVotingBlockMapper._());
      VotingBlockMapper.ensureInitialized().addSubMapper(_instance!);
      TagsMapper.ensureInitialized();
      ChoiceMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ChoiceVotingBlock';

  static int _$minMultiselect(ChoiceVotingBlock v) => v.minMultiselect;
  static const Field<ChoiceVotingBlock, int> _f$minMultiselect =
      Field('minMultiselect', _$minMultiselect);
  static int _$maxMultiselect(ChoiceVotingBlock v) => v.maxMultiselect;
  static const Field<ChoiceVotingBlock, int> _f$maxMultiselect =
      Field('maxMultiselect', _$maxMultiselect);
  static Tags _$setTags(ChoiceVotingBlock v) => v.setTags;
  static const Field<ChoiceVotingBlock, Tags> _f$setTags =
      Field('setTags', _$setTags, opt: true, def: const Tags([]));
  static String _$text(ChoiceVotingBlock v) => v.text;
  static const Field<ChoiceVotingBlock, String> _f$text = Field('text', _$text);
  static List<Choice> _$choices(ChoiceVotingBlock v) => v.choices;
  static const Field<ChoiceVotingBlock, List<Choice>> _f$choices =
      Field('choices', _$choices);
  static bool _$cover(ChoiceVotingBlock v) => v.cover;
  static const Field<ChoiceVotingBlock, bool> _f$cover =
      Field('cover', _$cover, opt: true, def: false);
  static bool _$foreachPlayer(ChoiceVotingBlock v) => v.foreachPlayer;
  static const Field<ChoiceVotingBlock, bool> _f$foreachPlayer =
      Field('foreachPlayer', _$foreachPlayer, opt: true, def: false);
  static Map<String, String> _$perTagText(ChoiceVotingBlock v) => v.perTagText;
  static const Field<ChoiceVotingBlock, Map<String, String>> _f$perTagText =
      Field('perTagText', _$perTagText, opt: true, def: const {});
  static String? _$image(ChoiceVotingBlock v) => v.image;
  static const Field<ChoiceVotingBlock, String> _f$image =
      Field('image', _$image, opt: true);
  static String? _$ttsMessage(ChoiceVotingBlock v) => v.ttsMessage;
  static const Field<ChoiceVotingBlock, String> _f$ttsMessage =
      Field('ttsMessage', _$ttsMessage, opt: true);
  static bool _$optional(ChoiceVotingBlock v) => v.optional;
  static const Field<ChoiceVotingBlock, bool> _f$optional =
      Field('optional', _$optional, opt: true, def: false);

  @override
  final MappableFields<ChoiceVotingBlock> fields = const {
    #minMultiselect: _f$minMultiselect,
    #maxMultiselect: _f$maxMultiselect,
    #setTags: _f$setTags,
    #text: _f$text,
    #choices: _f$choices,
    #cover: _f$cover,
    #foreachPlayer: _f$foreachPlayer,
    #perTagText: _f$perTagText,
    #image: _f$image,
    #ttsMessage: _f$ttsMessage,
    #optional: _f$optional,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = "ChoiceVotingBlock";
  @override
  late final ClassMapperBase superMapper =
      VotingBlockMapper.ensureInitialized();

  static ChoiceVotingBlock _instantiate(DecodingData data) {
    return ChoiceVotingBlock(
        minMultiselect: data.dec(_f$minMultiselect),
        maxMultiselect: data.dec(_f$maxMultiselect),
        setTags: data.dec(_f$setTags),
        text: data.dec(_f$text),
        choices: data.dec(_f$choices),
        cover: data.dec(_f$cover),
        foreachPlayer: data.dec(_f$foreachPlayer),
        perTagText: data.dec(_f$perTagText),
        image: data.dec(_f$image),
        ttsMessage: data.dec(_f$ttsMessage),
        optional: data.dec(_f$optional));
  }

  @override
  final Function instantiate = _instantiate;

  static ChoiceVotingBlock fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChoiceVotingBlock>(map);
  }

  static ChoiceVotingBlock fromJson(String json) {
    return ensureInitialized().decodeJson<ChoiceVotingBlock>(json);
  }
}

mixin ChoiceVotingBlockMappable {
  String toJson() {
    return ChoiceVotingBlockMapper.ensureInitialized()
        .encodeJson<ChoiceVotingBlock>(this as ChoiceVotingBlock);
  }

  Map<String, dynamic> toMap() {
    return ChoiceVotingBlockMapper.ensureInitialized()
        .encodeMap<ChoiceVotingBlock>(this as ChoiceVotingBlock);
  }

  ChoiceVotingBlockCopyWith<ChoiceVotingBlock, ChoiceVotingBlock,
          ChoiceVotingBlock>
      get copyWith =>
          _ChoiceVotingBlockCopyWithImpl<ChoiceVotingBlock, ChoiceVotingBlock>(
              this as ChoiceVotingBlock, $identity, $identity);
  @override
  String toString() {
    return ChoiceVotingBlockMapper.ensureInitialized()
        .stringifyValue(this as ChoiceVotingBlock);
  }

  @override
  bool operator ==(Object other) {
    return ChoiceVotingBlockMapper.ensureInitialized()
        .equalsValue(this as ChoiceVotingBlock, other);
  }

  @override
  int get hashCode {
    return ChoiceVotingBlockMapper.ensureInitialized()
        .hashValue(this as ChoiceVotingBlock);
  }
}

extension ChoiceVotingBlockValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChoiceVotingBlock, $Out> {
  ChoiceVotingBlockCopyWith<$R, ChoiceVotingBlock, $Out>
      get $asChoiceVotingBlock => $base
          .as((v, t, t2) => _ChoiceVotingBlockCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class ChoiceVotingBlockCopyWith<$R, $In extends ChoiceVotingBlock,
    $Out> implements VotingBlockCopyWith<$R, $In, $Out> {
  @override
  TagsCopyWith<$R, Tags, Tags> get setTags;
  ListCopyWith<$R, Choice, ChoiceCopyWith<$R, Choice, Choice>> get choices;
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText;
  @override
  $R call(
      {int? minMultiselect,
      int? maxMultiselect,
      Tags? setTags,
      String? text,
      List<Choice>? choices,
      bool? cover,
      bool? foreachPlayer,
      Map<String, String>? perTagText,
      String? image,
      String? ttsMessage,
      bool? optional});
  ChoiceVotingBlockCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ChoiceVotingBlockCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChoiceVotingBlock, $Out>
    implements ChoiceVotingBlockCopyWith<$R, ChoiceVotingBlock, $Out> {
  _ChoiceVotingBlockCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChoiceVotingBlock> $mapper =
      ChoiceVotingBlockMapper.ensureInitialized();
  @override
  TagsCopyWith<$R, Tags, Tags> get setTags =>
      $value.setTags.copyWith.$chain((v) => call(setTags: v));
  @override
  ListCopyWith<$R, Choice, ChoiceCopyWith<$R, Choice, Choice>> get choices =>
      ListCopyWith($value.choices, (v, t) => v.copyWith.$chain(t),
          (v) => call(choices: v));
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText => MapCopyWith(
          $value.perTagText,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(perTagText: v));
  @override
  $R call(
          {int? minMultiselect,
          int? maxMultiselect,
          Tags? setTags,
          String? text,
          List<Choice>? choices,
          bool? cover,
          bool? foreachPlayer,
          Map<String, String>? perTagText,
          Object? image = $none,
          Object? ttsMessage = $none,
          bool? optional}) =>
      $apply(FieldCopyWithData({
        if (minMultiselect != null) #minMultiselect: minMultiselect,
        if (maxMultiselect != null) #maxMultiselect: maxMultiselect,
        if (setTags != null) #setTags: setTags,
        if (text != null) #text: text,
        if (choices != null) #choices: choices,
        if (cover != null) #cover: cover,
        if (foreachPlayer != null) #foreachPlayer: foreachPlayer,
        if (perTagText != null) #perTagText: perTagText,
        if (image != $none) #image: image,
        if (ttsMessage != $none) #ttsMessage: ttsMessage,
        if (optional != null) #optional: optional
      }));
  @override
  ChoiceVotingBlock $make(CopyWithData data) => ChoiceVotingBlock(
      minMultiselect: data.get(#minMultiselect, or: $value.minMultiselect),
      maxMultiselect: data.get(#maxMultiselect, or: $value.maxMultiselect),
      setTags: data.get(#setTags, or: $value.setTags),
      text: data.get(#text, or: $value.text),
      choices: data.get(#choices, or: $value.choices),
      cover: data.get(#cover, or: $value.cover),
      foreachPlayer: data.get(#foreachPlayer, or: $value.foreachPlayer),
      perTagText: data.get(#perTagText, or: $value.perTagText),
      image: data.get(#image, or: $value.image),
      ttsMessage: data.get(#ttsMessage, or: $value.ttsMessage),
      optional: data.get(#optional, or: $value.optional));

  @override
  ChoiceVotingBlockCopyWith<$R2, ChoiceVotingBlock, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ChoiceVotingBlockCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
