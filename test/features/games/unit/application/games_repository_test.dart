import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import 'package:freegamesexample/data/adapters/dio_adapter.dart';
import 'package:freegamesexample/features/games/application/use_cases/fetch_all_games.dart';
import 'package:freegamesexample/features/games/data/repositories/games.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

import 'games_repository_test.mocks.dart';

@GenerateMocks([DioAdapter, FetchAllGamesUseCase, GamesRepository])
void main() {
  group('Games Repository', () {
    late List<Game> games;
    late GamesRepository repository;

    setUp(() {
      games = [
        Game(
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
        ),
        Game(
          1,
          'Game Test 2',
          'https://placehold.it/150x150',
          'test',
          'https://google.com',
          'Action/Adventure',
          'Mac OS, Windows, Linux',
          'Test Publisher',
          'Test Developer',
          DateTime.now(),
          'https://freetogame.com/test',
        ),
        Game(
          1,
          'Game Test 3',
          'https://placehold.it/150x150',
          'test',
          'https://google.com',
          'Action/Adventure',
          'Mac OS, Windows, Linux',
          'Test Publisher',
          'Test Developer',
          DateTime.now(),
          'https://freetogame.com/test',
        ),
      ];

      repository = MockGamesRepository();
      when(repository.getAllGames()).thenAnswer(
        (_) async => Future<List<Game>>.value(games),
      );
    });

    test('can get all games', () async {
      final result = await repository.getAllGames();
      expect(result, games);
    });
  });
}
