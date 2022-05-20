@Tags(['use_case', 'games'])

import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freegamesexample/features/games/application/blocs/favorites_list.dart';
import 'package:freegamesexample/features/games/application/use_cases/fetch_all_games.dart';
import 'package:freegamesexample/features/games/presentation/view_models/game.dart';
import 'package:mocktail/mocktail.dart';

// Global elements.
import 'package:freegamesexample/application/blocs/authentication.dart';
import 'package:freegamesexample/application/services/cloud_firestore.dart';
import 'package:freegamesexample/application/services/firebase_auth.dart';
import 'package:freegamesexample/core/adapters.dart';
import 'package:freegamesexample/data/adapters/dio_adapter.dart';
import 'package:freegamesexample/data/constants.dart';
// Games feature components.
import 'package:freegamesexample/features/games/application/services/games_list.dart';
import 'package:freegamesexample/features/games/data/data_sources/games_api.dart';
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';

import '../../../../../utils.dart';

void main() {
  group('GamesList provider', () {
    late final GameApiDataSource dataSource;
    late final List<AuthenticationState> authStates;
    late final CollectionReference<FavoriteGame> favorites;

    // Mocked stuff
    late final MockFirebaseAuth firebaseAuth;
    late final MockAuthenticationBloc authBloc;
    late final MockFavoriteGamesBloc favoritesBloc;
    late final MockDioAdapter adapter;
    late final MockFavoriteGamesService favoritesService;
    late final FakeFirebaseFirestore fakeFirestore;
    late final MockAppFirestoreService appService;
    late final FetchAllGamesUseCase fetchAllGamesUseCase;

    // Set up reusable services.
    setUpAll(() {
      adapter = MockDioAdapter();
      fakeFirestore = FakeFirebaseFirestore();
      dataSource = const GameApiDataSource();
      favoritesService = MockFavoriteGamesService();
      appService = MockAppFirestoreService();
      firebaseAuth = MockFirebaseAuth(signedIn: true);
      authBloc = MockAuthenticationBloc();
      favoritesBloc = MockFavoriteGamesBloc();
      fetchAllGamesUseCase = FetchAllGamesUseCase(adapter: adapter, dataSource: dataSource);

      when(
        () => adapter.get<List<dynamic>>(
          DioAdapterOptions(
            path: dataSource.gamesEndpoint,
          ),
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
    });

    test('gamesListProvider filters the results', () async {
      final root = createContainer(
        disposeDelay: const Duration(minutes: 1),
        overrides: [
          firebaseAuthProvider.overrideWithValue(firebaseAuth),
          cloudFirestoreProvider.overrideWithValue(fakeFirestore),
          appFirestoreServiceProvider.overrideWithValue(appService),
          authenticationBlocProvider.overrideWithValue(authBloc),
          fetchAllGamesUseCaseProvider.overrideWithValue(fetchAllGamesUseCase),
        ],
      );
      final container = createContainer(
        disposeDelay: const Duration(minutes: 1),
        parent: root,
      );

      final listener = Listener<List<GameVM>>();
      container.listen<List<GameVM>>(
        gamesListProvider,
        listener,
        fireImmediately: true,
      );

      await delay(1);

      final auth = Authenticated(TestConstants.testUser);
      verify(() => listener(null, [])).called(1);
      verify(() => listener([], [])).called(1);
      verify(
        () => listener(
          [],
          TestConstants.testGames
              .map(
                (g) => GameVM(game: g, bloc: favoritesBloc, auth: auth),
              )
              .toList(),
        ),
      ).called(1);
      verifyNoMoreInteractions(listener);

      final gamesList = container.read(gamesListProvider);
      expect(gamesList.length, 3);
    });

    test('gamesListProvider favorites filter changes results', () async {
      final root = createContainer(
        disposeDelay: const Duration(minutes: 1),
        overrides: [
          firebaseAuthProvider.overrideWithValue(firebaseAuth),
          cloudFirestoreProvider.overrideWithValue(fakeFirestore),
          appFirestoreServiceProvider.overrideWithValue(appService),
          authenticationBlocProvider.overrideWithValue(authBloc),
          fetchAllGamesUseCaseProvider.overrideWithValue(fetchAllGamesUseCase),
        ],
      );
      final container = createContainer(
        disposeDelay: const Duration(minutes: 1),
        parent: root,
      );

      // Add a favorite.
      favorites.add(TestConstants.testFavorites[0]);

      await delay(1);

      final listener = Listener<List<GameVM>>();
      container.listen<List<GameVM>>(
        gamesListProvider,
        listener,
        fireImmediately: true,
      );

      await delay(1);

      final auth = Authenticated(TestConstants.testUser);
      verify(() => listener(null, [])).called(1);
      verify(
        () => listener(
          [],
          TestConstants.testGames
              .map(
                (g) => GameVM(game: g, bloc: favoritesBloc, auth: auth, favorite: g.id == 1),
              )
              .toList(),
        ),
      ).called(1);
      verifyNoMoreInteractions(listener);

      final gamesList = container.read(gamesListProvider);
      expect(gamesList.length, 3);

      // Change the filter.
      final notifier = container.read(favoriteGamesListFiltersProvider.notifier);
      notifier.state = GamesListFilter.onlyFavorites;

      await delay(1);

      verify(
        () => listener(
          TestConstants.testGames
              .map(
                (g) => GameVM(game: g, bloc: favoritesBloc, auth: auth, favorite: g.id == 1),
              )
              .toList(),
          [
            GameVM(
              game: TestConstants.kTestGame1,
              bloc: favoritesBloc,
              auth: auth,
              favorite: true,
            ),
          ],
        ),
      ).called(1);

      final newGamesList = container.read(gamesListProvider);
      expect(newGamesList.length, 1);
    });
  });
}
