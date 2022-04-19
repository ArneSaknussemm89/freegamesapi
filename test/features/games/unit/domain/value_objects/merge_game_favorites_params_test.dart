import 'package:flutter_test/flutter_test.dart';

import 'package:freegamesexample/features/games/domain/value_objects/merge_game_favorites_params.dart';

import '../../../../../utils.dart';

void main() {
  group('MergeGameFavoritesUseCaseParams', () {
    late MockFavoriteGamesBloc bloc;

    setUp(() {
      bloc = MockFavoriteGamesBloc();
    });

    test('same props means identical', () {
      final params1 = MergeGameFavoritesUseCaseParams(
        favorites: TestConstants.testFavorites,
        games: TestConstants.testGames,
        bloc: bloc,
      );
      final params2 = MergeGameFavoritesUseCaseParams(
        favorites: TestConstants.testFavorites,
        games: TestConstants.testGames,
        bloc: bloc,
      );
      expect(params1, equals(params2));
    });
  });
}
