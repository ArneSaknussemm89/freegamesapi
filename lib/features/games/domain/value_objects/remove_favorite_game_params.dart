import 'package:equatable/equatable.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

class RemoveFavoriteGameUseCaseParams extends Equatable {
  const RemoveFavoriteGameUseCaseParams(
      {required this.uid, required this.game});

  final String uid;
  final Game game;

  @override
  List<Object?> get props => [uid, game];
}
