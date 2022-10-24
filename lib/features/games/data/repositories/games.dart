import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Core elements.
import 'package:freegamesexample/core/data/adapters/dio_adapter.dart';
import 'package:freegamesexample/core/data/repositories/repository.dart';

// Games feature elements.
import 'package:freegamesexample/features/games/data/data_sources/games_api.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

part 'games.g.dart';

@riverpod
GamesRepository gamesRepository(GamesRepositoryRef ref) {
  final dataSource = ref.watch(gamesApiDataSourceProvider);
  final adapter = ref.watch(
    dioAdapterProvider(
      BaseOptions(baseUrl: dataSource.baseUrl),
    ),
  );

  return GamesRepository(adapter: adapter, dataSource: dataSource);
}

class GamesRepository extends Repository<Game, DioAdapter> {
  const GamesRepository({
    required super.adapter,
    required this.dataSource,
  });

  final GameApiDataSource dataSource;

  Future<List<Game>> getAllGames() async {
    final response = await adapter.get<List<dynamic>>(
      DioAdapterOptions(
        path: dataSource.gamesEndpoint,
      ),
    );

    return response.when(
      success: (data) {
        return data.map((game) {
          return Game.fromJson(game as Map<String, dynamic>);
        }).toList();
      },
      failure: (exception, stackTrace) {
        // @TODO: Crashlytics report here maybe
        return <Game>[];
      },
    );
  }
}
