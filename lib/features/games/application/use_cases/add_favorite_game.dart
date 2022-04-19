import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:freegamesexample/core/use_cases.dart';
import 'package:freegamesexample/features/games/application/services/favorites_service.dart';
import 'package:freegamesexample/features/games/domain/value_objects/add_favorite_game_params.dart';

final addFavoriteGamesUseCaseProvider =
    Provider.autoDispose<AddFavoriteGameUseCase>((ref) {
  final favoritesService = ref.watch(favoriteGamesServiceProvider);
  return AddFavoriteGameUseCase(favoritesService: favoritesService);
}, dependencies: [favoriteGamesServiceProvider]);

class AddFavoriteGameUseCase extends AsyncUseCaseWithParams<Exception, Void,
    AddFavoriteGameUseCaseParams> {
  const AddFavoriteGameUseCase({required this.favoritesService});

  final FavoriteGamesService favoritesService;

  @override
  Future<UseCaseResult<Exception, Void>> execute(
      AddFavoriteGameUseCaseParams params) async {
    try {
      await favoritesService.addFavorite(params.uid, params.game);
      return const UseCaseResult.success(kVoid);
    } on Exception catch (exception) {
      return UseCaseResult.failure(exception, StackTrace.current);
    }
  }
}
