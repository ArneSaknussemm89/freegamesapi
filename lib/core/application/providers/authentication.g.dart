// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication.dart';

// **************************************************************************
// RiverpodGenerator
// **************************************************************************

String _$authStateChangesHash() => r'5f8861723c359af3f00d0995225ba1df8c413368';

/// See also [authStateChanges].
@ProviderFor(authStateChanges)
final authStateChangesProvider = AutoDisposeStreamProvider<User?>.internal(
  authStateChanges,
  name: r'authStateChangesProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authStateChangesHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

@Deprecated('Will be removed in 3.0. Use Ref instead')
// ignore: unused_element
typedef AuthStateChangesRef = AutoDisposeStreamProviderRef<User?>;
String _$authenticationServiceHash() =>
    r'aae251e378c131a06557058166904acc2f92cb32';

/// See also [AuthenticationService].
@ProviderFor(AuthenticationService)
final authenticationServiceProvider = AutoDisposeNotifierProvider<
    AuthenticationService, AuthenticationState>.internal(
  AuthenticationService.new,
  name: r'authenticationServiceProvider',
  debugGetCreateSourceHash: const bool.fromEnvironment('dart.vm.product')
      ? null
      : _$authenticationServiceHash,
  dependencies: null,
  allTransitiveDependencies: null,
);

typedef _$AuthenticationService = AutoDisposeNotifier<AuthenticationState>;
// ignore_for_file: type=lint
// ignore_for_file: subtype_of_sealed_class, invalid_use_of_internal_member, invalid_use_of_visible_for_testing_member, deprecated_member_use_from_same_package
