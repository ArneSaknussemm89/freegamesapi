import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freegamesexample/core/use_cases.dart';

import 'package:freegamesexample/features/favorites/application/services/favorites_service.dart';

final removeFavoriteGamesUseCaseProvider = Provider.autoDispose<RemoveFavoriteGameUseCase>((ref) {
  final favoritesService = ref.watch(favoriteGamesServiceProvider);
  return RemoveFavoriteGameUseCase(favoritesService: favoritesService);
});

extension RemoveFavoriteGameUseCaseParamsExt on int {
  RemoveFavoriteGameUseCaseParams get toRemoveFavoriteGameUseCaseParams =>
      RemoveFavoriteGameUseCaseParams(gameId: this);
}

class RemoveFavoriteGameUseCaseParams extends Equatable {
  const RemoveFavoriteGameUseCaseParams({required this.gameId});

  final int gameId;

  @override
  List<Object?> get props => [gameId];
}

class RemoveFavoriteGameUseCase extends AsyncUseCaseWithParams<Exception, Void, RemoveFavoriteGameUseCaseParams> {
  const RemoveFavoriteGameUseCase({required this.favoritesService});

  final FavoriteGamesService favoritesService;

  @override
  Future<UseCaseResult<Exception, Void>> execute(RemoveFavoriteGameUseCaseParams params) async {
    try {
      await favoritesService.removeFavorite(params.gameId);
      return const UseCaseResult.success(kVoid);
    } on Exception catch (exception) {
      return UseCaseResult.exception(exception, StackTrace.current);
    }
  }
}
