// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'filtered_games_list.dart';

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

String $FilteredGamesListHash() => r'25a296a7efa374a73703c6107c7002b0cdd78eab';

/// See also [FilteredGamesList].
class FilteredGamesListProvider extends AutoDisposeNotifierProviderImpl<
    FilteredGamesList, AsyncValue<List<Game>>> {
  FilteredGamesListProvider({
    required this.filter,
  }) : super(
          () => FilteredGamesList()..filter = filter,
          from: filteredGamesListProvider,
          name: r'filteredGamesListProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $FilteredGamesListHash,
        );

  final GamesListFilter filter;

  @override
  bool operator ==(Object other) {
    return other is FilteredGamesListProvider && other.filter == filter;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, filter.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  AsyncValue<List<Game>> runNotifierBuild(
    covariant _$FilteredGamesList notifier,
  ) {
    return notifier.build(
      filter: filter,
    );
  }
}

typedef FilteredGamesListRef
    = AutoDisposeNotifierProviderRef<AsyncValue<List<Game>>>;

/// See also [FilteredGamesList].
final filteredGamesListProvider = FilteredGamesListFamily();

class FilteredGamesListFamily extends Family<AsyncValue<List<Game>>> {
  FilteredGamesListFamily();

  FilteredGamesListProvider call({
    required GamesListFilter filter,
  }) {
    return FilteredGamesListProvider(
      filter: filter,
    );
  }

  @override
  AutoDisposeNotifierProviderImpl<FilteredGamesList, AsyncValue<List<Game>>>
      getProviderOverride(
    covariant FilteredGamesListProvider provider,
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
  String? get name => r'filteredGamesListProvider';
}

abstract class _$FilteredGamesList
    extends BuildlessAutoDisposeNotifier<AsyncValue<List<Game>>> {
  late final GamesListFilter filter;

  AsyncValue<List<Game>> build({
    required GamesListFilter filter,
  });
}
