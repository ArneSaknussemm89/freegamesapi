import 'dart:async';

import 'package:equatable/equatable.dart';
import 'package:riverpod/riverpod.dart';

import 'package:freegamesexample/application/blocs/authentication.dart';
import 'package:freegamesexample/features/games/application/blocs/favorites_list.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

typedef WaitingForBlocFunction = Future<void> Function();

final gameVMFavoriteWaiting =
    StateProvider.autoDispose.family<bool, GameVM>((ref, args) {
  return false;
});

class GameVM extends Equatable {
  const GameVM({
    required this.game,
    required this.bloc,
    required this.auth,
    this.favorite = false,
  });

  final Game game;
  final FavoriteGamesBloc bloc;
  final AuthenticationState auth;
  final bool favorite;

  void onTap(StateController<bool> controller) {
    auth.whenOrNull(
      authenticated: (user) {
        // Let's toggle the favorite.
        if (favorite) {
          bloc.add(FavoriteGamesListEvent.removeFavorite(user.uid, game));
        } else {
          bloc.add(FavoriteGamesListEvent.addFavorite(user.uid, game));
        }

        controller.state = true;
      },
    );
  }

  @override
  List<Object?> get props => [game, auth, favorite];
}
