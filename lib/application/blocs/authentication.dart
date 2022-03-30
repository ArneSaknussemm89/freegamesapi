import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:freegamesexample/application/services/firebase_auth.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graph_bloc/graph_bloc.dart';
import 'package:riverbloc/riverbloc.dart';

import 'package:freegamesexample/application/use_cases/create_firestore_user.dart';

part 'authentication.freezed.dart';

final authenticationBlocProvider = BlocProvider.autoDispose<AuthenticationBloc, AuthenticationState>((ref) {
  final auth = ref.watch(firebaseAuthProvider);
  final createFirestoreAppUserUseCase = ref.watch(createFirestoreAppUserUseCaseProvider);
  return AuthenticationBloc(auth: auth, createFirestoreAppUserUseCase: createFirestoreAppUserUseCase);
});

// A simple graph bloc that keeps track of auth state changes and updates the state of
// this bloc accordingly.
class AuthenticationBloc extends GraphBloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc({
    required FirebaseAuth auth,
    required this.createFirestoreAppUserUseCase,
  }) : super(initialState: const AuthenticationState.uninitialized()) {
    _firebaseAuthStateChangesSubscription = auth.authStateChanges().listen(_handleOnAuthStateChanged);
  }

  late final StreamSubscription _firebaseAuthStateChangesSubscription;
  final CreateFirestoreAppUserUseCase createFirestoreAppUserUseCase;

  @override
  BlocStateGraph<AuthenticationEvent, AuthenticationState> get graph => BlocStateGraph(graph: {
        _$Uninitialized: {
          _$Authenticate: transitionWithEffect(
              (Authenticate event, state) => AuthenticationState.authenticated(event.user), verifyFirestoreUser),
          _$Unauthenticate: transition((Unauthenticate event, state) => const AuthenticationState.unauthenticated()),
        },
        _$Authenticated: {
          _$Unauthenticate: transition((Unauthenticate event, state) => const AuthenticationState.unauthenticated()),
        },
        _$Unauthenticated: {
          _$Authenticate: transition((Authenticate event, state) => AuthenticationState.authenticated(event.user)),
        },
      });

  @override
  Future<void> close() async {
    await _firebaseAuthStateChangesSubscription.cancel();
    await super.close();
  }

  void _handleOnAuthStateChanged(User? user) {
    if (user != null) {
      add(AuthenticationEvent.authenticate(user));
    } else {
      add(const AuthenticationEvent.unauthenticate());
    }
  }

  // Make sure we have a Firestore user.
  void verifyFirestoreUser(Authenticate event, _) {
    // Fire off the use case that creates the Firestore user.
    createFirestoreAppUserUseCase.execute(event.user.toCreateFirestoreAppUserUseCaseParams);
  }
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
