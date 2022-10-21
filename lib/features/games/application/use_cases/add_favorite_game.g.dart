// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_favorite_game.dart';

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

String $AddFavoriteGameUseCaseHash() =>
    r'0b5c723fc8601b7c16876c5a89f65514501f06e0';

/// See also [AddFavoriteGameUseCase].
class AddFavoriteGameUseCaseProvider
    extends AutoDisposeAsyncNotifierProviderImpl<AddFavoriteGameUseCase,
        UseCaseResult<Exception, Void>> {
  AddFavoriteGameUseCaseProvider(
    this.params,
  ) : super(
          () => AddFavoriteGameUseCase()..params = params,
          from: addFavoriteGameUseCaseProvider,
          name: r'addFavoriteGameUseCaseProvider',
          debugGetCreateSourceHash:
              const bool.fromEnvironment('dart.vm.product')
                  ? null
                  : $AddFavoriteGameUseCaseHash,
        );

  final AddFavoriteGameUseCaseParams params;

  @override
  bool operator ==(Object other) {
    return other is AddFavoriteGameUseCaseProvider && other.params == params;
  }

  @override
  int get hashCode {
    var hash = _SystemHash.combine(0, runtimeType.hashCode);
    hash = _SystemHash.combine(hash, params.hashCode);

    return _SystemHash.finish(hash);
  }

  @override
  FutureOr<UseCaseResult<Exception, Void>> runNotifierBuild(
    covariant _$AddFavoriteGameUseCase notifier,
  ) {
    return notifier.build(
      params,
    );
  }
}

typedef AddFavoriteGameUseCaseRef
    = AutoDisposeAsyncNotifierProviderRef<UseCaseResult<Exception, Void>>;

/// See also [AddFavoriteGameUseCase].
final addFavoriteGameUseCaseProvider = AddFavoriteGameUseCaseFamily();

class AddFavoriteGameUseCaseFamily
    extends Family<AsyncValue<UseCaseResult<Exception, Void>>> {
  AddFavoriteGameUseCaseFamily();

  AddFavoriteGameUseCaseProvider call(
    AddFavoriteGameUseCaseParams params,
  ) {
    return AddFavoriteGameUseCaseProvider(
      params,
    );
  }

  @override
  AutoDisposeAsyncNotifierProviderImpl<AddFavoriteGameUseCase,
      UseCaseResult<Exception, Void>> getProviderOverride(
    covariant AddFavoriteGameUseCaseProvider provider,
  ) {
    return call(
      provider.params,
    );
  }

  @override
  List<ProviderOrFamily>? get allTransitiveDependencies => null;

  @override
  List<ProviderOrFamily>? get dependencies => null;

  @override
  String? get name => r'addFavoriteGameUseCaseProvider';
}

abstract class _$AddFavoriteGameUseCase
    extends BuildlessAutoDisposeAsyncNotifier<UseCaseResult<Exception, Void>> {
  late final AddFavoriteGameUseCaseParams params;

  FutureOr<UseCaseResult<Exception, Void>> build(
    AddFavoriteGameUseCaseParams params,
  );
}
