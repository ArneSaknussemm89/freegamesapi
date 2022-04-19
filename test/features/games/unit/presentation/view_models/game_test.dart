import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverbloc/riverbloc.dart';

import 'package:freegamesexample/application/blocs/authentication.dart';
import 'package:freegamesexample/features/games/application/blocs/favorites_list.dart';
import 'package:freegamesexample/features/games/presentation/view_models/game.dart';

import '../../../../../utils.dart';

void main() {
  group('GameVM', () {
    late MockFavoriteGamesBloc bloc;
    late StateController<bool> controller;

    setUp(() {
      bloc = MockFavoriteGamesBloc();
      when(() => bloc.state).thenReturn(
        FavoriteGamesListState.loaded(
          [],
          TestConstants.testGames,
        ),
      );
      // when(
      //   () => bloc.add(
      //     FavoriteGamesListEvent.addFavorite(TestConstants.testUser.uid, TestConstants.kTestGame1),
      //   ),
      // );
      // when(
      //   () => bloc.add(
      //     FavoriteGamesListEvent.removeFavorite(TestConstants.testUser.uid, TestConstants.kTestGame1),
      //   ),
      // );
      controller = StateController(false);
    });

    test('can read provider', () {
      final root = createContainer();
      final container = createContainer(parent: root);
      final vm = GameVM(
        game: TestConstants.kTestGame1,
        bloc: bloc,
        auth: AuthenticationState.authenticated(
          TestConstants.testUser,
        ),
      );

      final isWaiting = container.read(gameVMFavoriteWaiting(vm));
      expect(isWaiting, false);
    });

    blocTest<MockFavoriteGamesBloc, FavoriteGamesListState>(
      'onTap triggers the addFavorite if not favorited',
      build: () => bloc,
      act: (b) {
        final vm = GameVM(
          game: TestConstants.kTestGame1,
          bloc: bloc,
          auth: AuthenticationState.authenticated(
            TestConstants.testUser,
          ),
        );

        vm.onTap(controller);
        verify(
          () => b.add(
            FavoriteGamesListEvent.addFavorite(TestConstants.testUser.uid, TestConstants.kTestGame1),
          ),
        ).called(1);
      },
    );

    test('onTap triggers removeFavorite if already favorited', () {
      final vm = GameVM(
        game: TestConstants.kTestGame1,
        bloc: bloc,
        auth: AuthenticationState.authenticated(
          TestConstants.testUser,
        ),
        favorite: true,
      );

      vm.onTap(controller);
      verify(
        () => bloc.add(
          FavoriteGamesListEvent.removeFavorite(TestConstants.testUser.uid, TestConstants.kTestGame1),
        ),
      ).called(1);
    });
  });
}
