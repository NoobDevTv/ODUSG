// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'block.dart';

class BlockMapper extends ClassMapperBase<Block> {
  BlockMapper._();

  static BlockMapper? _instance;
  static BlockMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = BlockMapper._());
      NextButtonBlockMapper.ensureInitialized();
      TimerBlockMapper.ensureInitialized();
      VotingBlockMapper.ensureInitialized();
      ChangeTagBlockMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'Block';

  static String _$text(Block v) => v.text;
  static const Field<Block, String> _f$text = Field('text', _$text);
  static bool _$cover(Block v) => v.cover;
  static const Field<Block, bool> _f$cover =
      Field('cover', _$cover, opt: true, def: false);
  static bool _$foreachPlayer(Block v) => v.foreachPlayer;
  static const Field<Block, bool> _f$foreachPlayer =
      Field('foreachPlayer', _$foreachPlayer, opt: true, def: false);
  static Map<String, String> _$perTagText(Block v) => v.perTagText;
  static const Field<Block, Map<String, String>> _f$perTagText =
      Field('perTagText', _$perTagText, opt: true, def: const {});

  @override
  final MappableFields<Block> fields = const {
    #text: _f$text,
    #cover: _f$cover,
    #foreachPlayer: _f$foreachPlayer,
    #perTagText: _f$perTagText,
  };

  static Block _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'Block', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static Block fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<Block>(map);
  }

  static Block fromJson(String json) {
    return ensureInitialized().decodeJson<Block>(json);
  }
}

mixin BlockMappable {
  String toJson();
  Map<String, dynamic> toMap();
  BlockCopyWith<Block, Block, Block> get copyWith;
}

abstract class BlockCopyWith<$R, $In extends Block, $Out>
    implements ClassCopyWith<$R, $In, $Out> {
  $R call({String? text});
  BlockCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class NextButtonBlockMapper extends SubClassMapperBase<NextButtonBlock> {
  NextButtonBlockMapper._();

  static NextButtonBlockMapper? _instance;
  static NextButtonBlockMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = NextButtonBlockMapper._());
      BlockMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'NextButtonBlock';

  static bool _$endsGame(NextButtonBlock v) => v.endsGame;
  static const Field<NextButtonBlock, bool> _f$endsGame =
      Field('endsGame', _$endsGame);
  static String _$text(NextButtonBlock v) => v.text;
  static const Field<NextButtonBlock, String> _f$text = Field('text', _$text);
  static String _$buttonText(NextButtonBlock v) => v.buttonText;
  static const Field<NextButtonBlock, String> _f$buttonText =
      Field('buttonText', _$buttonText, opt: true, def: "Next");
  static bool _$cover(NextButtonBlock v) => v.cover;
  static const Field<NextButtonBlock, bool> _f$cover =
      Field('cover', _$cover, opt: true, def: false);
  static bool _$foreachPlayer(NextButtonBlock v) => v.foreachPlayer;
  static const Field<NextButtonBlock, bool> _f$foreachPlayer =
      Field('foreachPlayer', _$foreachPlayer, opt: true, def: false);
  static Map<String, String> _$perTagText(NextButtonBlock v) => v.perTagText;
  static const Field<NextButtonBlock, Map<String, String>> _f$perTagText =
      Field('perTagText', _$perTagText, opt: true, def: const {});

  @override
  final MappableFields<NextButtonBlock> fields = const {
    #endsGame: _f$endsGame,
    #text: _f$text,
    #buttonText: _f$buttonText,
    #cover: _f$cover,
    #foreachPlayer: _f$foreachPlayer,
    #perTagText: _f$perTagText,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'NextButtonBlock';
  @override
  late final ClassMapperBase superMapper = BlockMapper.ensureInitialized();

  static NextButtonBlock _instantiate(DecodingData data) {
    return NextButtonBlock(
        endsGame: data.dec(_f$endsGame),
        text: data.dec(_f$text),
        buttonText: data.dec(_f$buttonText),
        cover: data.dec(_f$cover),
        foreachPlayer: data.dec(_f$foreachPlayer),
        perTagText: data.dec(_f$perTagText));
  }

  @override
  final Function instantiate = _instantiate;

  static NextButtonBlock fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<NextButtonBlock>(map);
  }

  static NextButtonBlock fromJson(String json) {
    return ensureInitialized().decodeJson<NextButtonBlock>(json);
  }
}

