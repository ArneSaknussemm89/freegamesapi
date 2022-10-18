import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';

import 'package:freegamesexample/core/use_cases.dart';
import 'package:freegamesexample/data/constants.dart';
import 'package:freegamesexample/features/games/application/services/favorites_service.dart';
import 'package:freegamesexample/features/games/application/use_cases/add_favorite_game.dart';
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';
import 'package:freegamesexample/features/games/domain/value_objects/add_favorite_game_params.dart';

import '../../../../../utils.dart';

const kTestUserId = '12345678';
const kTestAddFavoriteFailureMessage = 'Failed adding game to favorites';

final testAddFavoriteException = Exception(kTestAddFavoriteFailureMessage);

void main() {
  group('AddFavoriteGameUseCase', () {
    late MockFavoriteGamesService service;
    late AddFavoriteGameUseCaseParams params;
    late MockAppFirestoreService appFirestore;
    late FakeFirebaseFirestore fakeFirestore;
    late Game testGame;

    setUp(() {
      fakeFirestore = FakeFirebaseFirestore();
      appFirestore = MockAppFirestoreService();
      service = MockFavoriteGamesService();

      // Use fake firestore for running use cases.
      when(() => appFirestore.firestore).thenReturn(fakeFirestore);
      when(() => appFirestore.favorites).thenReturn(
        fakeFirestore.collection(AppConstants.favoritesFirebaseKey).withConverter<FavoriteGame>(
              fromFirestore: (snapshot, _) => FavoriteGame.fromJson(snapshot.data()!),
              toFirestore: (fav, _) => fav.toJson(),
            ),
      );
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
      params = AddFavoriteGameUseCaseParams(uid: kTestUserId, game: testGame);

      // Stub add favorite.
      when(() => service.addFavorite(kTestUserId, testGame)).thenAnswer((_) async {
        appFirestore.favorites.add(
          FavoriteGame(
            gameId: testGame.id,
            ownerId: kTestUserId,
            savedOn: DateTime.now(),
          ),
        );
      });
    });

    tearDownAll(() => clearFirestore(fakeFirestore));

    test('can instantiate', () async {
      final useCase = AddFavoriteGameUseCase(favoritesService: service);
      expect(useCase, isNotNull);
    });

    test('success should add games to favorites', () async {
      addTearDown(() => clearFirestore(fakeFirestore));

      final useCase = AddFavoriteGameUseCase(favoritesService: service);
      final result = await useCase.execute(params);

      // Wait for firebase to update.
      await delay(1);
      expect(result, const UseCaseResult<Exception, Void>.success(kVoid));

      // Make sure it exists in firestore.
      final favorites = await appFirestore.favorites.get();
      expect(favorites.docs.length, 1);
    });

    test('failure should return error', () async {
      when(() => service.addFavorite(kTestUserId, testGame)).thenThrow(testAddFavoriteException);

      final useCase = AddFavoriteGameUseCase(favoritesService: service);
      final result = await useCase.execute(params);
      result.when(
        failure: (error, trace) {
          expect(
            error,
            testAddFavoriteException,
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

      final useCase = container.read(addFavoriteGameUseCaseProvider);

      expect(useCase, isNotNull);
      expect(useCase.favoritesService, service);
    });
  });
}
