import 'package:flutter_test/flutter_test.dart';

import 'package:freegamesexample/features/games/domain/value_objects/remove_favorite_game_params.dart';

import '../../../../../utils.dart';

void main() {
  group('RemoveFavoriteGameParams', () {
    test('same props means identical', () {
      final params1 = RemoveFavoriteGameUseCaseParams(
        uid: TestConstants.testUser.uid,
        game: TestConstants.kTestGame1,
      );
      final params2 = RemoveFavoriteGameUseCaseParams(
        uid: TestConstants.testUser.uid,
        game: TestConstants.kTestGame1,
      );
      expect(params1, equals(params2));
    });
  });
}
