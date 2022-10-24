import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freegamesexample/core/application/services/firebase_auth.dart';
import 'package:mocktail/mocktail.dart';
import 'package:test/test.dart';

import 'package:freegamesexample/core/application/providers/authentication.dart';
import 'package:freegamesexample/core/application/services/cloud_firestore.dart';
import 'package:freegamesexample/core/application/use_cases/create_firestore_user.dart';
import 'package:freegamesexample/core/domain/models/app_user.dart';

import '../../../utils.dart';

const kTestFirebaseAuthUserEmail = 'testuser@gmail.vom';
const kTestFirebaseAuthUserPassword = 'testpassword';

void main() {
  group('AuthenticationBloc', () {
    late FakeFirebaseFirestore fakeFirestore;
    late AuthenticationService authService;
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
      fakeUser = MockUser(
        uid: 'mock_uid',
        email: kTestFirebaseAuthUserEmail,
        displayName: 'Mock User',
      );
    });

    test('initial state is uninitialized', () {
      final container = createContainer();
      expect(container.read(authenticationServiceProvider), const AuthenticationState.uninitialized());
    });

    test('can login with username and password', () async {
      addTearDown(() async {
        final docs = await fakeFirestore.collection('users').get();
        Future.forEach<QueryDocumentSnapshot>(docs.docs, (doc) async {
          await doc.reference.delete();
        });
      });

      final container = createContainer();
      final sub = container.listen<AuthenticationState>(authenticationServiceProvider, (_, __) {});
      final result = await auth.createUserWithEmailAndPassword(
        email: kTestFirebaseAuthUserEmail,
        password: kTestFirebaseAuthUserPassword,
      );

      // Should get the user back.
      expect(result, isNotNull);
      expect(result.user!.email, kTestFirebaseAuthUserEmail);

      // Wait for firestore to be updated with documents.
      await Future.delayed(const Duration(seconds: 1));

      // Auth service should now be in auth state.
      expect(container.read(authenticationServiceProvider), isA<Authenticated>());

      // Firestore user should exist.
      final docs = await fakeFirestore.collection('users').get();
      expect(docs.docs.length, 1);
      sub.close();
    });

    test('existing user returns user and does not create duplicate', () async {
      addTearDown(() async {
        final docs = await fakeFirestore.collection('users').get();
        Future.forEach<QueryDocumentSnapshot>(docs.docs, (doc) async {
          await doc.reference.delete();
        });
      });

      final container = createContainer();
      final sub = container.listen<AuthenticationState>(authenticationServiceProvider, (_, __) {});
      final result = await auth.createUserWithEmailAndPassword(
        email: kTestFirebaseAuthUserEmail,
        password: kTestFirebaseAuthUserPassword,
      );

      // Should get the user back.
      expect(result, isNotNull);
      expect(result.user!.email, kTestFirebaseAuthUserEmail);

      // Wait for firestore to be updated with documents.
      await Future.delayed(const Duration(seconds: 1));

      expect(container.read(authenticationServiceProvider), isA<Authenticated>());

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

      // Wait for firestore to be updated with documents.
      await Future.delayed(const Duration(seconds: 1));

      // Auth service should now be in auth state.
      expect(container.read(authenticationServiceProvider), isA<Authenticated>());

      // Should still only be one user.
      final newDocs = await fakeFirestore.collection('users').get();
      expect(newDocs.docs.length, 1);
      sub.close();
    });

    test('can read bloc state from provider', () {
      final root = createContainer(
        overrides: [
          cloudFirestoreProvider.overrideWithProvider(Provider.autoDispose((ref) => fakeFirestore)),
          firebaseAuthProvider.overrideWithProvider(Provider.autoDispose((ref) => auth)),
        ],
      );
      final container = createContainer(parent: root);
      final sub = container.listen<AuthenticationState>(authenticationServiceProvider, (_, __) {});
      final state = container.read(authenticationServiceProvider);
      final service = container.read(authenticationServiceProvider.notifier);

      expect(state, isNotNull);
      expect(state, isA<Uninitialized>());
      expect(service, isNotNull);
      expect(service, isA<AuthenticationService>());
      sub.close();
    });
  });
}
