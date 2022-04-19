import 'package:freegamesexample/features/games/application/blocs/favorites_list.dart';
import 'package:riverpod/riverpod.dart';

/// Global application elements.
import 'package:freegamesexample/application/blocs/authentication.dart';

/// Global core elements.
import 'package:freegamesexample/core/use_cases.dart';

/// Feature domain elements.
import 'package:freegamesexample/features/games/domain/value_objects/merge_game_favorites_params.dart';

/// Feature presentation elements.
import 'package:freegamesexample/features/games/presentation/view_models/game.dart';

final mergeGameFavoritesUseCaseProvider = Provider.autoDispose<MergeGameFavoritesUseCase>(
  (ref) {
    final auth = ref.watch(authenticationBlocProvider);
    return MergeGameFavoritesUseCase(auth: auth);
  },
  dependencies: [authenticationBlocProvider],
);
  
class MergeGameFavoritesUseCase extends UseCaseWithParams<Object?, List<GameVM>, MergeGameFavoritesUseCaseParams> {
  const MergeGameFavoritesUseCase({
    required this.auth,
  });

  final AuthenticationState auth;

  @override
  UseCaseResult<Object?, List<GameVM>> execute(MergeGameFavoritesUseCaseParams params) {
    final favGameIds = params.favorites.map((fav) => fav.gameId).toSet();
    switch (params.filter) {
      case GamesListFilter.all:
        return UseCaseResult.success(params.games
            .map(
              (g) => GameVM(
                auth: auth,
                game: g,
                bloc: params.bloc,
                favorite: favGameIds.contains(g.id),
              ),
            )
            .toList());
      case GamesListFilter.onlyFavorites:
        final favoriteGames = params.games.where((game) => favGameIds.contains(game.id)).toList();
        return UseCaseResult.success(
          favoriteGames.map(
            (favGame) {
              return GameVM(
                auth: auth,
                game: favGame,
                bloc: params.bloc,
                favorite: true,
              );
            },
          ).toList(),
        );
    }
  }
}
