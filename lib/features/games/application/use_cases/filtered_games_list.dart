// Global elements.
import 'package:freegamesexample/core/use_cases.dart';

// Game feature elements.
import 'package:freegamesexample/features/games/domain/models/game/game.dart';
import 'package:freegamesexample/features/games/domain/value_objects/games_list_filter.dart';

// Filter games based on the filter.
UseCaseResult<Object?, List<Game>> filterGames(GamesListFilter filter, List<Game> games) {
  switch (filter) {
    case GamesListFilter.all:
      return UseCaseResult.success(games);
    case GamesListFilter.onlyFavorites:
      return UseCaseResult.success(games.where((game) => game.isFavorite).toList());
  }
}
