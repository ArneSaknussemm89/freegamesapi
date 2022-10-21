// import 'package:riverpod/riverpod.dart';

// import 'package:freegamesexample/features/games/application/blocs/favorites_list.dart';
// import 'package:freegamesexample/features/games/application/use_cases/filter_games_list.dart';
// import 'package:freegamesexample/features/games/domain/value_objects/filter_games_list_params.dart';
// import 'package:freegamesexample/features/games/presentation/view_models/game.dart';

// /// This provider combines the state from the Bloc and the Filter from the filter
// /// provider and then runs the filter use case to get the filtered games (or not).
// final gamesListProvider = Provider.autoDispose<List<GameVM>>((ref) {
//   final state = ref.watch(favoriteGamesListBlocProvider);
//   final filter = ref.watch(favoriteGamesListFiltersProvider);
//   final filterGamesListUseCase = ref.watch(filterGamesListUseCaseProvider);

//   return state.when(
//     loading: () => [],
//     loaded: (favorites, games, vms) {
//       final result = filterGamesListUseCase.execute(FilterGamesListUseCaseParams(
//         games: vms,
//         filter: filter,
//       ));
//       return result.when(
//         failure: (error, trace) => [],
//         success: (viewModels) => viewModels,
//       );
//     },
//     error: (error) => [],
//   );
// });
