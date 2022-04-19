import 'package:flutter_test/flutter_test.dart';

import 'package:freegamesexample/application/blocs/authentication.dart';
import 'package:freegamesexample/features/games/application/blocs/favorites_list.dart';
import 'package:freegamesexample/features/games/domain/value_objects/filter_games_list_params.dart';
import 'package:freegamesexample/features/games/presentation/view_models/game.dart';

import '../../../../../utils.dart';

void main() {
  group('FilterGamesListUseCaseParams', () {
    late MockFavoriteGamesBloc bloc;
    late List<GameVM> viewModels;

    setUp(() {
      bloc = MockFavoriteGamesBloc();
      viewModels = TestConstants.testGames
          .map(
            (g) => GameVM(
              game: g,
              bloc: bloc,
              auth: AuthenticationState.authenticated(TestConstants.testUser),
            ),
          )
          .toList();
    });

    test('same props means identical', () {
      final params1 = FilterGamesListUseCaseParams(games: viewModels, filter: GamesListFilter.all);
      final params2 = FilterGamesListUseCaseParams(games: viewModels, filter: GamesListFilter.all);
      expect(params1, equals(params2));
    });
  });
}