mixin NextButtonBlockMappable {
  String toJson() {
    return NextButtonBlockMapper.ensureInitialized()
        .encodeJson<NextButtonBlock>(this as NextButtonBlock);
  }

  Map<String, dynamic> toMap() {
    return NextButtonBlockMapper.ensureInitialized()
        .encodeMap<NextButtonBlock>(this as NextButtonBlock);
  }

  NextButtonBlockCopyWith<NextButtonBlock, NextButtonBlock, NextButtonBlock>
      get copyWith => _NextButtonBlockCopyWithImpl(
          this as NextButtonBlock, $identity, $identity);
  @override
  String toString() {
    return NextButtonBlockMapper.ensureInitialized()
        .stringifyValue(this as NextButtonBlock);
  }

  @override
  bool operator ==(Object other) {
    return NextButtonBlockMapper.ensureInitialized()
        .equalsValue(this as NextButtonBlock, other);
  }

  @override
  int get hashCode {
    return NextButtonBlockMapper.ensureInitialized()
        .hashValue(this as NextButtonBlock);
  }
}

extension NextButtonBlockValueCopy<$R, $Out>
    on ObjectCopyWith<$R, NextButtonBlock, $Out> {
  NextButtonBlockCopyWith<$R, NextButtonBlock, $Out> get $asNextButtonBlock =>
      $base.as((v, t, t2) => _NextButtonBlockCopyWithImpl(v, t, t2));
}

