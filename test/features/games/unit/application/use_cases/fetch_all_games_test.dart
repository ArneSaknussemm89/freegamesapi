import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:freegamesexample/core/adapters.dart';
import 'package:freegamesexample/core/use_cases.dart';
import 'package:freegamesexample/data/adapters/dio_adapter.dart';
import 'package:freegamesexample/features/games/application/use_cases/fetch_all_games.dart';
import 'package:freegamesexample/features/games/data/data_sources/games_api.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

import '../../../../../utils.dart';

const failureMessage = 'Failed getting games from the API';
final testDate = DateTime(2022, 1, 1);

void main() {
  group('FetchAllGamesUseCase', () {
    late MockDioAdapter adapter;
    //late MockGameApiDataSource source;
    late GameApiDataSource dataSource;
    late FetchAllGamesUseCase useCase;
    late List<Game> games;
    late List<dynamic> deserializedGames;

    setUp(() {
      adapter = MockDioAdapter();
      //source = MockGameApiDataSource();
      dataSource = const GameApiDataSource();
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
          testDate,
          'https://fake.freetogame.com/test',
        ),
        Game(
          2,
          'Game Test 2',
          'https://placehold.it/150x150',
          'test',
          'https://google.com',
          'Action/Adventure',
          'Mac OS, Windows, Linux',
          'Test Publisher',
          'Test Developer',
          testDate,
          'https://fake.freetogame.com/test',
        ),
        Game(
          3,
          'Game Test 3',
          'https://placehold.it/150x150',
          'test',
          'https://google.com',
          'Action/Adventure',
          'Mac OS, Windows, Linux',
          'Test Publisher',
          'Test Developer',
          testDate,
          'https://fake.freetogame.com/test',
        ),
      ];

      deserializedGames = [
        {
          'id': 1,
          'title': 'Game Test 1',
          'thumbnail': 'https://placehold.it/150x150',
          'short_description': 'test',
          'game_url': 'https://google.com',
          'genre': 'Action/Adventure',
          'platform': 'Mac OS, Windows, Linux',
          'publisher': 'Test Publisher',
          'developer': 'Test Developer',
          'release_date': testDate.toIso8601String(),
          'freetogame_profile_url': 'https://fake.freetogame.com/test',
        },
        {
          'id': 2,
          'title': 'Game Test 2',
          'thumbnail': 'https://placehold.it/150x150',
          'short_description': 'test',
          'game_url': 'https://google.com',
          'genre': 'Action/Adventure',
          'platform': 'Mac OS, Windows, Linux',
          'publisher': 'Test Publisher',
          'developer': 'Test Developer',
          'release_date': testDate.toIso8601String(),
          'freetogame_profile_url': 'https://fake.freetogame.com/test',
        },
        {
          'id': 3,
          'title': 'Game Test 3',
          'thumbnail': 'https://placehold.it/150x150',
          'short_description': 'test',
          'game_url': 'https://google.com',
          'genre': 'Action/Adventure',
          'platform': 'Mac OS, Windows, Linux',
          'publisher': 'Test Publisher',
          'developer': 'Test Developer',
          'release_date': testDate.toIso8601String(),
          'freetogame_profile_url': 'https://fake.freetogame.com/test',
        },
      ];

      when(() =>
        adapter.get<List<dynamic>>(
          DioAdapterOptions(path: dataSource.gamesEndpoint),
        ),
      ).thenAnswer((_) async {
        return AdapterResponse.success(deserializedGames);
      });

      useCase = FetchAllGamesUseCase(adapter: adapter, dataSource: dataSource);
    });

    test('can instantiate', () async {
      expect(useCase, isNotNull);
    });

    test('should return list of games', () async {
      final result = await useCase.execute();
      expect(result, UseCaseResult<Object?, List<Game>>.success(games));
    });

    test('error should return failure UseCaseResult', () async {
      // Override the return to return an exception.
      when(() => adapter.get<List<dynamic>>(DioAdapterOptions(path: dataSource.gamesEndpoint))).thenAnswer((_) async {
        return const AdapterResponse.failure(failureMessage, StackTrace.empty);
      });

      final result = await useCase.execute();
      expect(
        result,
        const UseCaseResult<Object?, List<Game>>.failure(failureMessage, StackTrace.empty),
      );
    });
  });
}
