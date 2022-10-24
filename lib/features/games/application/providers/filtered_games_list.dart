import 'package:riverpod_annotation/riverpod_annotation.dart';

// Core elements.
import 'package:freegamesexample/core/application/providers/authentication.dart';

// Games feature elements.
import 'package:freegamesexample/features/games/application/providers/favorites_list.dart';
import 'package:freegamesexample/features/games/application/providers/games_list_filter.dart';
import 'package:freegamesexample/features/games/application/use_cases/filtered_games_list.dart';
import 'package:freegamesexample/features/games/application/use_cases/merge_game_favorites.dart';
import 'package:freegamesexample/features/games/data/repositories/games.dart';
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

part 'filtered_games_list.g.dart';

@riverpod
Future<List<Game>> fetchFilteredGames(FetchFilteredGamesRef ref) async {
  final filter = ref.watch(gamesListFilterNotifierProvider);
  final repository = ref.watch(gamesRepositoryProvider);
  final auth = ref.watch(authenticationServiceProvider);

  // Use cases.
  const merge = MergeGameFavoritesUseCase();
  const filterGames = FilteredGamesListUseCase();
  final games = await repository.getAllGames();
  final favorites = auth.maybeMap(
    orElse: () => <FavoriteGame>[],
    authenticated: (authState) {
      final favorites = ref.watch(fetchUserFavoritesProvider);
      return favorites.when(
        data: (data) {
          return data;
        },
        error: (error, stackTrace) {
          // @TODO: Add crashlytics
          return <FavoriteGame>[];
        },
        loading: () => <FavoriteGame>[],
      );
    },
  );

  // Merge games with favorites.
  return merge(games, favorites).when(
    failure: (error, stackTrace) {
      // @TODO: Add crashlytics
      return games;
    },
    success: (merged) => filterGames(filter, merged).when(
      success: (games) => games,
      failure: (error, stackTrace) {
        // @TODO: Add crashlytics
        return merged;
      },
    ),
  );
}
