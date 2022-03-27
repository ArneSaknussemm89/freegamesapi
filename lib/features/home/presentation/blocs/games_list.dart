import 'package:freegamesapi/features/home/data/repositories/games.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graph_bloc/graph_bloc.dart';

import 'package:freegamesapi/features/home/domain/models/game/game.dart';
import 'package:riverbloc/riverbloc.dart';

part 'games_list.freezed.dart';

// Bloc for the state graph.
final gamesListBloc = BlocProvider.autoDispose<GamesListBloc, GamesListState>((ref) {
  final repository = ref.watch(gamesRepository);
  return GamesListBloc(repository: repository);
});

class GamesListBloc extends GraphBloc<GamesListEvent, GamesListState> {
  GamesListBloc({required this.repository}) : super(initialState: const GamesListState.loading()) {
    add(const GamesListEvent.fetchAll());
  }

  final GamesRepository repository;

  @override
  BlocStateGraph<GamesListEvent, GamesListState> get graph => BlocStateGraph(
        graph: {
          _$GamesListLoading: {
            _$GamesListFetchAll: sideEffect(handleFetchAll),
            _$GamesListLoad: transition(
              (GamesListLoad event, state) => GamesListState.loaded(event.games),
            ),
            _$GamesListHasError: transition(
              (GamesListHasError event, state) => GamesListState.error(
                event.error.toString(),
              ),
            ),
          },
          _$GamesListLoaded: {
            _$GamesListRetry: transitionWithEffect(
              (GamesListRetry event, state) => const GamesListState.loading(),
              handleFetchAll,
            ),
            // GamesListFetchMore: transitionWithEffect((GamesListFetchMore event, state) => GamesListState.loading(), handleFetchMore),
          },
          _$GamesListError: {},
        },
      );

  Future<void> handleFetchAll(_, __) async {
    final games = await repository.getAllGames();
    return add(GamesListLoad(games));
  }

  // Future<void> handleFetchMore(GamesListFetchMore event, _) async {

  // }
}

@freezed
class GamesListEvent with _$GamesListEvent {
  const factory GamesListEvent.fetchAll() = GamesListFetchAll;
  const factory GamesListEvent.load(List<Game> games) = GamesListLoad;
  const factory GamesListEvent.hasError(Object? error) = GamesListHasError;
  //const factory GamesListEvent.fetchMore() = GamesListFetchMore;
  const factory GamesListEvent.retry() = GamesListRetry;
}

@freezed
class GamesListState with _$GamesListState {
  const factory GamesListState.loading() = GamesListLoading;
  const factory GamesListState.loaded(List<Game> games) = GamesListLoaded;
  const factory GamesListState.error(String message) = GamesListError;
}
