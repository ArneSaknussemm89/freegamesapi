import 'package:freegamesexample/core/use_cases.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:riverpod/riverpod.dart';

// Games feature elements.
import 'package:freegamesexample/features/games/application/providers/favorites_list.dart';
import 'package:freegamesexample/features/games/application/providers/games_list_filter.dart';
import 'package:freegamesexample/features/games/application/use_cases/filtered_games_list.dart';
import 'package:freegamesexample/features/games/application/use_cases/merge_game_favorites.dart';
import 'package:freegamesexample/features/games/data/repositories/games.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

part 'filtered_games_list.g.dart';

@riverpod
Future<List<Game>> fetchFilteredGames(Ref ref) async {
  final filter = ref.watch(gamesListFilterNotifierProvider);
  final repository = ref.watch(gamesRepositoryProvider);
  final favorites = ref.watch(fetchUserFavoritesProvider).requireValue;
  final games = await repository.getAllGames();
  final mergedGames = mergeGamesWithFavorites(games, favorites);
  // Now filter the games.
  final filteredGames = switch (mergedGames) {
    UseCaseResultSuccess(:final data) => filterGames(filter, data),
    UseCaseResultFailure() => UseCaseResult.failure('Unable to merge games with favorites', StackTrace.current),
    _ => UseCaseResult.failure('Unable to merge games with favorites', StackTrace.current),
  };

  // Merge games with favorites.
  return switch (filteredGames) {
    UseCaseResultSuccess(:final data) => data,
    UseCaseResultFailure() => [],
    _ => [],
  };
}
