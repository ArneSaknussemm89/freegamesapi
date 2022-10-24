import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:freegamesexample/core/application/providers/authentication.dart';
import 'package:freegamesexample/core/use_cases.dart';
import 'package:freegamesexample/core/data/constants.dart';
import 'package:freegamesexample/features/games/application/blocs/favorites_list.dart';
import 'package:freegamesexample/features/games/application/use_cases/filter_games_list.dart';
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';
import 'package:freegamesexample/features/games/domain/value_objects/filter_games_list_params.dart';
import 'package:freegamesexample/features/games/presentation/view_models/game.dart';

import '../../../../../utils.dart';

void main() {
  group('FilterGamesListUseCase', () {
    late FakeFirebaseFirestore fakeFirestore;
    late CollectionReference<FavoriteGame> favorites;

    setUp(() async {
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
    });

    // When all done, clear firestore.
    tearDownAll(() => clearFirestore(fakeFirestore));

    test('can be instantiated', () {
      const useCase = FilterGamesListUseCase();
      expect(useCase, isNotNull);
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
