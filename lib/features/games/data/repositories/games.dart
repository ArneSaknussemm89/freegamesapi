import 'package:dio/dio.dart';
import 'package:riverbloc/riverbloc.dart';

import 'package:freegamesexample/data/adapters/dio_adapter.dart';
import 'package:freegamesexample/data/repositories/repository.dart';
import 'package:freegamesexample/features/games/application/use_cases/fetch_all_games.dart';
import 'package:freegamesexample/features/games/data/data_sources/games_api.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

// The default provider for this repository.
final gamesRepository = Provider.autoDispose<GamesRepository>((ref) {
  final dataSource = ref.watch(gamesApiDataSource);
  final adapter = ref.watch(dioAdapter(BaseOptions(baseUrl: dataSource.baseUrl)));
  final fetchAllGamesUseCase = ref.watch(fetchAllGamesUseCaseProvider);

  return GamesRepository(adapter: adapter, fetchAllGamesUseCase: fetchAllGamesUseCase);
});

class GamesRepository extends Repository<Game, DioAdapter> {
  GamesRepository({
    required DioAdapter adapter,
    required this.fetchAllGamesUseCase,
  }) : super(adapter: adapter);

  final FetchAllGamesUseCase fetchAllGamesUseCase;

  Future<List<Game>> getAllGames() async {
    final result = await fetchAllGamesUseCase.execute();

    return result.when(
      success: (data) {
        return data.map((dynamic game) => Game.fromJson(game as Map<String, dynamic>)).toList();
      },
      failure: (error, trace) => const <Game>[],
    );
  }
}
