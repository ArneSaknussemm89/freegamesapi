// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

// ignore_for_file: avoid_private_typedef_functions, non_constant_identifier_names, subtype_of_sealed_class, invalid_use_of_internal_member, unused_element, constant_identifier_names, unnecessary_raw_strings, library_private_types_in_public_api

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

String $fetchOneGameHash() => r'243f6e03d5724fea7f4c32adba35560ccbd8a7c6';

/// See also [fetchOneGame].
class FetchOneGameProvider extends AutoDisposeFutureProvider<Game?> {
  FetchOneGameProvider({
    required this.id,
    this.checkFavorite = false,
  }) : super(
          (ref) => fetchOneGame(
            ref,
            id: id,
            checkFavorite: checkFavorite,
          ),
          from: fetchOneGameProvider,
          name: r'fetchOneGameProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $fetchOneGameHash,
        );

  final int id;
  final bool checkFavorite;

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

typedef FetchOneGameRef = AutoDisposeFutureProviderRef<Game?>;

/// See also [fetchOneGame].
final fetchOneGameProvider = FetchOneGameFamily();

class FetchOneGameFamily extends Family<AsyncValue<Game?>> {
  FetchOneGameFamily();

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
  AutoDisposeFutureProvider<Game?> getProviderOverride(
    covariant FetchOneGameProvider provider,
  ) {
    return call(
      id: provider.id,
      checkFavorite: provider.checkFavorite,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'fetchOneGameProvider';
}

String $fetchOneFavoriteHash() => r'a987e6b17a9d91689af958ac43c3f334b2266a51';

/// See also [fetchOneFavorite].
class FetchOneFavoriteProvider
    extends AutoDisposeFutureProvider<FavoriteGame?> {
  FetchOneFavoriteProvider({
    required this.id,
  }) : super(
          (ref) => fetchOneFavorite(
            ref,
            id: id,
          ),
          from: fetchOneFavoriteProvider,
          name: r'fetchOneFavoriteProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $fetchOneFavoriteHash,
        );

  final int id;

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

typedef FetchOneFavoriteRef = AutoDisposeFutureProviderRef<FavoriteGame?>;

/// See also [fetchOneFavorite].
final fetchOneFavoriteProvider = FetchOneFavoriteFamily();

class FetchOneFavoriteFamily extends Family<AsyncValue<FavoriteGame?>> {
  FetchOneFavoriteFamily();

  FetchOneFavoriteProvider call({
    required int id,
  }) {
    return FetchOneFavoriteProvider(
      id: id,
    );
  }

  @override
  AutoDisposeFutureProvider<FavoriteGame?> getProviderOverride(
    covariant FetchOneFavoriteProvider provider,
  ) {
    return call(
      id: provider.id,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'fetchOneFavoriteProvider';
}
