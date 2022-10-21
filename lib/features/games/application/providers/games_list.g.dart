// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'games_list.dart';

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

String $fetchGamesListHash() => r'af486042ef1a210b69a0f09fcfbcf3cb66282d2a';

/// See also [fetchGamesList].
class FetchGamesListProvider
    extends AutoDisposeFutureProvider<UseCaseResult<Object?, List<Game>>> {
  FetchGamesListProvider({
    required this.filter,
  }) : super(
          (ref) => fetchGamesList(
            ref,
            filter: filter,
          ),
          from: fetchGamesListProvider,
          name: r'fetchGamesListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $fetchGamesListHash,
        );

  final GamesListFilter filter;

  @override
  bool operator ==(Object other) {
    return other is FetchGamesListProvider && other.filter == filter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);

    return _SystemHash.finish(hash);
  }
}

typedef FetchGamesListRef
    = AutoDisposeFutureProviderRef<UseCaseResult<Object?, List<Game>>>;

/// See also [fetchGamesList].
final fetchGamesListProvider = FetchGamesListFamily();

class FetchGamesListFamily
    extends Family<AsyncValue<UseCaseResult<Object?, List<Game>>>> {
  FetchGamesListFamily();

  FetchGamesListProvider call({
    required GamesListFilter filter,
  }) {
    return FetchGamesListProvider(
      filter: filter,
    );
  }

  @override
  AutoDisposeFutureProvider<UseCaseResult<Object?, List<Game>>>
      getProviderOverride(
    covariant FetchGamesListProvider provider,
  ) {
    return call(
      filter: provider.filter,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'fetchGamesListProvider';
}
