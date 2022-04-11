import 'dart:async';

import 'package:freegamesexample/features/games/application/use_cases/fetch_all_games.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:graph_bloc/graph_bloc.dart';
import 'package:riverbloc/riverbloc.dart';

/// Global application elements.
import 'package:freegamesexample/application/blocs/authentication.dart';
import 'package:freegamesexample/application/services/cloud_firestore.dart';

/// Feature application elements.
import 'package:freegamesexample/features/games/application/use_cases/add_favorite_game.dart';
import 'package:freegamesexample/features/games/application/use_cases/fetch_user_favorites.dart';
import 'package:freegamesexample/features/games/application/use_cases/merge_game_favorites.dart';
import 'package:freegamesexample/features/games/application/use_cases/remove_favorite_game.dart';

/// Feature domain elements.
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';
import 'package:freegamesexample/features/games/domain/value_objects/add_favorite_game_params.dart';
import 'package:freegamesexample/features/games/domain/value_objects/fetch_user_favorites_params.dart';
import 'package:freegamesexample/features/games/domain/value_objects/merge_game_favorites_params.dart';
import 'package:freegamesexample/features/games/domain/value_objects/remove_favorite_game_params.dart';

/// Feature presentation elements.
import 'package:freegamesexample/features/games/presentation/view_models/game.dart';

part 'favorites_list.freezed.dart';

enum GamesListFilter {
  all,
  onlyFavorites,
}

final favoriteGamesListFiltersProvider = StateProvider.autoDispose<GamesListFilter>((ref) {
  return GamesListFilter.all;
});

final favoriteGamesListBloc = BlocProvider.autoDispose<FavoriteGamesBloc, FavoriteGamesListState>(
  (ref) {
    final firestoreService = ref.watch(appFirestoreServiceProvider);
    final addFavoriteGameUseCase = ref.watch(addFavoriteGamesUseCaseProvider);
    final removeFavoriteGameUseCase = ref.watch(removeFavoriteGamesUseCaseProvider);
    final fetchUserFavoritesUseCase = ref.watch(fetchUserFavoritesUseCaseProvider);
    final mergeGameFavoritesUseCase = ref.watch(mergeGameFavoritesUseCaseProvider);
    final fetchAllGamesUseCase = ref.watch(fetchAllGamesUseCaseProvider);

    final bloc = FavoriteGamesBloc(
      read: ref.read,
      firestoreService: firestoreService,
      addFavoriteGameUseCase: addFavoriteGameUseCase,
      removeFavoriteGameUseCase: removeFavoriteGameUseCase,
      fetchUserFavoritesUseCase: fetchUserFavoritesUseCase,
      mergeGameFavoritesUseCase: mergeGameFavoritesUseCase,
      fetchAllGamesUseCase: fetchAllGamesUseCase,
    );
    ref.maintainState = true;

    return bloc;
  },
);

class FavoriteGamesBloc extends GraphBloc<FavoriteGamesListEvent, FavoriteGamesListState> {
  FavoriteGamesBloc({
    required this.read,
    required this.firestoreService,
    required this.addFavoriteGameUseCase,
    required this.removeFavoriteGameUseCase,
    required this.fetchUserFavoritesUseCase,
    required this.mergeGameFavoritesUseCase,
    required this.fetchAllGamesUseCase,
  }) : super(initialState: const FavoriteGamesListState.loading()) {
    add(const FavoriteGamesListEvent.fetchAll());
    _favoritesSubscription = firestoreService.favorites.snapshots().listen((event) {
      add(const FavoriteGamesListEvent.fetchFavorites());
    });
  }

  final Reader read;
  final AppFirestoreService firestoreService;
  final AddFavoriteGameUseCase addFavoriteGameUseCase;
  final RemoveFavoriteGameUseCase removeFavoriteGameUseCase;
  final FetchUserFavoritesUseCase fetchUserFavoritesUseCase;
  final MergeGameFavoritesUseCase mergeGameFavoritesUseCase;
  final FetchAllGamesUseCase fetchAllGamesUseCase;

  late final StreamSubscription _favoritesSubscription;

  @override
  Future<void> close() async {
    _favoritesSubscription.cancel();
    super.close();
  }

