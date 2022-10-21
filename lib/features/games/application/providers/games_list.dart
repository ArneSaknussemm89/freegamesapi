import 'package:riverpod_annotation/riverpod_annotation.dart';

/// Core elements.
import 'package:freegamesexample/core/use_cases.dart';

/// Games feature elements.
import 'package:freegamesexample/features/games/application/use_cases/fetch_all_games.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';
import 'package:freegamesexample/features/games/domain/value_objects/games_list_filter.dart';

part 'games_list.g.dart';

@riverpod
Future<UseCaseResult<Object?, List<Game>>> fetchGamesList(
  FetchGamesListRef ref, {
  required GamesListFilter filter,
}) async {
  final useCase = ref.watch(fetchAllGamesUseCaseProvider);
  return useCase.execute();
}
