import 'package:dio/dio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

/// Core elements
import 'package:freegamesexample/core/use_cases.dart';
import 'package:freegamesexample/data/adapters/dio_adapter.dart';

/// Games feature elements
import 'package:freegamesexample/features/games/data/data_sources/games_api.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

part 'fetch_all_games.g.dart';

@riverpod
class FetchAllGamesUseCase extends _$FetchAllGamesUseCase with ProviderAsyncUseCase<Object, List<Game>> {
  @override
  Future<UseCaseResult<Object, List<Game>>> build() {
    dataSource = ref.watch(gamesApiDataSourceProvider);
    adapter = ref.watch(
      dioAdapterProvider(
        BaseOptions(baseUrl: dataSource.baseUrl),
      ),
    );
    return execute();
  }

  late final DioAdapter adapter;
  late final GameApiDataSource dataSource;

  @override
  Future<UseCaseResult<Object, List<Game>>> execute() async {
    final response = await adapter.get<List<dynamic>>(
      DioAdapterOptions(
        path: dataSource.gamesEndpoint,
      ),
    );

    return response.when(
      success: (data) {
        return UseCaseResult.success(
          data.map((game) {
            return Game.fromJson(game as Map<String, dynamic>);
          }).toList(),
        );
      },
      failure: (exception, stackTrace) => UseCaseResult.failure(exception ?? Exception('Failure.'), stackTrace),
    );
  }
}
