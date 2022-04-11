import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

import 'package:freegamesexample/core/use_cases.dart';
import 'package:freegamesexample/data/adapters/dio_adapter.dart';
import 'package:freegamesexample/features/games/data/data_sources/games_api.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

final fetchAllGamesUseCaseProvider = Provider.autoDispose<FetchAllGamesUseCase>((ref) {
  final dataSource = ref.watch(gamesApiDataSource);
  final adapter = ref.watch(dioAdapter(BaseOptions(baseUrl: dataSource.baseUrl)));

  return FetchAllGamesUseCase(adapter: adapter, dataSource: dataSource);
});

class FetchAllGamesUseCase extends AsyncUseCase<Object?, List<Game>> {
  const FetchAllGamesUseCase({
    required this.adapter,
    required this.dataSource,
  });

  final DioAdapter adapter;
  final GameApiDataSource dataSource;

  @override
  Future<UseCaseResult<Object?, List<Game>>> execute() async {
    final response = await adapter.get<List<dynamic>>(
      DioAdapterOptions(
        path: dataSource.gamesEndpoint,
      ),
    );

    return response.when(
      success: (data) {
        return UseCaseResult.success(data.map((dynamic game) => Game.fromJson(game as Map<String, dynamic>)).toList());
      },
      failure: UseCaseResult.failure,
    );
  }
}
