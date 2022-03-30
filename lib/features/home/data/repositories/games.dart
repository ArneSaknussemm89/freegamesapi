import 'package:dio/dio.dart';
import 'package:freegamesexample/data/adapters/dio_adapter.dart';
import 'package:freegamesexample/data/repositories/repository.dart';
import 'package:freegamesexample/features/home/data/data_sources/games_api.dart';
import 'package:freegamesexample/features/home/domain/models/game/game.dart';
import 'package:riverbloc/riverbloc.dart';

// The default provider for this repository.
final gamesRepository = Provider.autoDispose<GamesRepository>((ref) {
  final dataSource = ref.watch(gamesApiDataSource);
  final adapter = ref.watch(dioAdapter(BaseOptions(baseUrl: dataSource.baseUrl)));

  return GamesRepository(adapter: adapter, dataSource: dataSource);
});

class GamesRepository extends Repository<Game, DioAdapter> {
  GamesRepository({
    required DioAdapter adapter,
    required this.dataSource,
  }) : super(adapter: adapter);

  final GameApiDataSource dataSource;

  Future<List<Game>> getAllGames() async {
    final response = await adapter.get<List<dynamic>>(
      DioAdapterOptions(
        path: dataSource.gamesEndpoint,
      ),
    );

    return response.when(
      success: (data) {
        return data.map((dynamic game) => Game.fromJson(game as Map<String, dynamic>)).toList();
      },
      failure: (error, trace) => const <Game>[],
    );
  }
}
