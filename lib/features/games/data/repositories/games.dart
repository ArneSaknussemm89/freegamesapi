import 'package:dio/dio.dart';
import 'package:riverbloc/riverbloc.dart';

import 'package:freegamesexample/data/adapters/dio_adapter.dart';
import 'package:freegamesexample/data/repositories/repository.dart';
import 'package:freegamesexample/features/games/application/use_cases/fetch_all_games.dart';
import 'package:freegamesexample/features/games/data/data_sources/games_api.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

// The default provider for this repository.
final gamesRepositoryProvider = Provider.autoDispose<GamesRepository>((ref) {
  final dataSource = ref.watch(gamesApiDataSourceProvider);
  final adapter = ref.watch(dioAdapterProvider(BaseOptions(baseUrl: dataSource.baseUrl)));
  final fetchAllGamesUseCase = ref.watch(fetchAllGamesUseCaseProvider);

  return GamesRepository(
    adapter: adapter,
    fetchAllGamesUseCase: fetchAllGamesUseCase,
  );
}, dependencies: [gamesApiDataSourceProvider, dioAdapterProvider, fetchAllGamesUseCaseProvider]);

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
        return data;
      },
      failure: (error, trace) => const <Game>[],
    );
  }
}
