import 'package:flutter_test/flutter_test.dart';

import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';

const kTestFavoriteGameId = 999999999;
const kTestFavoriteGameOwnerId = 'test_owner_id';
final testFavoriteGameSavedOn = DateTime(2022, 1, 1);

void main() {
  group('FavoriteGame model', () {
    test('can instantiate', () {
      final fav = FavoriteGame(
        gameId: kTestFavoriteGameId,
        ownerId: kTestFavoriteGameOwnerId,
        savedOn: testFavoriteGameSavedOn,
      );

      expect(fav, isNotNull);
    });

    test('same props means identical', () {
      final fav1 = FavoriteGame(
        gameId: kTestFavoriteGameId,
        ownerId: kTestFavoriteGameOwnerId,
        savedOn: testFavoriteGameSavedOn,
      );

      final fav2 = FavoriteGame(
        gameId: kTestFavoriteGameId,
        ownerId: kTestFavoriteGameOwnerId,
        savedOn: testFavoriteGameSavedOn,
      );

      expect(fav1, equals(fav2));
    });
  });
}
