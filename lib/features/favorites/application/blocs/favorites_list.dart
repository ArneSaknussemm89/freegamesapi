import 'dart:async';

import 'package:graph_bloc/graph_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverbloc/riverbloc.dart';

import 'package:freegamesexample/application/blocs/authentication.dart';
import 'package:freegamesexample/application/services/cloud_firestore.dart';
import 'package:freegamesexample/features/favorites/application/use_cases/add_favorite_game.dart';
import 'package:freegamesexample/features/favorites/application/use_cases/remove_favorite_game.dart';
import 'package:freegamesexample/features/favorites/presentation/view_models/favorite_game.dart';
import 'package:freegamesexample/features/favorites/domain/models/favorite.dart';
import 'package:freegamesexample/features/home/domain/models/game/game.dart';
import 'package:freegamesexample/features/home/presentation/blocs/games_list.dart';

part 'favorites_list.freezed.dart';

final favoriteGamesListBloc = BlocProvider.autoDispose<FavoriteGamesBloc, FavoriteGamesListState>(
  (ref) {
    final firestoreService = ref.watch(appFirestoreServiceProvider);
    final gamesListBloc = ref.watch(gamesListBlocProvider.notifier);
    final addFavoriteGameUseCase = ref.watch(addFavoriteGamesUseCaseProvider);
    final removeFavoriteGameUseCase = ref.watch(removeFavoriteGamesUseCaseProvider);

    return FavoriteGamesBloc(
      read: ref.read,
      firestoreService: firestoreService,
      gamesListBloc: gamesListBloc,
      addFavoriteGameUseCase: addFavoriteGameUseCase,
      removeFavoriteGameUseCase: removeFavoriteGameUseCase,
    );
  },
);

class FavoriteGamesBloc extends GraphBloc<FavoriteGamesListEvent, FavoriteGamesListState> {
  FavoriteGamesBloc({
    required this.read,
    required this.firestoreService,
    required this.gamesListBloc,
    required this.addFavoriteGameUseCase,
    required this.removeFavoriteGameUseCase,
  }) : super(initialState: const FavoriteGamesListState.loading()) {
    add(const FavoriteGamesListEvent.fetchAll());
    _gamesListSubscription = gamesListBloc.stream.listen(_handleGamesListStates);
  }

  @override
  Future<void> close() async {
    super.close();
    _gamesListSubscription.cancel();
  }

  final Reader read;
  final AppFirestoreService firestoreService;
  final GamesListBloc gamesListBloc;
  final AddFavoriteGameUseCase addFavoriteGameUseCase;
  final RemoveFavoriteGameUseCase removeFavoriteGameUseCase;

  late final StreamSubscription _gamesListSubscription;

  @override
  BlocStateGraph<FavoriteGamesListEvent, FavoriteGamesListState> get graph => BlocStateGraph(
        graph: {
          _$FavoriteGamesListLoading: {
            _$FavoriteGamesListFetchAll: sideEffect(handleFetchAll),
            _$FavoriteGamesListLoadGames: transition(
              (FavoriteGamesListLoadGames event, state) => FavoriteGamesListState.loaded(
                [],
                event.games,
              ),
            ),
            _$FavoriteGamesListLoadFavorites: transition(
              (FavoriteGamesListLoadFavorites event, state) => FavoriteGamesListState.loaded(
                event.favorites,
                [],
              ),
            ),
            _$FavoriteGamesListHasError: transition(
              (GamesListHasError event, state) => FavoriteGamesListState.error(event.error.toString()),
            ),
          },
          _$FavoriteGamesListLoaded: {
            _$FavoriteGamesListLoadGames: transition(
              (
                FavoriteGamesListLoadGames event,
                FavoriteGamesListLoaded state,
              ) =>
                  state.copyWith(games: event.games),
            ),
            _$FavoriteGamesListLoadFavorites: transition(
              (
                FavoriteGamesListLoadFavorites event,
                FavoriteGamesListLoaded state,
              ) =>
                  state.copyWith(favorites: event.favorites),
            ),
            _$FavoriteGamesListMerge: sideEffect(handleMerge),
            _$FavoriteGamesListFinishMerging: transition(
              (
                FavoriteGamesListFinishMerging event,
                FavoriteGamesListLoaded state,
              ) =>
                  state.copyWith(viewModels: event.viewModels),
            ),
            _$FavoriteGamesListAddFavorite: sideEffect(handleAddFavorite),
            _$FavoriteGamesListRemoveFavorite: sideEffect(handleRemoveFavorite),
            _$FavoriteGamesListRetry: transitionWithEffect(
              (FavoriteGamesListRetry event, state) => const FavoriteGamesListState.loading(),
              handleFetchAll,
            ),
            _$FavoriteGamesListRefresh: transitionWithEffect(
              (FavoriteGamesListRefresh event, state) => const FavoriteGamesListState.loading(),
              handleRefresh,
            ),
          },
          _$FavoriteGamesListError: {
            _$FavoriteGamesListRetry: transitionWithEffect(
              (FavoriteGamesListRetry event, state) => const FavoriteGamesListState.loading(),
              handleFetchAll,
            ),
            _$FavoriteGamesListRefresh: transitionWithEffect(
              (FavoriteGamesListRefresh event, state) => const FavoriteGamesListState.loading(),
              handleRefresh,
            ),
          },
        },
      );

