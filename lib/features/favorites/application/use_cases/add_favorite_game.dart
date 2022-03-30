import 'package:equatable/equatable.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freegamesexample/core/use_cases.dart';

import 'package:freegamesexample/features/favorites/application/services/favorites_service.dart';

final addFavoriteGamesUseCaseProvider = Provider.autoDispose<AddFavoriteGameUseCase>((ref) {
  final favoritesService = ref.watch(favoriteGamesServiceProvider);
  return AddFavoriteGameUseCase(favoritesService: favoritesService);
});

extension AddFavoriteGameUseCaseParamsExt on int {
  AddFavoriteGameUseCaseParams get toAddFavoriteGameUseCaseParams => AddFavoriteGameUseCaseParams(gameId: this);
}

class AddFavoriteGameUseCaseParams extends Equatable {
  const AddFavoriteGameUseCaseParams({required this.gameId});

  final int gameId;

  @override
  List<Object?> get props => [gameId];
}

class AddFavoriteGameUseCase extends AsyncUseCaseWithParams<Exception, Void, AddFavoriteGameUseCaseParams> {
  const AddFavoriteGameUseCase({required this.favoritesService});

  final FavoriteGamesService favoritesService;

  @override
  Future<UseCaseResult<Exception, Void>> execute(AddFavoriteGameUseCaseParams params) async {
    try {
      await favoritesService.addFavorite(params.gameId);
      return const UseCaseResult.success(kVoid);
    } on Exception catch (exception) {
      return UseCaseResult.exception(exception, StackTrace.current);
    }
  }
}
