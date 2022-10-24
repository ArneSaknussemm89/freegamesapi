import 'package:flutter_riverpod/flutter_riverpod.dart';

// Core elements.
import 'package:freegamesexample/core/use_cases.dart';

// Games feature elements.
import 'package:freegamesexample/features/games/application/services/favorites_service.dart';
import 'package:freegamesexample/features/games/domain/value_objects/remove_favorite_game_params.dart';

final removeFavoriteGameUseCaseProvider =
    Provider.autoDispose<RemoveFavoriteGameUseCase>((ref) {
  final favoritesService = ref.watch(favoriteGamesServiceProvider);
  return RemoveFavoriteGameUseCase(favoritesService: favoritesService);
}, dependencies: [favoriteGamesServiceProvider]);

class RemoveFavoriteGameUseCase extends AsyncUseCaseWithParams<Exception, Void,
    RemoveFavoriteGameUseCaseParams> {
  const RemoveFavoriteGameUseCase({required this.favoritesService});

  final FavoriteGamesService favoritesService;

  Future<UseCaseResult<Exception, Void>> call(
      RemoveFavoriteGameUseCaseParams params) async {
    try {
      await favoritesService.removeFavorite(params.game);
      return const UseCaseResult.success(kVoid);
    } on Exception catch (exception) {
      return UseCaseResult.failure(exception, StackTrace.current);
    }
  }
}
