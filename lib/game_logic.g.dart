// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game_logic.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$randomHash() => r'703ce29aaaeb1a0e472789bfe8afab80351a815e';

/// See also [random].
@ProviderFor(random)
final randomProvider = Provider<Random>.internal(
  random,
  name: r'randomProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$randomHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef RandomRef = ProviderRef<Random>;
String _$eventManagerHash() => r'64dd6b6d3f4968ba4e68b797f60e776e1ff0d179';

/// See also [EventManager].
@ProviderFor(EventManager)
final eventManagerProvider =
    AutoDisposeNotifierProvider<EventManager, int>.internal(
  EventManager.new,
  name: r'eventManagerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$eventManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$EventManager = AutoDisposeNotifier<int>;
String _$playerManagerHash() => r'12d5cbd1688b3c6b99476bc12329d77d56279130';

/// See also [PlayerManager].
@ProviderFor(PlayerManager)
final playerManagerProvider =
    AutoDisposeNotifierProvider<PlayerManager, List<Player>>.internal(
  PlayerManager.new,
  name: r'playerManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$playerManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$PlayerManager = AutoDisposeNotifier<List<Player>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
