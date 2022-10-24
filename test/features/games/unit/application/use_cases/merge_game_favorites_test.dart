import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:freegamesexample/core/application/providers/authentication.dart';
import 'package:freegamesexample/features/games/application/blocs/favorites_list.dart';
import 'package:freegamesexample/features/games/application/use_cases/merge_game_favorites.dart';
import 'package:freegamesexample/features/games/domain/value_objects/merge_game_favorites_params.dart';
import 'package:freegamesexample/features/games/presentation/view_models/game.dart';

import '../../../../../utils.dart';

void main() {
  group('MergeGameFavoritesUseCase', () {
    late MergeGameFavoritesUseCaseParams params;
    late MergeGameFavoritesUseCaseParams onlyFavsParams;

    setUp(() {
      
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
