import 'package:equatable/equatable.dart';

import 'package:freegamesexample/features/games/domain/models/game/game.dart';

class AddFavoriteGameUseCaseParams extends Equatable {
  const AddFavoriteGameUseCaseParams({required this.uid, required this.game});

  final String uid;
  final Game game;

  @override
  List<Object?> get props => [uid, game];
}
