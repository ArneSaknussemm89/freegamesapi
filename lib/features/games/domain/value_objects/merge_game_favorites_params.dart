import 'package:equatable/equatable.dart';

import 'package:freegamesexample/features/games/application/blocs/favorites_list.dart';
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

class MergeGameFavoritesUseCaseParams extends Equatable {
  const MergeGameFavoritesUseCaseParams({
    required this.favorites,
    required this.games,
    required this.bloc,
    this.filter = GamesListFilter.all,
  });

  final List<FavoriteGame> favorites;
  final List<Game> games;
  final FavoriteGamesBloc bloc;
  final GamesListFilter filter;

  @override
  List<Object?> get props => [favorites, games, bloc, filter];
}
