import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:freegamesexample/application/services/cloud_firestore.dart';
import 'package:freegamesexample/core/use_cases.dart';
import 'package:freegamesexample/data/constants.dart';
import 'package:freegamesexample/features/games/application/use_cases/fetch_user_favorites.dart';
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';
import 'package:freegamesexample/features/games/domain/value_objects/fetch_user_favorites_params.dart';

import '../../../../../utils.dart';

const kTestFetchUserFavoritesFailureMessage = 'Failed to fetch user favorites.';

void main() {
  group('FetchUserFavoritesUseCase', () {
    late FakeFirebaseFirestore fakeFirestore;
    late MockAppFirestoreService service;

    setUp(() {
      fakeFirestore = FakeFirebaseFirestore();
      service = MockAppFirestoreService();
      when(() => service.firestore).thenReturn(fakeFirestore);
      when(() => service.favorites).thenReturn(
        fakeFirestore.collection(AppConstants.favoritesFirebaseKey).withConverter<FavoriteGame>(
              fromFirestore: (snapshot, _) => FavoriteGame.fromJson(snapshot.data()!),
              toFirestore: (fav, _) => fav.toJson(),
            ),
      );

      // Add some favorites.
      service.favorites.add(
        FavoriteGame(
          gameId: TestConstants.kTestGame1.id,
          ownerId: TestConstants.testUser.uid,
          savedOn: DateTime.now(),
        ),
      );
      service.favorites.add(
        FavoriteGame(
          gameId: TestConstants.kTestGame2.id,
          ownerId: TestConstants.testUser.uid,
          savedOn: DateTime.now(),
        ),
      );
    });

    tearDownAll(() => clearFirestore(fakeFirestore));

    test('can be instantiated', () {
      final useCase = FetchUserFavoritesUseCase(firestoreService: service);
      expect(useCase, isNotNull);
    });

    test('can fetch favorites for test user', () async {
      final useCase = FetchUserFavoritesUseCase(firestoreService: service);
      final result = await useCase.execute(FetchUserFavoritesUseCaseParams(TestConstants.testUser.uid));
      expect(result, isNotNull);

      final List<FavoriteGame> favs = result.maybeMap(success: (res) => res.data, orElse: () => []);
      expect(favs.length, 2);
      expect(favs[0].gameId, TestConstants.kTestGame1.id);
      expect(favs[1].gameId, TestConstants.kTestGame2.id);
    });

    test('failure returns an error result', () async {
      when(() => service.favorites).thenThrow(Exception(kTestFetchUserFavoritesFailureMessage));

      final useCase = FetchUserFavoritesUseCase(firestoreService: service);
      final result = await useCase.execute(FetchUserFavoritesUseCaseParams(TestConstants.testUser.uid));
      expect(result, isA<UseCaseResultFailure<Object?, List<FavoriteGame>>>());
      result.whenOrNull(failure: (error, trace) {
        expect(error, isA<Exception>());
        expect(error.toString(), 'Exception: $kTestFetchUserFavoritesFailureMessage');
      });
    });

    test('can read provider', () {
      final root = createContainer();
      final container = createContainer(
        parent: root,
        overrides: [
          appFirestoreServiceProvider.overrideWithProvider(
            Provider.autoDispose((ref) => service),
          ),
        ],
      );

      final useCase = container.read(fetchUserFavoritesUseCaseProvider);
      expect(useCase, isNotNull);
      expect(useCase.firestoreService, equals(service));
    });
  });
}
