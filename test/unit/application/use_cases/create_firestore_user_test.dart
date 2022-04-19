// import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:freegamesexample/application/use_cases/create_firestore_user.dart';
import 'package:freegamesexample/core/use_cases.dart';
import 'package:freegamesexample/data/constants.dart';
import 'package:freegamesexample/domain/models/app_user.dart';

import '../../../utils.dart';

const kTestCreateFirestoreUserExceptionMessage = 'Failed creating a user in Firestore.';

void main() {
  group('CreateFirestoreUserUseCase', () {
    late FakeFirebaseFirestore fakeFirestore;
    late MockAppFirestoreService service;

    setUp(() {
      fakeFirestore = FakeFirebaseFirestore();
      service = MockAppFirestoreService();
      when(() => service.firestore).thenReturn(fakeFirestore);
      when(() => service.users).thenReturn(
        fakeFirestore.collection(AppConstants.usersFirebaseKey).withConverter<AppUser>(
              fromFirestore: (snapshot, _) => AppUser.fromJson(snapshot.data()!),
              toFirestore: (user, _) => user.toJson(),
            ),
      );
    });

    test('can be instantiated', () {
      final useCase = CreateFirestoreAppUserUseCase(service: service);
      expect(useCase, isNotNull);
    });

    test('execute creates the user', () async {
      addTearDown(() async => clearFirestore(fakeFirestore));

      final useCase = CreateFirestoreAppUserUseCase(service: service);
      final result = await useCase.execute(TestConstants.testUser.toCreateFirestoreAppUserUseCaseParams);
      expect(result, isA<UseCaseResultSuccess<Exception, AppUser>>());

      await delay(1);

      final docs = await fakeFirestore.collection(AppConstants.usersFirebaseKey).get();
      expect(docs.docs.length, 1);
    });

    test('execute multiple times returns same user', () async {
      addTearDown(() async => clearFirestore(fakeFirestore));

      final useCase = CreateFirestoreAppUserUseCase(service: service);
      final result = await useCase.execute(TestConstants.testUser.toCreateFirestoreAppUserUseCaseParams);
      expect(result, isA<UseCaseResultSuccess<Exception, AppUser>>());

      await delay(1);

      final docs = await service.users.get();
      expect(docs.docs.length, 1);

      final result2 = await useCase.execute(TestConstants.testUser.toCreateFirestoreAppUserUseCaseParams);
      expect(result2, isA<UseCaseResultSuccess<Exception, AppUser>>());
      expect(result.mapOrNull(success: (res) => res.data.uid), TestConstants.testUser.uid);
      expect(result2.mapOrNull(success: (res) => res.data.uid), TestConstants.testUser.uid);
    });

    test('if service throws use returns failure', () async {
      addTearDown(() async => clearFirestore(fakeFirestore));

      when(() => service.users.doc).thenThrow(Exception(kTestCreateFirestoreUserExceptionMessage));

      final useCase = CreateFirestoreAppUserUseCase(service: service);
      final result = await useCase.execute(TestConstants.testUser.toCreateFirestoreAppUserUseCaseParams);
      expect(result, isA<UseCaseResultFailure<Exception, AppUser>>());
    });
  });
}
