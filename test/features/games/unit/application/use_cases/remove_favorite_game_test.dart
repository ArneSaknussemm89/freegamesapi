import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';

import 'package:freegamesexample/core/use_cases.dart';
import 'package:freegamesexample/data/constants.dart';
import 'package:freegamesexample/features/games/application/services/favorites_service.dart';
import 'package:freegamesexample/features/games/application/use_cases/remove_favorite_game.dart';
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';
import 'package:freegamesexample/features/games/domain/value_objects/remove_favorite_game_params.dart';

import '../../../../../utils.dart';

const kTestRemoveFavoriteFailureMessage = 'Failed removing game from favorites';

final testRemoveFavoriteException = Exception(kTestRemoveFavoriteFailureMessage);

void main() {
  group('RemoveFavoriteGameUseCase', () {
    late MockFavoriteGamesService service;
    late RemoveFavoriteGameUseCaseParams params;
    late MockAppFirestoreService appFirestore;
    late FakeFirebaseFirestore fakeFirestore;
    late CollectionReference<FavoriteGame> favorites;
    late Game testGame;
    late FavoriteGame testFavorite;

    setUp(() async {
      fakeFirestore = FakeFirebaseFirestore();
      appFirestore = MockAppFirestoreService();
      service = MockFavoriteGamesService();

      // Use fake firestore for running use cases.
      when(() => appFirestore.firestore).thenReturn(fakeFirestore);
      favorites = fakeFirestore.collection(AppConstants.favoritesFirebaseKey).withConverter<FavoriteGame>(
            fromFirestore: (snapshot, _) => FavoriteGame.fromJson(snapshot.data()!),
            toFirestore: (fav, _) => fav.toJson(),
          );
      when(() => appFirestore.favorites).thenReturn(favorites);
      when(() => service.appFirestore).thenReturn(appFirestore);

      testGame = Game(
        1,
        'Game Test 1',
        'https://placehold.it/150x150',
        'test',
        'https://google.com',
        'Action/Adventure',
        'Mac OS, Windows, Linux',
        'Test Publisher',
        'Test Developer',
        DateTime.now(),
        'https://freetogame.com/test',
      );

      testFavorite = FavoriteGame(
        gameId: testGame.id,
        ownerId: TestConstants.testUser.uid,
        savedOn: DateTime.now(),
      );

      params = RemoveFavoriteGameUseCaseParams(uid: TestConstants.testUser.uid, game: testGame);

      // Stub add favorite.
      when(() => service.removeFavorite(TestConstants.testUser.uid, testGame)).thenAnswer((_) async {
        final docs = await appFirestore.favorites
            .where(
              'ownerId',
              isEqualTo: TestConstants.testUser.uid,
            )
            .where(
              'gameId',
              isEqualTo: testGame.id,
            )
            .get();

        await Future.forEach<QueryDocumentSnapshot<FavoriteGame>>(
          docs.docs,
          (doc) async {
            await doc.reference.delete();
          },
        );
      });
    });

    tearDownAll(() => clearFirestore(fakeFirestore));

    test('can instantiate', () async {
      final useCase = RemoveFavoriteGameUseCase(favoritesService: service);
      expect(useCase, isNotNull);
    });

    test('success should remove game from favorites', () async {
      // Add a favorite game.
      await favorites.add(testFavorite);

      final useCase = RemoveFavoriteGameUseCase(favoritesService: service);
      final result = await useCase.execute(params);

      // Wait for firebase to update.
      await delay(1);
      expect(result, const UseCaseResult<Exception, Void>.success(kVoid));

      // Make sure it exists in firestore.
      final favs = await appFirestore.favorites.get();
      expect(favs.docs.length, 0);
    });

    test('failure should return error', () async {
      when(() => service.removeFavorite(TestConstants.testUser.uid, testGame)).thenThrow(testRemoveFavoriteException);

      final useCase = RemoveFavoriteGameUseCase(favoritesService: service);
      final result = await useCase.execute(params);
      result.when(
        failure: (error, trace) {
          expect(
            error,
            testRemoveFavoriteException,
          );
        },
        success: (v) {},
      );
    });

    test('can read provider', () async {
      final root = createContainer(
        overrides: [
          favoriteGamesServiceProvider.overrideWithProvider(Provider.autoDispose((ref) => service)),
        ],
      );
      final container = createContainer(
        parent: root,
      );

      final useCase = container.read(removeFavoriteGameUseCaseProvider);

      expect(useCase, isNotNull);
      expect(useCase.favoritesService, service);
    });
  });
}
