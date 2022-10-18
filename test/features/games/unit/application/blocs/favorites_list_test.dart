import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverbloc/riverbloc.dart';
import 'package:supercharged/supercharged.dart';

// Global feature elements.
import 'package:freegamesexample/application/blocs/authentication.dart';
import 'package:freegamesexample/application/services/cloud_firestore.dart';
import 'package:freegamesexample/application/services/firebase_auth.dart';
import 'package:freegamesexample/core/adapters.dart';
import 'package:freegamesexample/data/adapters/dio_adapter.dart';
import 'package:freegamesexample/data/constants.dart';

// Games feature elements.
import 'package:freegamesexample/features/games/application/blocs/favorites_list.dart';
import 'package:freegamesexample/features/games/application/use_cases/add_favorite_game.dart';
import 'package:freegamesexample/features/games/application/use_cases/fetch_all_games.dart';
import 'package:freegamesexample/features/games/application/use_cases/fetch_user_favorites.dart';
import 'package:freegamesexample/features/games/application/use_cases/merge_game_favorites.dart';
import 'package:freegamesexample/features/games/application/use_cases/remove_favorite_game.dart';
import 'package:freegamesexample/features/games/data/data_sources/games_api.dart';
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';
import 'package:freegamesexample/features/games/presentation/view_models/game.dart';

import '../../../../../utils.dart';

const kTestFavoriteGamesBlocErrorMessage = 'Failed fetching favorite games.';
FavoriteGamesListState getTestGamesListState(FavoriteGamesBloc bloc, AuthenticationBloc authBloc) =>
    FavoriteGamesListState.loaded(
      [],
      TestConstants.testGames,
      TestConstants.testGames
          .map(
            (g) => GameVM(
              game: g,
              bloc: bloc,
              auth: authBloc.state,
            ),
          )
          .toList(),
    );
