import 'package:equatable/equatable.dart';

import 'package:freegamesexample/features/favorites/application/blocs/favorites_list.dart';
import 'package:freegamesexample/features/home/domain/models/game/game.dart';

class FavoriteGameVM extends Equatable {
  const FavoriteGameVM({
    required this.game,
    required this.bloc,
    this.favorite = false,
  });

  final Game game;
  final FavoriteGamesBloc bloc;
  final bool favorite;

  void onTap() {
    // Let's toggle the favorite.
    if (favorite) {
      bloc.add(FavoriteGamesListEvent.removeFavorite(game.id));
    } else {
      bloc.add(FavoriteGamesListEvent.addFavorite(game.id));
    }
  }

  @override
  List<Object?> get props => [game, favorite];
}
