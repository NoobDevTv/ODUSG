// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'player_voting_block.dart';

class PlayerVotingBlockMapper extends SubClassMapperBase<PlayerVotingBlock> {
  PlayerVotingBlockMapper._();

  static PlayerVotingBlockMapper? _instance;
  static PlayerVotingBlockMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = PlayerVotingBlockMapper._());
      VotingBlockMapper.ensureInitialized().addSubMapper(_instance!);
      TagFilterMapper.ensureInitialized();
      TagsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'PlayerVotingBlock';

  static TagFilter _$votingTargetPossibilities(PlayerVotingBlock v) =>
      v.votingTargetPossibilities;
  static const Field<PlayerVotingBlock, TagFilter>
      _f$votingTargetPossibilities =
      Field('votingTargetPossibilities', _$votingTargetPossibilities);
  static int _$minMultiselect(PlayerVotingBlock v) => v.minMultiselect;
  static const Field<PlayerVotingBlock, int> _f$minMultiselect =
      Field('minMultiselect', _$minMultiselect, opt: true, def: 1);
  static int _$maxMultiselect(PlayerVotingBlock v) => v.maxMultiselect;
  static const Field<PlayerVotingBlock, int> _f$maxMultiselect =
      Field('maxMultiselect', _$maxMultiselect, opt: true, def: 1);
  static Tags _$setTags(PlayerVotingBlock v) => v.setTags;
  static const Field<PlayerVotingBlock, Tags> _f$setTags =
      Field('setTags', _$setTags);
  static String _$text(PlayerVotingBlock v) => v.text;
  static const Field<PlayerVotingBlock, String> _f$text = Field('text', _$text);
  static bool _$cover(PlayerVotingBlock v) => v.cover;
  static const Field<PlayerVotingBlock, bool> _f$cover =
      Field('cover', _$cover, opt: true, def: false);
  static bool _$foreachPlayer(PlayerVotingBlock v) => v.foreachPlayer;
  static const Field<PlayerVotingBlock, bool> _f$foreachPlayer =
      Field('foreachPlayer', _$foreachPlayer, opt: true, def: false);
  static Map<String, String> _$perTagText(PlayerVotingBlock v) => v.perTagText;
  static const Field<PlayerVotingBlock, Map<String, String>> _f$perTagText =
      Field('perTagText', _$perTagText, opt: true, def: const {});
  static String? _$image(PlayerVotingBlock v) => v.image;
  static const Field<PlayerVotingBlock, String> _f$image =
      Field('image', _$image, opt: true);
  static String? _$ttsMessage(PlayerVotingBlock v) => v.ttsMessage;
  static const Field<PlayerVotingBlock, String> _f$ttsMessage =
      Field('ttsMessage', _$ttsMessage, opt: true);
  static bool _$optional(PlayerVotingBlock v) => v.optional;
  static const Field<PlayerVotingBlock, bool> _f$optional =
      Field('optional', _$optional, opt: true, def: false);

  @override
  final MappableFields<PlayerVotingBlock> fields = const {
    #votingTargetPossibilities: _f$votingTargetPossibilities,
    #minMultiselect: _f$minMultiselect,
    #maxMultiselect: _f$maxMultiselect,
    #setTags: _f$setTags,
    #text: _f$text,
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
  final dynamic discriminatorValue = "PlayerVotingBlock";
  @override
  late final ClassMapperBase superMapper =
      VotingBlockMapper.ensureInitialized();

  static PlayerVotingBlock _instantiate(DecodingData data) {
    return PlayerVotingBlock(
        votingTargetPossibilities: data.dec(_f$votingTargetPossibilities),
        minMultiselect: data.dec(_f$minMultiselect),
        maxMultiselect: data.dec(_f$maxMultiselect),
        setTags: data.dec(_f$setTags),
        text: data.dec(_f$text),
        cover: data.dec(_f$cover),
        foreachPlayer: data.dec(_f$foreachPlayer),
        perTagText: data.dec(_f$perTagText),
        image: data.dec(_f$image),
        ttsMessage: data.dec(_f$ttsMessage),
        optional: data.dec(_f$optional));
  }

  @override
  final Function instantiate = _instantiate;

  static PlayerVotingBlock fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<PlayerVotingBlock>(map);
  }

  static PlayerVotingBlock fromJson(String json) {
    return ensureInitialized().decodeJson<PlayerVotingBlock>(json);
  }
}

