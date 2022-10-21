import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'package:freegamesexample/core/use_cases.dart';
import 'package:freegamesexample/features/games/application/services/favorites_service.dart';
import 'package:freegamesexample/features/games/domain/value_objects/add_favorite_game_params.dart';

part 'add_favorite_game.g.dart';

@riverpod
class AddFavoriteGameUseCase extends _$AddFavoriteGameUseCase
    with ProviderAsyncUseCaseWithParams<Exception, Void, AddFavoriteGameUseCaseParams> {
  @override
  Future<UseCaseResult<Exception, Void>> build(AddFavoriteGameUseCaseParams params) {
    service = ref.watch(favoriteGamesServiceProvider);
    return execute(params);
  }

  late final FavoriteGamesService service;

  @override
  Future<UseCaseResult<Exception, Void>> execute(AddFavoriteGameUseCaseParams params) async {
    try {
      await service.addFavorite(params.uid, params.game);
      return const UseCaseResult.success(kVoid);
    } on Exception catch (exception) {
      return UseCaseResult.failure(exception, StackTrace.current);
    }
  }
}
