import 'package:flutter_test/flutter_test.dart';

import 'package:freegamesexample/features/games/domain/value_objects/setup_game_favorites_params.dart';

import '../../../../../utils.dart';

void main() {
  group('SetupGameFavoritesUseCaseParams', () {
    late MockFavoriteGamesBloc bloc;

    setUp(() {
      bloc = MockFavoriteGamesBloc();
    });

    test('same props means identical', () {
      final params1 = SetupGameFavoritesUseCaseParams(
        favorites: TestConstants.testFavorites,
        games: TestConstants.testGames,
        bloc: bloc,
      );
      final params2 = SetupGameFavoritesUseCaseParams(
        favorites: TestConstants.testFavorites,
        games: TestConstants.testGames,
        bloc: bloc,
      );
      expect(params1, equals(params2));
    });
  });
}