  Future<void> handleFetchAll(_, __) async {
    final auth = read(authenticationBlocProvider);

    auth.whenOrNull(
      authenticated: (user) async {
        final favorites = await firestoreService.myFavorites(user.uid).get();
        final favs = favorites.docs.map((doc) => doc.data).toList();
        add(FavoriteGamesListLoadFavorites(favs));
      },
    );
  }

  void handleRefresh(_, __) async {
    final auth = read(authenticationBlocProvider);

    auth.whenOrNull(
      authenticated: (user) async {
        final favorites = await firestoreService.myFavorites(user.uid).get();
        final favs = favorites.docs.map((doc) => doc.data).toList();
        add(FavoriteGamesListLoadFavorites(favs));
        // Refresh the games list too.
        gamesListBloc.refresh();
      },
    );
  }

  void handleMerge(FavoriteGamesListMerge event, FavoriteGamesListLoaded state) {
    // We need to take the list of favorites and find the matching game and create a list of
    // view models.
    final favGameIds = state.favorites.map((fav) => fav.gameId).toSet();
    final vms = state.games.where((game) => favGameIds.contains(game.id)).toList();
    add(
      FavoriteGamesListEvent.finishMerging(
        vms
            .map(
              (game) => FavoriteGameVM(bloc: this, game: game),
            )
            .toList(),
      ),
    );
  }

  void _handleGamesListStates(GamesListState st) {
    // If the games list state is loaded, then we call the load games event.
    st.whenOrNull(
      loaded: (games) {
        add(FavoriteGamesListEvent.loadGames(games));
      },
    );
  }

  Future<void> handleAddFavorite(FavoriteGamesListAddFavorite event, __) async {
    final result = await addFavoriteGameUseCase.execute(event.gameId.toAddFavoriteGameUseCaseParams);
    result.when(
      exception: (exception, trace) {
        add(
          FavoriteGamesListEvent.hasError(
            exception.toString(),
          ),
        );
      },
      success: (success) => {},
    );
  }

  Future<void> handleRemoveFavorite(FavoriteGamesListRemoveFavorite event, __) async {
    final result = await removeFavoriteGameUseCase.execute(event.gameId.toRemoveFavoriteGameUseCaseParams);
    result.when(
      exception: (exception, trace) {
        add(
          FavoriteGamesListEvent.hasError(
            exception.toString(),
          ),
        );
      },
      success: (success) => {},
    );
  }
}

@freezed
class FavoriteGamesListEvent with _$FavoriteGamesListEvent {
  const factory FavoriteGamesListEvent.fetchAll() = FavoriteGamesListFetchAll;
  const factory FavoriteGamesListEvent.loadGames(List<Game> games) = FavoriteGamesListLoadGames;
  const factory FavoriteGamesListEvent.loadFavorites(List<FavoriteGame> favorites) = FavoriteGamesListLoadFavorites;
  // This event will trigger the update to the state to combine the list of favorites and games
  // into a list of ViewModels that combine those two.
  const factory FavoriteGamesListEvent.merge() = FavoriteGamesListMerge;
  const factory FavoriteGamesListEvent.finishMerging(List<FavoriteGameVM> viewModels) = FavoriteGamesListFinishMerging;
  const factory FavoriteGamesListEvent.addFavorite(int gameId) = FavoriteGamesListAddFavorite;
  const factory FavoriteGamesListEvent.removeFavorite(int gameId) = FavoriteGamesListRemoveFavorite;
  const factory FavoriteGamesListEvent.hasError(Object? error) = FavoriteGamesListHasError;
  const factory FavoriteGamesListEvent.retry() = FavoriteGamesListRetry;
  const factory FavoriteGamesListEvent.refresh() = FavoriteGamesListRefresh;
}

@freezed
class FavoriteGamesListState with _$FavoriteGamesListState {
  const factory FavoriteGamesListState.loading() = FavoriteGamesListLoading;
  const factory FavoriteGamesListState.loaded(
    List<FavoriteGame> favorites,
    List<Game> games, [
    @Default([]) List<FavoriteGameVM> viewModels,
  ]) = FavoriteGamesListLoaded;
  const factory FavoriteGamesListState.error(String message) = FavoriteGamesListError;
}
