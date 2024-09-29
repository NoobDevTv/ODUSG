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
String _$nextPlayerHash() => r'cc35a31046b60c018fc5d6b0f02e589afaeaee50';

/// See also [nextPlayer].
@ProviderFor(nextPlayer)
final nextPlayerProvider = AutoDisposeProvider<Player?>.internal(
  nextPlayer,
  name: r'nextPlayerProvider',
  debugGetCreateSourceHash:
      const bool.fromEnvironment('dart.vm.product') ? null : _$nextPlayerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef NextPlayerRef = AutoDisposeProviderRef<Player?>;
String _$tickerHash() => r'0a483a64d1e7362cdc0682298af3af08c8664f7a';

/// Copied from Dart SDK
class _SystemHash {
  _SystemHash._();

  static int combine(int hash, int value) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + value);
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x0007ffff & hash) << 10));
    return hash ^ (hash >> 6);
  }

  static int finish(int hash) {
    // ignore: parameter_assignments
    hash = 0x1fffffff & (hash + ((0x03ffffff & hash) << 3));
    // ignore: parameter_assignments
    hash = hash ^ (hash >> 11);
    return 0x1fffffff & (hash + ((0x00003fff & hash) << 15));
  }
}

/// See also [ticker].
@ProviderFor(ticker)
const tickerProvider = TickerFamily();

/// See also [ticker].
class TickerFamily extends Family<AsyncValue<int>> {
  /// See also [ticker].
  const TickerFamily();

  /// See also [ticker].
  TickerProvider call(
    Duration period,
    Duration duration,
  ) {
    return TickerProvider(
      period,
      duration,
    );
  }

  @override
  TickerProvider getProviderOverride(
    covariant TickerProvider provider,
  ) {
    return call(
      provider.period,
      provider.duration,
    );
  }

  static const Iterable<ProviderOrFamily>? _dependencies = null;

  @override
  Iterable<ProviderOrFamily>? get dependencies => _dependencies;

  static const Iterable<ProviderOrFamily>? _allTransitiveDependencies = null;

  @override
  Iterable<ProviderOrFamily>? get allTransitiveDependencies =>
      _allTransitiveDependencies;

  @override
  String? get name => r'tickerProvider';
}

/// See also [ticker].
class TickerProvider extends AutoDisposeStreamProvider<int> {
  /// See also [ticker].
  TickerProvider(
    Duration period,
    Duration duration,
  ) : this._internal(
          (ref) => ticker(
            ref as TickerRef,
            period,
            duration,
          ),
          from: tickerProvider,
          name: r'tickerProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$tickerHash,
          dependencies: TickerFamily._dependencies,
          allTransitiveDependencies: TickerFamily._allTransitiveDependencies,
          period: period,
          duration: duration,
        );

  TickerProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.period,
    required this.duration,
  }) : super.internal();

  final Duration period;
  final Duration duration;

  @override
  Override overrideWith(
    Stream<int> Function(TickerRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: TickerProvider._internal(
        (ref) => create(ref as TickerRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        period: period,
        duration: duration,
      ),
    );
  }

  @override
  AutoDisposeStreamProviderElement<int> createElement() {
    return _TickerProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is TickerProvider &&
        other.period == period &&
        other.duration == duration;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, period.hashCode);
    hash = _SystemHash.combine(hash, duration.hashCode);

    return _SystemHash.finish(hash);
  }
}

mixin TickerRef on AutoDisposeStreamProviderRef<int> {
  /// The parameter `period` of this provider.
  Duration get period;

  /// The parameter `duration` of this provider.
  Duration get duration;
}

class _TickerProviderElement extends AutoDisposeStreamProviderElement<int>
    with TickerRef {
  _TickerProviderElement(super.provider);

  @override
  Duration get period => (origin as TickerProvider).period;
  @override
  Duration get duration => (origin as TickerProvider).duration;
}

String _$playerManagerHash() => r'72668bde34044497d81e1091ad16699d6a3dc73a';

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
String _$gameStateMachineHash() => r'abf7b0c3672c17cb9567b4d11d6981a6bf02adb3';

/// See also [GameStateMachine].
@ProviderFor(GameStateMachine)
final gameStateMachineProvider =
    AutoDisposeNotifierProvider<GameStateMachine, GameState>.internal(
  GameStateMachine.new,
  name: r'gameStateMachineProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$gameStateMachineHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$GameStateMachine = AutoDisposeNotifier<GameState>;
String _$votingManagerHash() => r'707a6f13fea7a692df9db2aa4ed198321d51db26';

/// See also [VotingManager].
@ProviderFor(VotingManager)
final votingManagerProvider =
    AutoDisposeNotifierProvider<VotingManager, Map<Player, int>>.internal(
  VotingManager.new,
  name: r'votingManagerProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$votingManagerHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$VotingManager = AutoDisposeNotifier<Map<Player, int>>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member
