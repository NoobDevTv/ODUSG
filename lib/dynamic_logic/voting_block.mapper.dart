// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, unnecessary_cast, override_on_non_overriding_member
// ignore_for_file: strict_raw_type, inference_failure_on_untyped_parameter

part of 'voting_block.dart';

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
