import 'package:freegamesexample/core/use_cases.dart';
import 'package:freegamesexample/features/games/application/use_cases/fetch_all_games.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';
import 'package:freegamesexample/features/games/domain/value_objects/games_list_filter.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'filtered_games_list.g.dart';

@riverpod
class FilteredGamesList extends _$FilteredGamesList with ProviderUseCase<Object, AsyncValue<List<Game>>> {
  @override
  AsyncValue<List<Game>> build({required GamesListFilter filter}) {
    final allGames = ref.watch(fetchAllGamesUseCaseProvider);
    return allGames.when(
      data: (data) {
        return data.when(
          failure: (exception, stackTrace) {
            return AsyncValue.error(exception, stackTrace);
          },
          success: (games) {
            switch (filter) {
              case GamesListFilter.all:
                return AsyncValue.data(games);
              case GamesListFilter.onlyFavorites:
                return AsyncValue.data(games.where((game) => game.isFavorite).toList());
            }
          },
        );
      },
      error: (exception, stackTrace) => AsyncValue.error(exception, stackTrace),
      loading: AsyncValue.loading,
    );
  }

  /// @TODO: Add execute function.
}
