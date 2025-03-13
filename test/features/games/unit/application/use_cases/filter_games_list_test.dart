import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:freegamesexample/core/data/constants.dart';
import 'package:freegamesexample/features/games/application/use_cases/filtered_games_list.dart';
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';

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
      const useCase = FilteredGamesListUseCase();
      expect(useCase, isNotNull);
    });
  });
}
