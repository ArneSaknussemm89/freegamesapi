import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverbloc/riverbloc.dart';

import 'package:freegamesexample/application/blocs/authentication.dart';
import 'package:freegamesexample/application/services/cloud_firestore.dart';
import 'package:freegamesexample/application/services/firebase_auth.dart';
import 'package:freegamesexample/core/adapters.dart';
import 'package:freegamesexample/data/adapters/dio_adapter.dart';
import 'package:freegamesexample/data/constants.dart';
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

void main() {
  group('FavoriteGamesBloc', () {
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
        ],
      );
    });

    tearDown(() {
      container.dispose();
    });

    test('can read provider', () async {
      final c = createContainer(
        overrides: [
          firebaseAuthProvider.overrideWithValue(auth),
          cloudFirestoreProvider.overrideWithValue(fakeFirestore),
          appFirestoreServiceProvider.overrideWithValue(appService),
          authenticationBlocProvider.overrideWithValue(authBloc),
        ],
      );
      final b = c.read(favoriteGamesListBlocProvider.notifier);
      final state = c.read(favoriteGamesListBlocProvider);
      await delay(1);
      expect(state, isNotNull);
      expect(state, isA<FavoriteGamesListLoading>());
      expect(b, isNotNull);
    });

    test('can read filter provider', () {
      final c = createContainer();
      final filter = c.read(favoriteGamesListFiltersProvider);
      expect(filter, GamesListFilter.all);
    });

    test('adding add favorite event should call handleAddFavorite', () async {
      final root = createContainer(
        overrides: [
          firebaseAuthProvider.overrideWithValue(auth),
          cloudFirestoreProvider.overrideWithValue(fakeFirestore),
          appFirestoreServiceProvider.overrideWithValue(appService),
          authenticationBlocProvider.overrideWithValue(authBloc),
        ],
      );
      final c = createContainer(
        parent: root,
      );

      final listener = Listener<FavoriteGamesListState>();
      final sub = c.listen<FavoriteGamesListState>(favoriteGamesListBlocProvider, listener);
      final bloc = c.read(favoriteGamesListBlocProvider.notifier);

      expect(sub.read(), isA<FavoriteGamesListLoading>());

      final FavoriteGamesListAddFavorite event = FavoriteGamesListEvent.addFavorite(
        TestConstants.testUser.uid,
        TestConstants.kTestGame1,
      ) as FavoriteGamesListAddFavorite;
      await bloc.handleAddFavorite(event, null);
      await delay(1);
      expect(bloc.state, isA<FavoriteGamesListLoaded>());

      sub.close();
    });

    test('adding remove favorite event should call handleRemoveFavorite', () async {
      final root = createContainer(
        overrides: [
          firebaseAuthProvider.overrideWithValue(auth),
          cloudFirestoreProvider.overrideWithValue(fakeFirestore),
          appFirestoreServiceProvider.overrideWithValue(appService),
          authenticationBlocProvider.overrideWithValue(authBloc),
        ],
      );
      final c = createContainer(
        parent: root,
      );

      final listener = Listener<FavoriteGamesListState>();
      final sub = c.listen<FavoriteGamesListState>(favoriteGamesListBlocProvider, listener);
      final bloc = c.read(favoriteGamesListBlocProvider.notifier);

      expect(sub.read(), isA<FavoriteGamesListLoading>());

      final event = FavoriteGamesListEvent.removeFavorite(
        TestConstants.testUser.uid,
        TestConstants.kTestGame1,
      ) as FavoriteGamesListRemoveFavorite;
      await bloc.handleRemoveFavorite(event, null);
      await delay(1);
      expect(bloc.state, isA<FavoriteGamesListLoaded>());

      sub.close();
    });

    blocTest<FavoriteGamesBloc, FavoriteGamesListState>(
      'intializing should load games and favorites',
      build: () => FavoriteGamesBloc(
        read: container.read,
        firestoreService: appService,
        addFavoriteGameUseCase: addFavoriteGameUseCase,
        removeFavoriteGameUseCase: removeFavoriteGameUseCase,
        fetchUserFavoritesUseCase: fetchUserFavoritesUseCase,
        mergeGameFavoritesUseCase: mergeGameFavoritesUseCase,
        fetchAllGamesUseCase: fetchAllGamesUseCase,
      ),
      verify: (bloc) => [
        // Two states, one for loading games and one for loading favorites.
        const FavoriteGamesListState.loading(),
        const FavoriteGamesListState.loaded([], []),
        FavoriteGamesListState.loaded([], TestConstants.testGames),
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
      ],
    );

    blocTest<FavoriteGamesBloc, FavoriteGamesListState>(
      'refresh event should refresh the list of games and favorites',
      build: () => FavoriteGamesBloc(
        read: container.read,
        firestoreService: appService,
        addFavoriteGameUseCase: addFavoriteGameUseCase,
        removeFavoriteGameUseCase: removeFavoriteGameUseCase,
        fetchUserFavoritesUseCase: fetchUserFavoritesUseCase,
        mergeGameFavoritesUseCase: mergeGameFavoritesUseCase,
        fetchAllGamesUseCase: fetchAllGamesUseCase,
      ),
      seed: () => FavoriteGamesListState.loaded(
        [],
        TestConstants.testGames,
      ),
      act: (b) => b.add(const FavoriteGamesListEvent.refresh()),
      verify: (bloc) => [
        // Starting seeded state, and then refresh should trigger a couple.
        FavoriteGamesListState.loaded([], TestConstants.testGames),
        const FavoriteGamesListState.loading(),
        FavoriteGamesListState.loaded([], TestConstants.testGames),
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
      ],
    );

    blocTest<FavoriteGamesBloc, FavoriteGamesListState>(
      'set error event should set error state',
      build: () => FavoriteGamesBloc(
        read: container.read,
        firestoreService: appService,
        addFavoriteGameUseCase: addFavoriteGameUseCase,
        removeFavoriteGameUseCase: removeFavoriteGameUseCase,
        fetchUserFavoritesUseCase: fetchUserFavoritesUseCase,
        mergeGameFavoritesUseCase: mergeGameFavoritesUseCase,
        fetchAllGamesUseCase: fetchAllGamesUseCase,
      ),
      seed: () => const FavoriteGamesListState.loading(),
      act: (b) => b.add(const FavoriteGamesListEvent.hasError(kTestFavoriteGamesBlocErrorMessage)),
      verify: (bloc) => [
        // Starting seeded state, and then refresh should trigger a couple.
        const FavoriteGamesListState.loading(),
        const FavoriteGamesListState.error(kTestFavoriteGamesBlocErrorMessage),
      ],
    );

    blocTest<FavoriteGamesBloc, FavoriteGamesListState>(
      'adding add favorite event should refresh the states',
      build: () => FavoriteGamesBloc(
        read: container.read,
        firestoreService: appService,
        addFavoriteGameUseCase: addFavoriteGameUseCase,
        removeFavoriteGameUseCase: removeFavoriteGameUseCase,
        fetchUserFavoritesUseCase: fetchUserFavoritesUseCase,
        mergeGameFavoritesUseCase: mergeGameFavoritesUseCase,
        fetchAllGamesUseCase: fetchAllGamesUseCase,
      ),
      seed: () => const FavoriteGamesListState.loading(),
      act: (b) => b.add(FavoriteGamesListEvent.addFavorite(TestConstants.testUser.uid, TestConstants.kTestGame1)),
      verify: (bloc) {
        return [
          // Starting seeded state, and then refresh should trigger a couple.
          const FavoriteGamesListState.loading(),
          FavoriteGamesListState.loaded([], TestConstants.testGames),
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
        ];
      },
    );
  });
}
