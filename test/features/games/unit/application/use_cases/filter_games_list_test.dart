import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:freegamesexample/application/blocs/authentication.dart';
import 'package:freegamesexample/core/use_cases.dart';
import 'package:freegamesexample/data/constants.dart';
import 'package:freegamesexample/features/games/application/blocs/favorites_list.dart';
import 'package:freegamesexample/features/games/application/use_cases/filter_games_list.dart';
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';
import 'package:freegamesexample/features/games/domain/value_objects/filter_games_list_params.dart';
import 'package:freegamesexample/features/games/presentation/view_models/game.dart';

import '../../../../../utils.dart';

void main() {
  group('FilterGamesListUseCase', () {
    late FakeFirebaseFirestore fakeFirestore;
    late AuthenticationBloc authBloc;
    late MockFavoriteGamesBloc bloc;
    late List<AuthenticationState> authStates;
    late List<FavoriteGamesListState> blocStates;
    late CollectionReference<FavoriteGame> favorites;

    setUp(() async {
      bloc = MockFavoriteGamesBloc();
      authBloc = MockAuthenticationBloc();

      // Set up favorites.
      fakeFirestore = FakeFirebaseFirestore();
      favorites = fakeFirestore.collection(AppConstants.favoritesFirebaseKey).withConverter<FavoriteGame>(
            fromFirestore: (snapshot, _) => FavoriteGame.fromJson(snapshot.data()!),
            toFirestore: (fav, _) => fav.toJson(),
          );

      // Add game 1 to favorites.
      favorites.add(
        FavoriteGame(
          gameId: TestConstants.kTestGame1.id,
          ownerId: TestConstants.testUser.uid,
          savedOn: DateTime.now(),
        ),
      );

      final favs = await favorites.get();

      authStates = [
        const AuthenticationState.uninitialized(),
        AuthenticationState.authenticated(TestConstants.testUser),
      ];
      blocStates = [
        const FavoriteGamesListState.loading(),
        FavoriteGamesListState.loaded(favs.docs.map((s) => s.data()).toList(), TestConstants.testGames),
      ];

      whenListen(
        authBloc,
        Stream.fromIterable(authStates),
        initialState: const AuthenticationState.uninitialized(),
      );
      whenListen(
        bloc,
        Stream.fromIterable(blocStates),
        initialState: const FavoriteGamesListState.loading(),
      );
    });

    // When all done, clear firestore.
    tearDownAll(() => clearFirestore(fakeFirestore));

    test('can be instantiated', () {
      const useCase = FilterGamesListUseCase();
      expect(useCase, isNotNull);
    });

    test('all filter shows all games', () async {
      addTearDown(() async {
        await authBloc.stream.drain();
        await bloc.stream.drain();
      });

      // Make sure the states are correct.
      final favs = await favorites.get();
      final f = favs.docs.map((s) => s.data().gameId).toSet();

      await expectLater(authBloc.stream, emitsInOrder(authStates));
      await expectLater(bloc.stream, emitsInOrder(blocStates));

      final viewModels = TestConstants.testGames
          .map(
            (game) => GameVM(
              auth: authBloc.state,
              bloc: bloc,
              game: game,
              favorite: f.contains(game.id),
            ),
          )
          .toList();

      const useCase = FilterGamesListUseCase();
      final params = FilterGamesListUseCaseParams(games: viewModels, filter: GamesListFilter.all);
      final result = useCase.execute(params);

      expect(result, isA<UseCaseResultSuccess<Object?, List<GameVM>>>());

      result.whenOrNull(success: (list) {
        expect(list.length, 3);
      });
    });

    test('favorites filter only shows favorites', () async {
      addTearDown(() async {
        await authBloc.stream.drain();
        await bloc.stream.drain();
      });

      // Make sure the states are correct.
      final favs = await favorites.get();
      final f = favs.docs.map((s) => s.data().gameId).toSet();

      await expectLater(authBloc.stream, emitsInOrder(authStates));
      await expectLater(bloc.stream, emitsInOrder(blocStates));

      final viewModels = TestConstants.testGames
          .map(
            (game) => GameVM(
              auth: authBloc.state,
              bloc: bloc,
              game: game,
              favorite: f.contains(game.id),
            ),
          )
          .toList();

      const useCase = FilterGamesListUseCase();
      final params = FilterGamesListUseCaseParams(games: viewModels, filter: GamesListFilter.onlyFavorites);
      final result = useCase.execute(params);

      expect(result, isA<UseCaseResultSuccess<Object?, List<GameVM>>>());

      result.whenOrNull(success: (list) {
        expect(list.length, 1);
      });
    });

    test('can read provider', () {
      final root = createContainer();
      final container = createContainer(parent: root);

      final useCase = container.read(filterGamesListUseCaseProvider);
      expect(useCase, isNotNull);
      expect(useCase, const FilterGamesListUseCase()); // No params so it should match the const.
    });
  });
}
