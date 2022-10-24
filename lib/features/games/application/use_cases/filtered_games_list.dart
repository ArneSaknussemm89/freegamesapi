// Global elements.
import 'package:freegamesexample/core/use_cases.dart';

// Game feature elements.
import 'package:freegamesexample/features/games/domain/models/game/game.dart';
import 'package:freegamesexample/features/games/domain/value_objects/games_list_filter.dart';

// Merge favorites and games into a list of games marked as favorites.
class FilteredGamesListUseCase extends UseCase<Exception, List<Game>> {
  const FilteredGamesListUseCase();

  UseCaseResult<Object?, List<Game>> call(GamesListFilter filter, List<Game> games) {
    switch (filter) {
      case GamesListFilter.all:
        return UseCaseResult.success(games);
      case GamesListFilter.onlyFavorites:
        return UseCaseResult.success(games.where((game) => game.isFavorite).toList());
    }
  }
}
