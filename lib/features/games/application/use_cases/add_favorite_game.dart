// Core elements.
import 'package:freegamesexample/core/use_cases.dart';

// Game feature elements.
import 'package:freegamesexample/features/games/application/services/favorites_service.dart';
import 'package:freegamesexample/features/games/domain/value_objects/add_favorite_game_params.dart';

class AddFavoriteGameUseCase extends AsyncUseCaseWithParams<Exception, Void, AddFavoriteGameUseCaseParams> {
  const AddFavoriteGameUseCase({required this.service});

  final FavoriteGamesService service;

  Future<UseCaseResult<Exception, Void>> call(AddFavoriteGameUseCaseParams params) async {
    try {
      await service.addFavorite(params.game);
      return const UseCaseResult.success(kVoid);
    } on Exception catch (exception) {
      return UseCaseResult.failure(exception, StackTrace.current);
    }
  }
}
