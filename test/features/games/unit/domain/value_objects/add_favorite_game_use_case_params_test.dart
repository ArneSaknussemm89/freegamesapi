import 'package:flutter_test/flutter_test.dart';

import 'package:freegamesexample/features/games/domain/models/game/game.dart';
import 'package:freegamesexample/features/games/domain/value_objects/add_favorite_game_params.dart';

const kTestAddFavoriteGameUseCaseParamsUserId = 'test_user_id';

void main() {
  group('AddFavoriteGameUseCaseParams', () {
    late Game testGame;

    setUp(() {
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
    });

    test('can be instantiated', () {
      final params = AddFavoriteGameUseCaseParams(
        uid: kTestAddFavoriteGameUseCaseParamsUserId,
        game: testGame,
      );

      expect(params, isNotNull);
    });

    // Test that two instances with the same props are considered equal.
    test('same props means identical', () {
      final params1 = AddFavoriteGameUseCaseParams(
        uid: kTestAddFavoriteGameUseCaseParamsUserId,
        game: testGame,
      );

      final params2 = AddFavoriteGameUseCaseParams(
        uid: kTestAddFavoriteGameUseCaseParamsUserId,
        game: testGame,
      );

      expect(params1, equals(params2));
    });
  });
}
