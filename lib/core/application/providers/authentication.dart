import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Core elements.
import 'package:freegamesexample/core/application/services/firebase_auth.dart';
import 'package:freegamesexample/core/application/use_cases/create_firestore_user.dart';

part 'authentication.freezed.dart';
part 'authentication.g.dart';

@riverpod
Stream<User?> authStateChanges(AuthStateChangesRef ref) {
  final auth = ref.watch(firebaseAuthProvider);
  return auth.authStateChanges();
}

// A simple graph bloc that keeps track of auth state changes and updates the state of
// this bloc accordingly.
@riverpod
class AuthenticationService extends _$AuthenticationService {
  AuthenticationService({
    required this.auth,
    required this.createFirestoreAppUserUseCase,
  });

  @override
  AuthenticationState build() {
    ref.watch(authStateChangesProvider);
    if (auth.currentUser != null) {
      createFirestoreAppUserUseCase(auth.currentUser!.toCreateFirestoreAppUserUseCaseParams);
      return AuthenticationState.authenticated(auth.currentUser!);
    } else {
      return const AuthenticationState.unauthenticated();
    }
  }

  final FirebaseAuth auth;
  final CreateFirestoreAppUserUseCase createFirestoreAppUserUseCase;
}

@freezed
class AuthenticationEvent with _$AuthenticationEvent {
  const factory AuthenticationEvent.signInWithPhoneNumber() = SignInWithPhoneNumber;
  const factory AuthenticationEvent.authenticate(User user) = Authenticate;
  const factory AuthenticationEvent.unauthenticate() = Unauthenticate;
}

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState.uninitialized() = Uninitialized;
  const factory AuthenticationState.unauthenticated() = Unauthenticated;
  const factory AuthenticationState.authenticated(User user) = Authenticated;
}
