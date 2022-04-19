import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:freegamesexample/core/use_cases.dart';
import 'package:freegamesexample/features/games/application/services/favorites_service.dart';
import 'package:freegamesexample/features/games/domain/value_objects/remove_favorite_game_params.dart';

final removeFavoriteGamesUseCaseProvider =
    Provider.autoDispose<RemoveFavoriteGameUseCase>((ref) {
  final favoritesService = ref.watch(favoriteGamesServiceProvider);
  return RemoveFavoriteGameUseCase(favoritesService: favoritesService);
}, dependencies: [favoriteGamesServiceProvider]);

class RemoveFavoriteGameUseCase extends AsyncUseCaseWithParams<Exception, Void,
    RemoveFavoriteGameUseCaseParams> {
  const RemoveFavoriteGameUseCase({required this.favoritesService});

  final FavoriteGamesService favoritesService;

  @override
  Future<UseCaseResult<Exception, Void>> execute(
      RemoveFavoriteGameUseCaseParams params) async {
    try {
      await favoritesService.removeFavorite(params.uid, params.game);
      return const UseCaseResult.success(kVoid);
    } on Exception catch (exception) {
      return UseCaseResult.failure(exception, StackTrace.current);
    }
  }
}