void main() {
  group('FavoriteGamesBloc', () {
    final Listener<FavoriteGamesListState> listener = Listener<FavoriteGamesListState>();

    // Variables initialized for each test.
    late ProviderContainer container;
    late GameApiDataSource dataSource;
    late List<AuthenticationState> authStates;
    late CollectionReference<FavoriteGame> favorites;

    // Use cases used by bloc.
    late AddFavoriteGameUseCase addFavoriteGameUseCase;
    late RemoveFavoriteGameUseCase removeFavoriteGameUseCase;
    late FetchUserFavoritesUseCase fetchUserFavoritesUseCase;
    late MergeGameFavoritesUseCase mergeGameFavoritesUseCase;
    late FetchAllGamesUseCase fetchAllGamesUseCase;

    // Mocked stuff
    late MockFirebaseAuth auth;
    late MockAuthenticationBloc authBloc;
    late MockDioAdapter adapter;
    late MockFavoriteGamesService favoritesService;
    late FakeFirebaseFirestore fakeFirestore;
    late MockAppFirestoreService appService;

    // Set up reusable services.
    setUpAll(() {
      adapter = MockDioAdapter();
      fakeFirestore = FakeFirebaseFirestore();
      dataSource = const GameApiDataSource();
      favoritesService = MockFavoriteGamesService();
      appService = MockAppFirestoreService();
      auth = MockFirebaseAuth(signedIn: true);
      authBloc = MockAuthenticationBloc();

      when(
        () => adapter.get<List<dynamic>>(
          DioAdapterOptions(path: dataSource.gamesEndpoint),
        ),
      ).thenAnswer((_) async {
        return AdapterResponse.success(TestConstants.testSerializedGames);
      });

      authStates = [
        const AuthenticationState.uninitialized(),
        AuthenticationState.authenticated(TestConstants.testUser),
      ];

      whenListen(
        authBloc,
        Stream.fromIterable(authStates),
        initialState: const AuthenticationState.uninitialized(),
      );

      favorites = fakeFirestore.collection(AppConstants.favoritesFirebaseKey).withConverter<FavoriteGame>(
            fromFirestore: (snapshot, _) => FavoriteGame.fromJson(snapshot.data()!),
            toFirestore: (fav, _) => fav.toJson(),
          );

      when(() => appService.firestore).thenReturn(fakeFirestore);
      when(() => appService.favorites).thenReturn(favorites);
      when(() => favoritesService.appFirestore).thenReturn(appService);
      when(() => favoritesService.addFavorite(TestConstants.testUser.uid, TestConstants.kTestGame1)).thenAnswer(
        (_) async {
          favorites.add(
            FavoriteGame(
              gameId: TestConstants.kTestGame1.id,
              ownerId: TestConstants.testUser.uid,
              savedOn: TestConstants.kTestDateTime,
            ),
          );
        },
      );
      when(() => favoritesService.removeFavorite(TestConstants.testUser.uid, TestConstants.kTestGame1)).thenAnswer(
        (_) async {
          final favs = await favorites
              .where('ownerId', isEqualTo: TestConstants.kTestGame1.id)
              .where('gameId', isEqualTo: TestConstants.kTestGame1.id)
              .get();
          await Future.forEach<QueryDocumentSnapshot<FavoriteGame>>(
            favs.docs,
            (doc) async => await doc.reference.delete(),
          );
        },
      );

      addFavoriteGameUseCase = AddFavoriteGameUseCase(favoritesService: favoritesService);
      removeFavoriteGameUseCase = RemoveFavoriteGameUseCase(favoritesService: favoritesService);
      fetchUserFavoritesUseCase = FetchUserFavoritesUseCase(firestoreService: appService);
      mergeGameFavoritesUseCase = MergeGameFavoritesUseCase(
        auth: AuthenticationState.authenticated(TestConstants.testUser),
      );
      fetchAllGamesUseCase = FetchAllGamesUseCase(adapter: adapter, dataSource: dataSource);
    });

    // Set up fresh provider containers.
    setUp(() async {
      final root = createContainer();
      container = createContainer(
        parent: root,
        overrides: [
          firebaseAuthProvider.overrideWithValue(auth),
          cloudFirestoreProvider.overrideWithValue(fakeFirestore),
          appFirestoreServiceProvider.overrideWithValue(appService),
          authenticationBlocProvider.overrideWithValue(authBloc),
          addFavoriteGameUseCaseProvider.overrideWithValue(addFavoriteGameUseCase),
          removeFavoriteGameUseCaseProvider.overrideWithValue(removeFavoriteGameUseCase),
          fetchUserFavoritesUseCaseProvider.overrideWithValue(fetchUserFavoritesUseCase),
          mergeGameFavoritesUseCaseProvider.overrideWithValue(mergeGameFavoritesUseCase),
          fetchAllGamesUseCaseProvider.overrideWithValue(fetchAllGamesUseCase),
        ],
      );
    });

    tearDown(() {
      container.dispose();
      fakeFirestore.dump();
    });

    test('can read provider', () async {
      final b = container.read(favoriteGamesListBlocProvider.notifier);
      final state = container.read(favoriteGamesListBlocProvider);
      await delayMilliseconds(16);
      expect(state, isNotNull);
      expect(state, isA<FavoriteGamesListLoading>());
      expect(b, isNotNull);
    });

    test('adding add favorite event should call handleAddFavorite', () async {
      final sub = container.listen<FavoriteGamesListState>(favoriteGamesListBlocProvider, listener);
      final bloc = container.read(favoriteGamesListBlocProvider.notifier);

      expect(sub.read(), isA<FavoriteGamesListLoading>());

      final event = FavoriteGamesListEvent.addFavorite(
        TestConstants.testUser.uid,
        TestConstants.kTestGame1,
      );
      bloc.add(event);
      await delayMilliseconds(16);
      expect(bloc.state, isA<FavoriteGamesListLoaded>());

      sub.close();
    });

    test('intializing should load games and favorites', () async {
      final sub = container.listen<FavoriteGamesListState>(favoriteGamesListBlocProvider, listener);
      // Build provider.
      container.read(favoriteGamesListBlocProvider);

      // Wait for futures.
      await delayMilliseconds(16);

      final updated = container.read(favoriteGamesListBlocProvider);
      expect(updated, isA<FavoriteGamesListLoaded>());
      sub.close();
    });

    test('refresh event should refresh the list of games and favorites', () async {
      // Set up states watcher.
      List<FavoriteGamesListState> states = [];
      // Create listener that fills the states.
      final sub = container.listen<FavoriteGamesListState>(favoriteGamesListBlocProvider, (prev, next) {
        states.add(next);
      });
      final bloc = container.read(favoriteGamesListBlocProvider.notifier);
      await delayMilliseconds(16);

      // Re-read
      container.read(favoriteGamesListBlocProvider);
      expect(states.last, isA<FavoriteGamesListLoaded>());
      // Clear states list.
      states.clear();
      // Refresh bloc.
      bloc.add(const FavoriteGamesListEvent.refresh());
      container.read(favoriteGamesListBlocProvider);
      await delayMilliseconds(16);
      expect(
        states.last,
        equals(
          FavoriteGamesListState.loaded(
            [],
            TestConstants.testGames,
            TestConstants.testGames
                .map(
                  (g) => GameVM(
                    game: g,
                    bloc: bloc,
                    auth: authBloc.state,
                  ),
                )
                .toList(),
          ),
        ),
      );

      sub.close();
    });

    test('set error event should set error state', () async {
      final sub = container.listen(favoriteGamesListBlocProvider, listener);
      // Build provider.
      container.read(favoriteGamesListBlocProvider);

      // Wait for futures.
      await delayMilliseconds(16);

      final updated = container.read(favoriteGamesListBlocProvider);
      expect(updated, isA<FavoriteGamesListLoaded>());

      container.read(favoriteGamesListBlocProvider.notifier).add(
            FavoriteGamesListEvent.hasError(
              Exception(kTestFavoriteGamesBlocErrorMessage),
            ),
          );

      await delayMilliseconds(16);
      final state = container.read(favoriteGamesListBlocProvider);
      expect(state, isA<FavoriteGamesListError>());
      sub.close();
    });

    test('set error event should set error state', () async {
      final states = <FavoriteGamesListState>[];
      final sub = container.listen<FavoriteGamesListState>(
        favoriteGamesListBlocProvider,
        (prev, next) {
          states.add(next);
        },
      );
      // Build provider.
      container.read(favoriteGamesListBlocProvider);

      // Wait for futures.
      await delayMilliseconds(16);

      final updated = container.read(favoriteGamesListBlocProvider);
      expect(updated, isA<FavoriteGamesListLoaded>());

      container.read(favoriteGamesListBlocProvider.notifier).add(
            FavoriteGamesListEvent.hasError(
              Exception(kTestFavoriteGamesBlocErrorMessage),
            ),
          );

      container.read(favoriteGamesListBlocProvider);
      await delayMilliseconds(16);
      expect(states.last, isA<FavoriteGamesListError>());
      sub.close();
    });
  });
}
