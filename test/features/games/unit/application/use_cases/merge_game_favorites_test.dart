import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:riverbloc/riverbloc.dart';

import 'package:freegamesexample/application/blocs/authentication.dart';
import 'package:freegamesexample/features/games/application/blocs/favorites_list.dart';
import 'package:freegamesexample/features/games/application/use_cases/merge_game_favorites.dart';
import 'package:freegamesexample/features/games/domain/value_objects/merge_game_favorites_params.dart';
import 'package:freegamesexample/features/games/presentation/view_models/game.dart';

import '../../../../../utils.dart';

void main() {
  group('MergeGameFavoritesUseCase', () {
    late MockAuthenticationBloc auth;
    late List<AuthenticationState> authStates;
    late MergeGameFavoritesUseCaseParams params;
    late MergeGameFavoritesUseCaseParams onlyFavsParams;
    late MockFavoriteGamesBloc bloc;

    setUp(() {
      auth = MockAuthenticationBloc();
      bloc = MockFavoriteGamesBloc();
      authStates = [
        const AuthenticationState.uninitialized(),
        AuthenticationState.authenticated(TestConstants.testUser),
      ];
      whenListen(
        auth,
        Stream.fromIterable(authStates),
        initialState: const AuthenticationState.uninitialized(),
      );
      params = MergeGameFavoritesUseCaseParams(
        bloc: bloc,
        favorites: TestConstants.testFavorites,
        games: TestConstants.testGames,
      );
      onlyFavsParams = MergeGameFavoritesUseCaseParams(
        bloc: bloc,
        favorites: TestConstants.testFavorites,
        games: TestConstants.testGames,
        filter: GamesListFilter.onlyFavorites,
      );
    });

    test('can be instantiated', () async {
      final useCase = MergeGameFavoritesUseCase(auth: auth.state);
      expect(useCase, isNotNull);
    });

    test('merges games and favorites into View Models', () async {
      addTearDown(() => auth.stream.drain());
      expectLater(auth.stream, emitsInOrder(authStates));
      final useCase = MergeGameFavoritesUseCase(auth: auth.state);
      final result = useCase.execute(params);

      result.whenOrNull(success: (list) {
        // List should contain all the items and they should be GameVMs.
        expect(list.length, 3);
        expect(list, isA<List<GameVM>>());
      });
    });

    test('merges games and returns only favorites with favorites filter', () {
      addTearDown(() => auth.stream.drain());
      expectLater(auth.stream, emitsInOrder(authStates));
      final useCase = MergeGameFavoritesUseCase(auth: auth.state);
      final result = useCase.execute(onlyFavsParams);

      result.whenOrNull(success: (list) {
        // List should contain all the items and they should be GameVMs.
        expect(list.length, 1);
        expect(list, isA<List<GameVM>>());
      });
    });

    test('can read provider', () async {
      final root = createContainer();
      final container = createContainer(
        parent: root,
        overrides: [
          authenticationBlocProvider.overrideWithProvider(BlocProvider.autoDispose((ref) => auth)),
        ],
      );

      final useCase = container.read(mergeGameFavoritesUseCaseProvider);
      expect(useCase, isNotNull);
    });
  });
}
