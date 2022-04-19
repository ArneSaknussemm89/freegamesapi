import 'package:riverpod/riverpod.dart';

/// Global application elements.
import 'package:freegamesexample/application/blocs/authentication.dart';

/// Global core elements.
import 'package:freegamesexample/core/use_cases.dart';

/// Feature domain elements.
import 'package:freegamesexample/features/games/domain/value_objects/setup_game_favorites_params.dart';

/// Feature presentation elements.
import 'package:freegamesexample/features/games/presentation/view_models/game.dart';

final setupGameFavoritesUseCaseProvider = Provider.autoDispose<SetupGameFavoritesUseCase>(
  (ref) {
    final auth = ref.watch(authenticationBlocProvider);
    return SetupGameFavoritesUseCase(auth: auth);
  },
  dependencies: [authenticationBlocProvider],
);

class SetupGameFavoritesUseCase extends UseCaseWithParams<Object?, List<GameVM>, SetupGameFavoritesUseCaseParams> {
  const SetupGameFavoritesUseCase({
    required this.auth,
  });

  final AuthenticationState auth;

  @override
  UseCaseResult<Object?, List<GameVM>> execute(SetupGameFavoritesUseCaseParams params) {
    final favGameIds = params.favorites.map((fav) => fav.gameId).toSet();
    return UseCaseResult.success(
      params.games.map(
        (game) {
          return GameVM(
            auth: auth,
            game: game,
            bloc: params.bloc,
            favorite: favGameIds.contains(game.id),
          );
        },
      ).toList(),
    );
  }
}
