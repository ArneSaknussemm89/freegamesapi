import 'package:equatable/equatable.dart';

import 'package:freegamesexample/features/games/application/blocs/favorites_list.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

class FilterGamesListUseCaseParams extends Equatable {
  const FilterGamesListUseCaseParams({
    required this.games,
    required this.filter,
  });

  final List<Game> games;
  final GamesListFilter filter;

  @override
  List<Object?> get props => [games, filter];
}
