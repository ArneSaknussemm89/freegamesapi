// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

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

String $AuthenticationServiceHash() =>
    r'4e06243c1fef73abb33d17d5ec08d82127351143';

/// See also [AuthenticationService].
final authenticationServiceProvider =
    AutoDisposeNotifierProvider<AuthenticationService, AuthenticationState>(
  AuthenticationService.new,
  name: r'authenticationServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $AuthenticationServiceHash,
);
typedef AuthenticationServiceRef
    = AutoDisposeNotifierProviderRef<AuthenticationState>;

abstract class _$AuthenticationService
    extends AutoDisposeNotifier<AuthenticationState> {
  @override
  AuthenticationState build();
}

String $authStateChangesHash() => r'386ea079ca75ac54d471519e1565d88b5c2efc08';

/// See also [authStateChanges].
final authStateChangesProvider = AutoDisposeProvider<Stream<User?>>(
  authStateChanges,
  name: r'authStateChangesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : $authStateChangesHash,
);
typedef AuthStateChangesRef = AutoDisposeProviderRef<Stream<User?>>;