mixin PlayerVotingBlockMappable {
  String toJson() {
    return PlayerVotingBlockMapper.ensureInitialized()
        .encodeJson<PlayerVotingBlock>(this as PlayerVotingBlock);
  }

  Map<String, dynamic> toMap() {
    return PlayerVotingBlockMapper.ensureInitialized()
        .encodeMap<PlayerVotingBlock>(this as PlayerVotingBlock);
  }

  PlayerVotingBlockCopyWith<PlayerVotingBlock, PlayerVotingBlock,
          PlayerVotingBlock>
      get copyWith =>
          _PlayerVotingBlockCopyWithImpl<PlayerVotingBlock, PlayerVotingBlock>(
              this as PlayerVotingBlock, $identity, $identity);
  @override
  String toString() {
    return PlayerVotingBlockMapper.ensureInitialized()
        .stringifyValue(this as PlayerVotingBlock);
  }

  @override
  bool operator ==(Object other) {
    return PlayerVotingBlockMapper.ensureInitialized()
        .equalsValue(this as PlayerVotingBlock, other);
  }

  @override
  int get hashCode {
    return PlayerVotingBlockMapper.ensureInitialized()
        .hashValue(this as PlayerVotingBlock);
  }
}

extension PlayerVotingBlockValueCopy<$R, $Out>
    on ObjectCopyWith<$R, PlayerVotingBlock, $Out> {
  PlayerVotingBlockCopyWith<$R, PlayerVotingBlock, $Out>
      get $asPlayerVotingBlock => $base
          .as((v, t, t2) => _PlayerVotingBlockCopyWithImpl<$R, $Out>(v, t, t2));
}

abstract class PlayerVotingBlockCopyWith<$R, $In extends PlayerVotingBlock,
    $Out> implements VotingBlockCopyWith<$R, $In, $Out> {
  TagFilterCopyWith<$R, TagFilter, TagFilter> get votingTargetPossibilities;
  @override
  TagsCopyWith<$R, Tags, Tags> get setTags;
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText;
  @override
  $R call(
      {TagFilter? votingTargetPossibilities,
      int? minMultiselect,
      int? maxMultiselect,
      Tags? setTags,
      String? text,
      bool? cover,
      bool? foreachPlayer,
      Map<String, String>? perTagText,
      String? image,
      String? ttsMessage,
      bool? optional});
  PlayerVotingBlockCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _PlayerVotingBlockCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, PlayerVotingBlock, $Out>
    implements PlayerVotingBlockCopyWith<$R, PlayerVotingBlock, $Out> {
  _PlayerVotingBlockCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<PlayerVotingBlock> $mapper =
      PlayerVotingBlockMapper.ensureInitialized();
  @override
  TagFilterCopyWith<$R, TagFilter, TagFilter> get votingTargetPossibilities =>
      $value.votingTargetPossibilities.copyWith
          .$chain((v) => call(votingTargetPossibilities: v));
  @override
  TagsCopyWith<$R, Tags, Tags> get setTags =>
      $value.setTags.copyWith.$chain((v) => call(setTags: v));
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText => MapCopyWith(
          $value.perTagText,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(perTagText: v));
  @override
  $R call(
          {TagFilter? votingTargetPossibilities,
          int? minMultiselect,
          int? maxMultiselect,
          Tags? setTags,
          String? text,
          bool? cover,
          bool? foreachPlayer,
          Map<String, String>? perTagText,
          Object? image = $none,
          Object? ttsMessage = $none,
          bool? optional}) =>
      $apply(FieldCopyWithData({
        if (votingTargetPossibilities != null)
          #votingTargetPossibilities: votingTargetPossibilities,
        if (minMultiselect != null) #minMultiselect: minMultiselect,
        if (maxMultiselect != null) #maxMultiselect: maxMultiselect,
        if (setTags != null) #setTags: setTags,
        if (text != null) #text: text,
        if (cover != null) #cover: cover,
        if (foreachPlayer != null) #foreachPlayer: foreachPlayer,
        if (perTagText != null) #perTagText: perTagText,
        if (image != $none) #image: image,
        if (ttsMessage != $none) #ttsMessage: ttsMessage,
        if (optional != null) #optional: optional
      }));
  @override
  PlayerVotingBlock $make(CopyWithData data) => PlayerVotingBlock(
      votingTargetPossibilities: data.get(#votingTargetPossibilities,
          or: $value.votingTargetPossibilities),
      minMultiselect: data.get(#minMultiselect, or: $value.minMultiselect),
      maxMultiselect: data.get(#maxMultiselect, or: $value.maxMultiselect),
      setTags: data.get(#setTags, or: $value.setTags),
      text: data.get(#text, or: $value.text),
      cover: data.get(#cover, or: $value.cover),
      foreachPlayer: data.get(#foreachPlayer, or: $value.foreachPlayer),
      perTagText: data.get(#perTagText, or: $value.perTagText),
      image: data.get(#image, or: $value.image),
      ttsMessage: data.get(#ttsMessage, or: $value.ttsMessage),
      optional: data.get(#optional, or: $value.optional));

  @override
  PlayerVotingBlockCopyWith<$R2, PlayerVotingBlock, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PlayerVotingBlockCopyWithImpl<$R2, $Out2>($value, $cast, t);
}
