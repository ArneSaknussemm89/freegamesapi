import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:freegamesexample/core/use_cases.dart';
import 'package:freegamesexample/features/games/application/services/favorites_service.dart';
import 'package:freegamesexample/features/games/application/use_cases/add_favorite_game.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';
import 'package:freegamesexample/features/games/domain/value_objects/add_favorite_game_params.dart';

import 'add_favorite_games_test.mocks.dart';

@GenerateMocks([FavoriteGamesService, AddFavoriteGameUseCase])
void main() {
  group('Add Favorite Game Use Case', () {
    late MockFavoriteGamesService service;
    late MockAddFavoriteGameUseCase useCase;
    late AddFavoriteGameUseCaseParams params;
    late Game testGame;

    setUp(() {
      service = MockFavoriteGamesService();
      useCase = MockAddFavoriteGameUseCase();
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
      params = AddFavoriteGameUseCaseParams(uid: '9876trfvghuiokmnbawdhaj', game: testGame);
      when(useCase.execute(params)).thenAnswer((_) => Future<UseCaseResult<Exception, Void>>.value(const UseCaseResult.success(kVoid)));
    });

    test('can instantiate', () async {
      final testCase = AddFavoriteGameUseCase(favoritesService: service);
      expect(testCase, isNotNull);
    });

    test('should return void', () async {
      final result = await useCase.execute(params);
      expect(result, const UseCaseResult<Exception, Void>.success(kVoid));
    });
  });
}
