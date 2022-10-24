import 'package:riverpod_annotation/riverpod_annotation.dart';

/// Games feature elements.
import 'package:freegamesexample/features/games/data/repositories/games.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

part 'games_list.g.dart';

@riverpod
Future<List<Game>> fetchAllGames(FetchAllGamesRef ref) async {
  final repository = ref.watch(gamesRepositoryProvider);
  return await repository.getAllGames();
}