  @override
  BlocStateGraph<FavoriteGamesListEvent, FavoriteGamesListState> get graph => BlocStateGraph(
        graph: {
          _$FavoriteGamesListLoading: {
            _$FavoriteGamesListFetchAll: sideEffect(handleFetchAll),
            _$FavoriteGamesListFetchFavorites: sideEffect(handleFetchFavorites),
            _$FavoriteGamesListFetchGames: sideEffect(handleFetchGames),
            _$FavoriteGamesListSetGames: transition(
              (FavoriteGamesListSetGames event, state) => FavoriteGamesListState.loaded(
                [],
                event.games,
              ),
            ),
            _$FavoriteGamesListSetFavorites: transition(
              (FavoriteGamesListSetFavorites event, state) => FavoriteGamesListState.loaded(
                event.favorites,
                [],
              ),
            ),
            _$FavoriteGamesListHasError: transition(
              (FavoriteGamesListHasError event, state) => FavoriteGamesListState.error(event.error.toString()),
            ),
          },
          _$FavoriteGamesListLoaded: {
            _$FavoriteGamesListFetchFavorites: sideEffect(handleFetchFavorites),
            _$FavoriteGamesListFetchGames: sideEffect(handleFetchGames),
            _$FavoriteGamesListSetGames: transitionWithEffect(
              (
                FavoriteGamesListSetGames event,
                FavoriteGamesListLoaded state,
              ) =>
                  state.copyWith(games: event.games),
              (event, state) => add(const FavoriteGamesListEvent.merge()),
            ),
            _$FavoriteGamesListSetFavorites: transitionWithEffect(
              (
                FavoriteGamesListSetFavorites event,
                FavoriteGamesListLoaded state,
              ) =>
                  state.copyWith(favorites: event.favorites),
              (event, state) => add(const FavoriteGamesListEvent.merge()),
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
        handleFetchFavorites(_, __);

        // Now run fetch all games.
        handleFetchGames(_, __);
      },
    );
  }

  Future<void> handleFetchGames(_, __) async {
    // Now run fetch all games.
    final allGamesResult = await fetchAllGamesUseCase.execute();
    allGamesResult.when(
      success: (games) => add(
        FavoriteGamesListEvent.setGames(games),
      ),
      failure: (error, trace) => add(
        FavoriteGamesListEvent.hasError(error),
      ),
    );
  }

  Future<void> handleFetchFavorites(_, __) async {
    final auth = read(authenticationBlocProvider);

    auth.whenOrNull(
      authenticated: (user) async {
        final result = await fetchUserFavoritesUseCase.execute(user.uid.toFetchUserFavoritesUseCaseParams);
        result.when(
          success: (favorites) {
            if (!isClosed) {
              add(FavoriteGamesListEvent.setFavorites(favorites));
            }
          },
          failure: (error, trace) => add(
            FavoriteGamesListEvent.hasError(error),
          ),
        );
      },
    );
  }

  Future<void> handleRefresh(_, __) async {
    final auth = read(authenticationBlocProvider);

    auth.whenOrNull(
      authenticated: (user) async {
        final result = await fetchUserFavoritesUseCase.execute(user.uid.toFetchUserFavoritesUseCaseParams);
        result.when(
          success: (favorites) => add(
            FavoriteGamesListEvent.setFavorites(favorites),
          ),
          failure: (error, trace) => add(
            FavoriteGamesListEvent.hasError(error),
          ),
        );
      },
    );
  }

  void handleMerge(FavoriteGamesListMerge event, FavoriteGamesListLoaded state) {
    mergeGameFavoritesUseCase
        .execute(
          MergeGameFavoritesUseCaseParams(
            favorites: state.favorites,
            games: state.games,
            bloc: this,
          ),
        )
        .when(
          success: (vms) => add(FavoriteGamesListEvent.finishMerging(vms)),
          failure: (error, trace) => add(FavoriteGamesListEvent.hasError(error)),
        );
  }

  Future<void> handleAddFavorite(FavoriteGamesListAddFavorite event, __) async {
    final result = await addFavoriteGameUseCase.execute(
      AddFavoriteGameUseCaseParams(
        uid: event.uid,
        game: event.game,
      ),
    );
    result.when(
      failure: (exception, trace) {
        add(
          FavoriteGamesListEvent.hasError(
            exception.toString(),
          ),
        );
      },
      success: (success) => add(const FavoriteGamesListEvent.fetchFavorites()),
    );
  }

  Future<void> handleRemoveFavorite(FavoriteGamesListRemoveFavorite event, __) async {
    final result = await removeFavoriteGameUseCase.execute(
      RemoveFavoriteGameUseCaseParams(
        uid: event.uid,
        game: event.game,
      ),
    );
    result.when(
      failure: (exception, trace) {
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
  const factory FavoriteGamesListEvent.fetchGames() = FavoriteGamesListFetchGames;
  const factory FavoriteGamesListEvent.fetchFavorites() = FavoriteGamesListFetchFavorites;
  const factory FavoriteGamesListEvent.setGames(List<Game> games) = FavoriteGamesListSetGames;
  const factory FavoriteGamesListEvent.setFavorites(List<FavoriteGame> favorites) = FavoriteGamesListSetFavorites;
  // This event will trigger the update to the state to combine the list of favorites and games
  // into a list of ViewModels that combine those two.
  const factory FavoriteGamesListEvent.merge() = FavoriteGamesListMerge;
  const factory FavoriteGamesListEvent.finishMerging(List<GameVM> viewModels) = FavoriteGamesListFinishMerging;
  const factory FavoriteGamesListEvent.addFavorite(String uid, Game game) = FavoriteGamesListAddFavorite;
  const factory FavoriteGamesListEvent.removeFavorite(String uid, Game game) = FavoriteGamesListRemoveFavorite;
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
    @Default([]) List<GameVM> viewModels,
  ]) = FavoriteGamesListLoaded;
  const factory FavoriteGamesListState.error(String message) = FavoriteGamesListError;
}