abstract class NextButtonBlockCopyWith<$R, $In extends NextButtonBlock, $Out>
    implements BlockCopyWith<$R, $In, $Out> {
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText;
  @override
  $R call(
      {bool? endsGame,
      String? text,
      String? buttonText,
      bool? cover,
      bool? foreachPlayer,
      Map<String, String>? perTagText});
  NextButtonBlockCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _NextButtonBlockCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, NextButtonBlock, $Out>
    implements NextButtonBlockCopyWith<$R, NextButtonBlock, $Out> {
  _NextButtonBlockCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<NextButtonBlock> $mapper =
      NextButtonBlockMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText => MapCopyWith(
          $value.perTagText,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(perTagText: v));
  @override
  $R call(
          {bool? endsGame,
          String? text,
          String? buttonText,
          bool? cover,
          bool? foreachPlayer,
          Map<String, String>? perTagText}) =>
      $apply(FieldCopyWithData({
        if (endsGame != null) #endsGame: endsGame,
        if (text != null) #text: text,
        if (buttonText != null) #buttonText: buttonText,
        if (cover != null) #cover: cover,
        if (foreachPlayer != null) #foreachPlayer: foreachPlayer,
        if (perTagText != null) #perTagText: perTagText
      }));
  @override
  NextButtonBlock $make(CopyWithData data) => NextButtonBlock(
      endsGame: data.get(#endsGame, or: $value.endsGame),
      text: data.get(#text, or: $value.text),
      buttonText: data.get(#buttonText, or: $value.buttonText),
      cover: data.get(#cover, or: $value.cover),
      foreachPlayer: data.get(#foreachPlayer, or: $value.foreachPlayer),
      perTagText: data.get(#perTagText, or: $value.perTagText));

  @override
  NextButtonBlockCopyWith<$R2, NextButtonBlock, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _NextButtonBlockCopyWithImpl($value, $cast, t);
}

class TimerBlockMapper extends SubClassMapperBase<TimerBlock> {
  TimerBlockMapper._();

  static TimerBlockMapper? _instance;
  static TimerBlockMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = TimerBlockMapper._());
      BlockMapper.ensureInitialized().addSubMapper(_instance!);
    }
    return _instance!;
  }

  @override
  final String id = 'TimerBlock';

  static Duration _$minTimer(TimerBlock v) => v.minTimer;
  static const Field<TimerBlock, Duration> _f$minTimer =
      Field('minTimer', _$minTimer);
  static Duration _$maxTimer(TimerBlock v) => v.maxTimer;
  static const Field<TimerBlock, Duration> _f$maxTimer =
      Field('maxTimer', _$maxTimer);
  static String _$text(TimerBlock v) => v.text;
  static const Field<TimerBlock, String> _f$text = Field('text', _$text);
  static bool _$cover(TimerBlock v) => v.cover;
  static const Field<TimerBlock, bool> _f$cover =
      Field('cover', _$cover, opt: true, def: false);
  static bool _$foreachPlayer(TimerBlock v) => v.foreachPlayer;
  static const Field<TimerBlock, bool> _f$foreachPlayer =
      Field('foreachPlayer', _$foreachPlayer, opt: true, def: false);
  static Map<String, String> _$perTagText(TimerBlock v) => v.perTagText;
  static const Field<TimerBlock, Map<String, String>> _f$perTagText =
      Field('perTagText', _$perTagText, opt: true, def: const {});

  @override
  final MappableFields<TimerBlock> fields = const {
    #minTimer: _f$minTimer,
    #maxTimer: _f$maxTimer,
    #text: _f$text,
    #cover: _f$cover,
    #foreachPlayer: _f$foreachPlayer,
    #perTagText: _f$perTagText,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'TimerBlock';
  @override
  late final ClassMapperBase superMapper = BlockMapper.ensureInitialized();

  static TimerBlock _instantiate(DecodingData data) {
    return TimerBlock(
        minTimer: data.dec(_f$minTimer),
        maxTimer: data.dec(_f$maxTimer),
        text: data.dec(_f$text),
        cover: data.dec(_f$cover),
        foreachPlayer: data.dec(_f$foreachPlayer),
        perTagText: data.dec(_f$perTagText));
  }

  @override
  final Function instantiate = _instantiate;

  static TimerBlock fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<TimerBlock>(map);
  }

  static TimerBlock fromJson(String json) {
    return ensureInitialized().decodeJson<TimerBlock>(json);
  }
}

mixin TimerBlockMappable {
  String toJson() {
    return TimerBlockMapper.ensureInitialized()
        .encodeJson<TimerBlock>(this as TimerBlock);
  }

  Map<String, dynamic> toMap() {
    return TimerBlockMapper.ensureInitialized()
        .encodeMap<TimerBlock>(this as TimerBlock);
  }

  TimerBlockCopyWith<TimerBlock, TimerBlock, TimerBlock> get copyWith =>
      _TimerBlockCopyWithImpl(this as TimerBlock, $identity, $identity);
  @override
  String toString() {
    return TimerBlockMapper.ensureInitialized()
        .stringifyValue(this as TimerBlock);
  }

  @override
  bool operator ==(Object other) {
    return TimerBlockMapper.ensureInitialized()
        .equalsValue(this as TimerBlock, other);
  }

  @override
  int get hashCode {
    return TimerBlockMapper.ensureInitialized().hashValue(this as TimerBlock);
  }
}

extension TimerBlockValueCopy<$R, $Out>
    on ObjectCopyWith<$R, TimerBlock, $Out> {
  TimerBlockCopyWith<$R, TimerBlock, $Out> get $asTimerBlock =>
      $base.as((v, t, t2) => _TimerBlockCopyWithImpl(v, t, t2));
}

abstract class TimerBlockCopyWith<$R, $In extends TimerBlock, $Out>
    implements BlockCopyWith<$R, $In, $Out> {
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText;
  @override
  $R call(
      {Duration? minTimer,
      Duration? maxTimer,
      String? text,
      bool? cover,
      bool? foreachPlayer,
      Map<String, String>? perTagText});
  TimerBlockCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

class _TimerBlockCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, TimerBlock, $Out>
    implements TimerBlockCopyWith<$R, TimerBlock, $Out> {
  _TimerBlockCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<TimerBlock> $mapper =
      TimerBlockMapper.ensureInitialized();
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>>
      get perTagText => MapCopyWith(
          $value.perTagText,
          (v, t) => ObjectCopyWith(v, $identity, t),
          (v) => call(perTagText: v));
  @override
  $R call(
          {Duration? minTimer,
          Duration? maxTimer,
          String? text,
          bool? cover,
          bool? foreachPlayer,
          Map<String, String>? perTagText}) =>
      $apply(FieldCopyWithData({
        if (minTimer != null) #minTimer: minTimer,
        if (maxTimer != null) #maxTimer: maxTimer,
        if (text != null) #text: text,
        if (cover != null) #cover: cover,
        if (foreachPlayer != null) #foreachPlayer: foreachPlayer,
        if (perTagText != null) #perTagText: perTagText
      }));
  @override
  TimerBlock $make(CopyWithData data) => TimerBlock(
      minTimer: data.get(#minTimer, or: $value.minTimer),
      maxTimer: data.get(#maxTimer, or: $value.maxTimer),
      text: data.get(#text, or: $value.text),
      cover: data.get(#cover, or: $value.cover),
      foreachPlayer: data.get(#foreachPlayer, or: $value.foreachPlayer),
      perTagText: data.get(#perTagText, or: $value.perTagText));

  @override
  TimerBlockCopyWith<$R2, TimerBlock, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _TimerBlockCopyWithImpl($value, $cast, t);
}

class VotingBlockMapper extends SubClassMapperBase<VotingBlock> {
  VotingBlockMapper._();

  static VotingBlockMapper? _instance;
  static VotingBlockMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = VotingBlockMapper._());
      BlockMapper.ensureInitialized().addSubMapper(_instance!);
      PlayerVotingBlockMapper.ensureInitialized();
      TagsMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'VotingBlock';

  static int _$minMultiselect(VotingBlock v) => v.minMultiselect;
  static const Field<VotingBlock, int> _f$minMultiselect =
      Field('minMultiselect', _$minMultiselect, opt: true, def: 1);
  static int _$maxMultiselect(VotingBlock v) => v.maxMultiselect;
  static const Field<VotingBlock, int> _f$maxMultiselect =
      Field('maxMultiselect', _$maxMultiselect, opt: true, def: 1);
  static Tags _$setTags(VotingBlock v) => v.setTags;
  static const Field<VotingBlock, Tags> _f$setTags =
      Field('setTags', _$setTags);
  static String _$text(VotingBlock v) => v.text;
  static const Field<VotingBlock, String> _f$text = Field('text', _$text);
  static bool _$cover(VotingBlock v) => v.cover;
  static const Field<VotingBlock, bool> _f$cover =
      Field('cover', _$cover, opt: true, def: false);
  static bool _$foreachPlayer(VotingBlock v) => v.foreachPlayer;
  static const Field<VotingBlock, bool> _f$foreachPlayer =
      Field('foreachPlayer', _$foreachPlayer, opt: true, def: false);
  static Map<String, String> _$perTagText(VotingBlock v) => v.perTagText;
  static const Field<VotingBlock, Map<String, String>> _f$perTagText =
      Field('perTagText', _$perTagText, opt: true, def: const {});

  @override
  final MappableFields<VotingBlock> fields = const {
    #minMultiselect: _f$minMultiselect,
    #maxMultiselect: _f$maxMultiselect,
    #setTags: _f$setTags,
    #text: _f$text,
    #cover: _f$cover,
    #foreachPlayer: _f$foreachPlayer,
    #perTagText: _f$perTagText,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'VotingBlock';
  @override
  late final ClassMapperBase superMapper = BlockMapper.ensureInitialized();

  static VotingBlock _instantiate(DecodingData data) {
    throw MapperException.missingSubclass(
        'VotingBlock', 'type', '${data.value['type']}');
  }

  @override
  final Function instantiate = _instantiate;

  static VotingBlock fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<VotingBlock>(map);
  }

  static VotingBlock fromJson(String json) {
    return ensureInitialized().decodeJson<VotingBlock>(json);
  }
}

mixin VotingBlockMappable {
  String toJson();
  Map<String, dynamic> toMap();
  VotingBlockCopyWith<VotingBlock, VotingBlock, VotingBlock> get copyWith;
}

abstract class VotingBlockCopyWith<$R, $In extends VotingBlock, $Out>
    implements BlockCopyWith<$R, $In, $Out> {
  TagsCopyWith<$R, Tags, Tags> get setTags;
  @override
  MapCopyWith<$R, String, String, ObjectCopyWith<$R, String, String>?>
      get perTagText;
  @override
  $R call(
      {int? minMultiselect,
      int? maxMultiselect,
      Tags? setTags,
      String? text,
      bool? cover,
      bool? foreachPlayer,
      Map<String, String>? perTagText});
  VotingBlockCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(Then<$Out2, $R2> t);
}

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
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'PlayerVotingBlock';
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
        perTagText: data.dec(_f$perTagText));
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
      get copyWith => _PlayerVotingBlockCopyWithImpl(
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
      get $asPlayerVotingBlock =>
          $base.as((v, t, t2) => _PlayerVotingBlockCopyWithImpl(v, t, t2));
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
      Map<String, String>? perTagText});
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
          Map<String, String>? perTagText}) =>
      $apply(FieldCopyWithData({
        if (votingTargetPossibilities != null)
          #votingTargetPossibilities: votingTargetPossibilities,
        if (minMultiselect != null) #minMultiselect: minMultiselect,
        if (maxMultiselect != null) #maxMultiselect: maxMultiselect,
        if (setTags != null) #setTags: setTags,
        if (text != null) #text: text,
        if (cover != null) #cover: cover,
        if (foreachPlayer != null) #foreachPlayer: foreachPlayer,
        if (perTagText != null) #perTagText: perTagText
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
      perTagText: data.get(#perTagText, or: $value.perTagText));

  @override
  PlayerVotingBlockCopyWith<$R2, PlayerVotingBlock, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _PlayerVotingBlockCopyWithImpl($value, $cast, t);
}

class ChangeTagBlockMapper extends SubClassMapperBase<ChangeTagBlock> {
  ChangeTagBlockMapper._();

  static ChangeTagBlockMapper? _instance;
  static ChangeTagBlockMapper ensureInitialized() {
    if (_instance == null) {
      MapperContainer.globals.use(_instance = ChangeTagBlockMapper._());
      BlockMapper.ensureInitialized().addSubMapper(_instance!);
      TagFilterMapper.ensureInitialized();
      TagMapper.ensureInitialized();
    }
    return _instance!;
  }

  @override
  final String id = 'ChangeTagBlock';

  static String _$text(ChangeTagBlock v) => v.text;
  static const Field<ChangeTagBlock, String> _f$text =
      Field('text', _$text, opt: true, def: "");
  static TagFilter? _$affectedPlayers(ChangeTagBlock v) => v.affectedPlayers;
  static const Field<ChangeTagBlock, TagFilter> _f$affectedPlayers =
      Field('affectedPlayers', _$affectedPlayers, opt: true);
  static List<Tag> _$tags(ChangeTagBlock v) => v.tags;
  static const Field<ChangeTagBlock, List<Tag>> _f$tags = Field('tags', _$tags);
  static bool _$remove(ChangeTagBlock v) => v.remove;
  static const Field<ChangeTagBlock, bool> _f$remove =
      Field('remove', _$remove, opt: true, def: false);
  static bool _$cover(ChangeTagBlock v) => v.cover;
  static const Field<ChangeTagBlock, bool> _f$cover =
      Field('cover', _$cover, mode: FieldMode.member);
  static bool _$foreachPlayer(ChangeTagBlock v) => v.foreachPlayer;
  static const Field<ChangeTagBlock, bool> _f$foreachPlayer =
      Field('foreachPlayer', _$foreachPlayer, mode: FieldMode.member);
  static Map<String, String> _$perTagText(ChangeTagBlock v) => v.perTagText;
  static const Field<ChangeTagBlock, Map<String, String>> _f$perTagText =
      Field('perTagText', _$perTagText, mode: FieldMode.member);

  @override
  final MappableFields<ChangeTagBlock> fields = const {
    #text: _f$text,
    #affectedPlayers: _f$affectedPlayers,
    #tags: _f$tags,
    #remove: _f$remove,
    #cover: _f$cover,
    #foreachPlayer: _f$foreachPlayer,
    #perTagText: _f$perTagText,
  };

  @override
  final String discriminatorKey = 'type';
  @override
  final dynamic discriminatorValue = 'ChangeTagBlock';
  @override
  late final ClassMapperBase superMapper = BlockMapper.ensureInitialized();

  static ChangeTagBlock _instantiate(DecodingData data) {
    return ChangeTagBlock(
        text: data.dec(_f$text),
        affectedPlayers: data.dec(_f$affectedPlayers),
        tags: data.dec(_f$tags),
        remove: data.dec(_f$remove));
  }

  @override
  final Function instantiate = _instantiate;

  static ChangeTagBlock fromMap(Map<String, dynamic> map) {
    return ensureInitialized().decodeMap<ChangeTagBlock>(map);
  }

  static ChangeTagBlock fromJson(String json) {
    return ensureInitialized().decodeJson<ChangeTagBlock>(json);
  }
}

mixin ChangeTagBlockMappable {
  String toJson() {
    return ChangeTagBlockMapper.ensureInitialized()
        .encodeJson<ChangeTagBlock>(this as ChangeTagBlock);
  }

  Map<String, dynamic> toMap() {
    return ChangeTagBlockMapper.ensureInitialized()
        .encodeMap<ChangeTagBlock>(this as ChangeTagBlock);
  }

  ChangeTagBlockCopyWith<ChangeTagBlock, ChangeTagBlock, ChangeTagBlock>
      get copyWith => _ChangeTagBlockCopyWithImpl(
          this as ChangeTagBlock, $identity, $identity);
  @override
  String toString() {
    return ChangeTagBlockMapper.ensureInitialized()
        .stringifyValue(this as ChangeTagBlock);
  }

  @override
  bool operator ==(Object other) {
    return ChangeTagBlockMapper.ensureInitialized()
        .equalsValue(this as ChangeTagBlock, other);
  }

  @override
  int get hashCode {
    return ChangeTagBlockMapper.ensureInitialized()
        .hashValue(this as ChangeTagBlock);
  }
}

extension ChangeTagBlockValueCopy<$R, $Out>
    on ObjectCopyWith<$R, ChangeTagBlock, $Out> {
  ChangeTagBlockCopyWith<$R, ChangeTagBlock, $Out> get $asChangeTagBlock =>
      $base.as((v, t, t2) => _ChangeTagBlockCopyWithImpl(v, t, t2));
}

abstract class ChangeTagBlockCopyWith<$R, $In extends ChangeTagBlock, $Out>
    implements BlockCopyWith<$R, $In, $Out> {
  TagFilterCopyWith<$R, TagFilter, TagFilter>? get affectedPlayers;
  ListCopyWith<$R, Tag, TagCopyWith<$R, Tag, Tag>> get tags;
  @override
  $R call(
      {String? text,
      TagFilter? affectedPlayers,
      List<Tag>? tags,
      bool? remove});
  ChangeTagBlockCopyWith<$R2, $In, $Out2> $chain<$R2, $Out2>(
      Then<$Out2, $R2> t);
}

class _ChangeTagBlockCopyWithImpl<$R, $Out>
    extends ClassCopyWithBase<$R, ChangeTagBlock, $Out>
    implements ChangeTagBlockCopyWith<$R, ChangeTagBlock, $Out> {
  _ChangeTagBlockCopyWithImpl(super.value, super.then, super.then2);

  @override
  late final ClassMapperBase<ChangeTagBlock> $mapper =
      ChangeTagBlockMapper.ensureInitialized();
  @override
  TagFilterCopyWith<$R, TagFilter, TagFilter>? get affectedPlayers =>
      $value.affectedPlayers?.copyWith.$chain((v) => call(affectedPlayers: v));
  @override
  ListCopyWith<$R, Tag, TagCopyWith<$R, Tag, Tag>> get tags => ListCopyWith(
      $value.tags, (v, t) => v.copyWith.$chain(t), (v) => call(tags: v));
  @override
  $R call(
          {String? text,
          Object? affectedPlayers = $none,
          List<Tag>? tags,
          bool? remove}) =>
      $apply(FieldCopyWithData({
        if (text != null) #text: text,
        if (affectedPlayers != $none) #affectedPlayers: affectedPlayers,
        if (tags != null) #tags: tags,
        if (remove != null) #remove: remove
      }));
  @override
  ChangeTagBlock $make(CopyWithData data) => ChangeTagBlock(
      text: data.get(#text, or: $value.text),
      affectedPlayers: data.get(#affectedPlayers, or: $value.affectedPlayers),
      tags: data.get(#tags, or: $value.tags),
      remove: data.get(#remove, or: $value.remove));

  @override
  ChangeTagBlockCopyWith<$R2, ChangeTagBlock, $Out2> $chain<$R2, $Out2>(
          Then<$Out2, $R2> t) =>
      _ChangeTagBlockCopyWithImpl($value, $cast, t);
}
