// Global elements.
import 'package:freegamesexample/core/use_cases.dart';

// Game feature elements.
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

// Merge favorites and games into a list of games marked as favorites.
UseCaseResult<Object?, List<Game>> mergeGamesWithFavorites(List<Game> games, List<FavoriteGame> favorites) {
  final favoriteIds = favorites.map((favorite) => favorite.gameId).toSet();
  final merged =
      games.map((game) {
        final isFavorite = favoriteIds.contains(game.id);
        return game.copyWith(isFavorite: isFavorite);
      }).toList();

  return UseCaseResult.success(merged);
}
