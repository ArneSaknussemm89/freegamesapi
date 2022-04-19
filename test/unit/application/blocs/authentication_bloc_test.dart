import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freegamesexample/application/services/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:freegamesexample/application/blocs/authentication.dart';
import 'package:freegamesexample/application/services/cloud_firestore.dart';
import 'package:freegamesexample/application/use_cases/create_firestore_user.dart';
import 'package:freegamesexample/domain/models/app_user.dart';

import '../../../utils.dart';

const kTestFirebaseAuthUserEmail = 'testuser@gmail.vom';
const kTestFirebaseAuthUserPassword = 'testpassword';

void main() {
  group('AuthenticationBloc', () {
    late FakeFirebaseFirestore fakeFirestore;
    late AuthenticationBloc authBloc;
    late MockAppFirestoreService service;
    late MockFirebaseAuth auth;
    late CreateFirestoreAppUserUseCase useCase;
    late MockUser fakeUser;

    setUp(() {
      auth = MockFirebaseAuth(signedIn: false);
      fakeFirestore = FakeFirebaseFirestore();
      service = MockAppFirestoreService();

      // Set up stubs.
      when(() => service.firestore).thenReturn(fakeFirestore);
      when(() => service.users).thenReturn(
        fakeFirestore.collection('users').withConverter<AppUser>(
              fromFirestore: (snapshot, _) => AppUser.fromJson(snapshot.data()!),
              toFirestore: (user, _) => user.toJson(),
            ),
      );

      // Set up classes.
      useCase = CreateFirestoreAppUserUseCase(service: service);
      authBloc = AuthenticationBloc(auth: auth, createFirestoreAppUserUseCase: useCase);
      fakeUser = MockUser(
        uid: 'mock_uid',
        email: kTestFirebaseAuthUserEmail,
        displayName: 'Mock User',
      );
    });

    test('initial state is uninitialized', () {
      expect(authBloc.state, const AuthenticationState.uninitialized());
    });

    test('can login with username and password', () async {
      addTearDown(() async {
        final docs = await fakeFirestore.collection('users').get();
        Future.forEach<QueryDocumentSnapshot>(docs.docs, (doc) async {
          await doc.reference.delete();
        });
      });

      final testBloc = AuthenticationBloc(auth: auth, createFirestoreAppUserUseCase: useCase);

      final result = await auth.createUserWithEmailAndPassword(
        email: kTestFirebaseAuthUserEmail,
        password: kTestFirebaseAuthUserPassword,
      );

      // Should get the user back.
      expect(result, isNotNull);
      expect(result.user!.email, kTestFirebaseAuthUserEmail);

      // Pump event to the bloc.
      testBloc.add(AuthenticationEvent.authenticate(result.user!));

      // Wait for firestore to be updated with documents.
      await Future.delayed(const Duration(seconds: 3));

      // Firestore user should exist.
      final docs = await fakeFirestore.collection('users').get();
      expect(docs.docs.length, 1);
    });

    test('existing user returns user and does not create duplicate', () async {
      addTearDown(() async {
        final docs = await fakeFirestore.collection('users').get();
        Future.forEach<QueryDocumentSnapshot>(docs.docs, (doc) async {
          await doc.reference.delete();
        });
      });

      final testBloc = AuthenticationBloc(auth: auth, createFirestoreAppUserUseCase: useCase);

      final result = await auth.createUserWithEmailAndPassword(
        email: kTestFirebaseAuthUserEmail,
        password: kTestFirebaseAuthUserPassword,
      );

      // Should get the user back.
      expect(result, isNotNull);
      expect(result.user!.email, kTestFirebaseAuthUserEmail);

      // Pump event to the bloc.
      testBloc.add(AuthenticationEvent.authenticate(result.user!));

      // Wait for firestore to be updated with documents.
      await Future.delayed(const Duration(seconds: 1));

      // Firestore user should exist.
      final docs = await fakeFirestore.collection('users').get();
      expect(docs.docs.length, 1);

      // Now log out and try logging back in.
      await auth.signOut();

      final newResult = await auth.signInWithEmailAndPassword(
        email: kTestFirebaseAuthUserEmail,
        password: kTestFirebaseAuthUserPassword,
      );

      expect(newResult, isNotNull);
      expect(newResult.user!.email, kTestFirebaseAuthUserEmail);

      testBloc.add(AuthenticationEvent.authenticate(newResult.user!));

      // Wait for firestore to be updated with documents.
      await Future.delayed(const Duration(seconds: 1));

      // Should still only be one user.
      final newDocs = await fakeFirestore.collection('users').get();
      expect(newDocs.docs.length, 1);
    });

    test('can read bloc state from provider', () {
      final root = createContainer(
        overrides: [
          cloudFirestoreProvider.overrideWithProvider(Provider.autoDispose((ref) => fakeFirestore)),
          firebaseAuthProvider.overrideWithProvider(Provider.autoDispose((ref) => auth)),
        ],
      );
      final container = createContainer(parent: root);

      final state = container.read(authenticationBlocProvider);
      final bloc = container.read(authenticationBlocProvider.notifier);

      expect(state, isNotNull);
      expect(state, isA<Uninitialized>());
      expect(bloc, isNotNull);
      expect(bloc, isA<AuthenticationBloc>());
    });

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits Authenticated when AuthenticationEvent.authenticate is added',
      build: () => authBloc,
      act: (bloc) => bloc.add(
        AuthenticationEvent.authenticate(fakeUser),
      ),
      expect: () => [
        AuthenticationState.authenticated(fakeUser),
      ],
    );

    blocTest<AuthenticationBloc, AuthenticationState>(
      'emits Unauthenticated when AuthenticationEvent.unauthenticate is added',
      build: () => authBloc,
      act: (bloc) {
        bloc.add(AuthenticationEvent.authenticate(fakeUser));
        bloc.add(const AuthenticationEvent.unauthenticate());
      },
      expect: () => [
        AuthenticationState.authenticated(fakeUser),
        const AuthenticationState.unauthenticated(),
      ],
    );
  });
}
