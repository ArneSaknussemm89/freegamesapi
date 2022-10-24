import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:freegamesexample/core/adapters.dart';
import 'package:freegamesexample/core/data/adapters/dio_adapter.dart';
import 'package:freegamesexample/features/games/application/use_cases/fetch_all_games.dart';
import 'package:freegamesexample/features/games/data/data_sources/games_api.dart';
import 'package:freegamesexample/features/games/data/repositories/games.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

import '../../../../../utils.dart';

const failureMessage = 'Failed getting games from the API';
final testDate = DateTime(2022, 1, 1);

void main() {
  group('Games Repository', () {
    late List<Game> games;
    late List<dynamic> deserializedGames;
    late MockDioAdapter adapter;
    late FetchAllGamesUseCase useCase;
    late GameApiDataSource dataSource;

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

      dataSource = const GameApiDataSource();

      adapter = MockDioAdapter();
      when(() =>
        adapter.get<List<dynamic>>(
          DioAdapterOptions(path: dataSource.gamesEndpoint),
        ),
      ).thenAnswer(
        (_) async => AdapterResponse.success(deserializedGames),
      );

      useCase = FetchAllGamesUseCase(adapter: adapter, dataSource: dataSource);
    });

    test('can instantiate', () async {
      final repository = GamesRepository(adapter: adapter, fetchAllGamesUseCase: useCase);
      expect(repository, isNotNull);
    });

    test('can get all games', () async {
      final repository = GamesRepository(adapter: adapter, fetchAllGamesUseCase: useCase);
      final result = await repository.getAllGames();
      expect(result, games);
    });

    test('get all games failure returns empty list', () async {
      when(() =>
        adapter.get<List<dynamic>>(
          DioAdapterOptions(path: dataSource.gamesEndpoint),
        ),
      ).thenAnswer(
        (_) async => const AdapterResponse.failure(failureMessage, StackTrace.empty),
      );

      final repository = GamesRepository(adapter: adapter, fetchAllGamesUseCase: useCase);
      final result = await repository.getAllGames();
      expect(result, const []);
    });

    test('games repository provider can be read', () async {
      final root = createContainer();
      final container = createContainer(parent: root);

      final options = BaseOptions(baseUrl: dataSource.baseUrl);
      final realAdapter = DioAdapter(client: Dio(options));

      // Now read and compare values.
      final repository = container.read(gamesRepositoryProvider);
      expect(repository, isNotNull);
      expect(repository.adapter.client.options.baseUrl, realAdapter.client.options.baseUrl);
      expect(repository.adapter.client.options.headers['Content-Type'], contains('application/json'));
    });
  });
}
