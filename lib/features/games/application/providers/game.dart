import 'package:freegamesexample/features/games/application/providers/favorites_list.dart';
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Game feature elements.
import 'package:freegamesexample/features/games/application/providers/games_list.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

part 'game.g.dart';

@riverpod
Future<Game?> fetchOneGame(FetchOneGameRef ref, {required int id, bool checkFavorite = false}) async {
  final games = ref.watch(fetchAllGamesProvider);
  final favorite = ref.watch(fetchOneFavoriteProvider(id: id));
  return favorite.when(
    data: (fav) {
      return games.maybeWhen(
        orElse: () => null,
        data: (data) {
          try {
            final game = data.firstWhere((game) => game.id == id);
            return game.copyWith(isFavorite: fav?.gameId == game.id);
          } on StateError catch (_) {
            // @TODO: Add crashlytics
            return null;
          }
        },
      );
    },
    error: (error, stackTrace) => null,
    loading: () => null,
  );
}

@riverpod
Future<FavoriteGame?> fetchOneFavorite(FetchOneFavoriteRef ref, {required int id}) async {
  final favorites = ref.watch(fetchUserFavoritesProvider);
  return favorites.maybeWhen(
    orElse: () => null,
    data: (data) {
      return data.firstWhere((fav) => fav.gameId == id);
    },
  );
}
