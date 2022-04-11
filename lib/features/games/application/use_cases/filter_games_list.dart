import 'package:riverpod/riverpod.dart';

import 'package:freegamesexample/core/use_cases.dart';
import 'package:freegamesexample/features/games/application/blocs/favorites_list.dart';
import 'package:freegamesexample/features/games/domain/value_objects/filter_games_list.dart';
import 'package:freegamesexample/features/games/presentation/view_models/game.dart';

final filterGamesListUseCaseProvider = Provider.autoDispose((ref) {
  return const FilterGamesListUseCase();
});

class FilterGamesListUseCase extends UseCaseWithParams<Object?, List<GameVM>, FilterGamesListUseCaseParams> {
  const FilterGamesListUseCase();

  @override
  UseCaseResult<Object?, List<GameVM>> execute(FilterGamesListUseCaseParams params) {
    switch (params.filter) {
      case GamesListFilter.all:
        return UseCaseResult.success(params.games);
      case GamesListFilter.onlyFavorites:
        return UseCaseResult.success(
          params.games.where((game) => game.favorite).toList(),
        );
    }
  }
}
