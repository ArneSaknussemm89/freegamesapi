// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$fetchOneGameHash() => r'fe459293ca7494472dfc16511a4ee2fc0db25fd0';

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

/// See also [fetchOneGame].
@ProviderFor(fetchOneGame)
const fetchOneGameProvider = FetchOneGameFamily();

/// See also [fetchOneGame].
class FetchOneGameFamily extends Family<AsyncValue<Game?>> {
  /// See also [fetchOneGame].
  const FetchOneGameFamily();

  /// See also [fetchOneGame].
  FetchOneGameProvider call({
    required int id,
    bool checkFavorite = false,
  }) {
    return FetchOneGameProvider(
      id: id,
      checkFavorite: checkFavorite,
    );
  }

  @override
  FetchOneGameProvider getProviderOverride(
    covariant FetchOneGameProvider provider,
  ) {
    return call(
      id: provider.id,
      checkFavorite: provider.checkFavorite,
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
  String? get name => r'fetchOneGameProvider';
}

/// See also [fetchOneGame].
class FetchOneGameProvider extends AutoDisposeFutureProvider<Game?> {
  /// See also [fetchOneGame].
  FetchOneGameProvider({
    required int id,
    bool checkFavorite = false,
  }) : this._internal(
          (ref) => fetchOneGame(
            ref as FetchOneGameRef,
            id: id,
            checkFavorite: checkFavorite,
          ),
          from: fetchOneGameProvider,
          name: r'fetchOneGameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchOneGameHash,
          dependencies: FetchOneGameFamily._dependencies,
          allTransitiveDependencies:
              FetchOneGameFamily._allTransitiveDependencies,
          id: id,
          checkFavorite: checkFavorite,
        );

  FetchOneGameProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
    required this.checkFavorite,
  }) : super.internal();

  final int id;
  final bool checkFavorite;

  @override
  Override overrideWith(
    FutureOr<Game?> Function(FetchOneGameRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchOneGameProvider._internal(
        (ref) => create(ref as FetchOneGameRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
        checkFavorite: checkFavorite,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<Game?> createElement() {
    return _FetchOneGameProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchOneGameProvider &&
        other.id == id &&
        other.checkFavorite == checkFavorite;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);
    hash = _SystemHash.combine(hash, checkFavorite.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchOneGameRef on AutoDisposeFutureProviderRef<Game?> {
  /// The parameter `id` of this provider.
  int get id;

  /// The parameter `checkFavorite` of this provider.
  bool get checkFavorite;
}

class _FetchOneGameProviderElement
    extends AutoDisposeFutureProviderElement<Game?> with FetchOneGameRef {
  _FetchOneGameProviderElement(super.provider);

  @override
  int get id => (origin as FetchOneGameProvider).id;
  @override
  bool get checkFavorite => (origin as FetchOneGameProvider).checkFavorite;
}

String _$fetchOneFavoriteHash() => r'61ef606bbd20065c14ba14daac3130c8677649d2';

/// See also [fetchOneFavorite].
@ProviderFor(fetchOneFavorite)
const fetchOneFavoriteProvider = FetchOneFavoriteFamily();

/// See also [fetchOneFavorite].
class FetchOneFavoriteFamily extends Family<AsyncValue<FavoriteGame?>> {
  /// See also [fetchOneFavorite].
  const FetchOneFavoriteFamily();

  /// See also [fetchOneFavorite].
  FetchOneFavoriteProvider call({
    required int id,
  }) {
    return FetchOneFavoriteProvider(
      id: id,
    );
  }

  @override
  FetchOneFavoriteProvider getProviderOverride(
    covariant FetchOneFavoriteProvider provider,
  ) {
    return call(
      id: provider.id,
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
  String? get name => r'fetchOneFavoriteProvider';
}

/// See also [fetchOneFavorite].
class FetchOneFavoriteProvider
    extends AutoDisposeFutureProvider<FavoriteGame?> {
  /// See also [fetchOneFavorite].
  FetchOneFavoriteProvider({
    required int id,
  }) : this._internal(
          (ref) => fetchOneFavorite(
            ref as FetchOneFavoriteRef,
            id: id,
          ),
          from: fetchOneFavoriteProvider,
          name: r'fetchOneFavoriteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : _$fetchOneFavoriteHash,
          dependencies: FetchOneFavoriteFamily._dependencies,
          allTransitiveDependencies:
              FetchOneFavoriteFamily._allTransitiveDependencies,
          id: id,
        );

  FetchOneFavoriteProvider._internal(
    super._createNotifier, {
    required super.name,
    required super.dependencies,
    required super.allTransitiveDependencies,
    required super.debugGetCreateSourceHash,
    required super.from,
    required this.id,
  }) : super.internal();

  final int id;

  @override
  Override overrideWith(
    FutureOr<FavoriteGame?> Function(FetchOneFavoriteRef provider) create,
  ) {
    return ProviderOverride(
      origin: this,
      override: FetchOneFavoriteProvider._internal(
        (ref) => create(ref as FetchOneFavoriteRef),
        from: from,
        name: null,
        dependencies: null,
        allTransitiveDependencies: null,
        debugGetCreateSourceHash: null,
        id: id,
      ),
    );
  }

  @override
  AutoDisposeFutureProviderElement<FavoriteGame?> createElement() {
    return _FetchOneFavoriteProviderElement(this);
  }

  @override
  bool operator ==(Object other) {
    return other is FetchOneFavoriteProvider && other.id == id;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, id.hashCode);

    return _SystemHash.finish(hash);
  }
}

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
mixin FetchOneFavoriteRef on AutoDisposeFutureProviderRef<FavoriteGame?> {
  /// The parameter `id` of this provider.
  int get id;
}

class _FetchOneFavoriteProviderElement
    extends AutoDisposeFutureProviderElement<FavoriteGame?>
    with FetchOneFavoriteRef {
  _FetchOneFavoriteProviderElement(super.provider);

  @override
  int get id => (origin as FetchOneFavoriteProvider).id;
}
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
