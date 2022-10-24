import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';

import 'package:freegamesexample/core/application/services/cloud_firestore.dart';
import 'package:freegamesexample/core/application/use_cases/create_firestore_user.dart';
import 'package:freegamesexample/core/data/adapters/dio_adapter.dart';
import 'package:freegamesexample/core/data/constants.dart';
import 'package:freegamesexample/features/games/application/services/favorites_service.dart';
import 'package:freegamesexample/features/games/data/data_sources/games_api.dart';
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';


class MockAppFirestoreService extends Mock implements AppFirestoreService {}

class MockCreateFirestoreAppUserUseCase extends Mock implements CreateFirestoreAppUserUseCase {}

class MockDioAdapter extends Mock implements DioAdapter {}

class MockFavoriteGamesService extends Mock implements FavoriteGamesService {}

class MockGameApiDataSource extends Mock implements GameApiDataSource {}

class Listener<T> extends Mock {
  void call(T? prev, T value);
}

// Helper function for an easy delay.
Future<void> delay(int seconds) => Future.delayed(Duration(seconds: seconds));
Future<void> delayMilliseconds(int milliseconds) => Future.delayed(Duration(milliseconds: milliseconds));

class TestConstants {
  static final kTestDateTime = DateTime(2022, 1, 1);
  static const kTestFirebaseAuthUserEmail = 'testfirebaseauthuser@gmail.vom';
  static const kTestFirebaseAuthUserPassword = 'testfirebaseauthuserpassword';
  static const kTestFirebaseAuthUserId = 'mock_uid';
  static const kTestFirebaseAuthDisplayName = 'Mock User';

  static final testUser = MockUser(
    uid: kTestFirebaseAuthUserId,
    email: kTestFirebaseAuthUserEmail,
    displayName: kTestFirebaseAuthDisplayName,
  );

  static final Game kTestGame1 = Game(
    id: 1,
    title: 'Game Test 1',
    thumbnail: 'https://placehold.it/150x150',
    shortDescription: 'test',
    gameUrl: 'https://google.com',
    genre: 'Action/Adventure',
    platform: 'Mac OS, Windows, Linux',
    publisher: 'Test Publisher',
    developer: 'Test Developer',
    releaseDate: kTestDateTime,
    freetogameProfileUrl: 'https://fake.freetogame.com/test',
  );

  static final Game kTestGame2 = Game(
    id: 2,
    title: 'Game Test 2',
    thumbnail: 'https://placehold.it/150x150',
    shortDescription: 'test',
    gameUrl: 'https://google.com',
    genre: 'Action/Adventure',
    platform: 'Mac OS, Windows, Linux',
    publisher: 'Test Publisher',
    developer: 'Test Developer',
    releaseDate: kTestDateTime,
    freetogameProfileUrl: 'https://fake.freetogame.com/test',
  );

  static final Game kTestGame3 = Game(
    id: 3,
    title: 'Game Test 3',
    thumbnail: 'https://placehold.it/150x150',
    shortDescription: 'test',
    gameUrl: 'https://google.com',
    genre: 'Action/Adventure',
    platform: 'Mac OS, Windows, Linux',
    publisher: 'Test Publisher',
    developer: 'Test Developer',
    releaseDate: kTestDateTime,
    freetogameProfileUrl: 'https://fake.freetogame.com/test',
  );

  static final List<Game> testGames = [
    kTestGame1,
    kTestGame2,
    kTestGame3,
  ];

  static final List<Map<String, dynamic>> testSerializedGames = [
    kTestGame1.toJson(),
    kTestGame2.toJson(),
    kTestGame3.toJson(),
  ];

  static final List<FavoriteGame> testFavorites = [
    FavoriteGame(
      gameId: kTestGame1.id,
      ownerId: testUser.uid,
      savedOn: DateTime(2022, 1, 1),
    ),
  ];
}

Future<void> clearFirestore(FakeFirebaseFirestore firestore) async {
  final docs = await firestore.collection(AppConstants.usersFirebaseKey).get();
  Future.forEach<QueryDocumentSnapshot>(docs.docs, (doc) async {
    await doc.reference.delete();
  });

  final favorites = await firestore.collection(AppConstants.favoritesFirebaseKey).get();
  Future.forEach<QueryDocumentSnapshot>(favorites.docs, (doc) async {
    await doc.reference.delete();
  });
}

ProviderContainer createContainer({
  ProviderContainer? parent,
  List<Override> overrides = const [],
  List<ProviderObserver>? observers,
}) {
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
  );
  addTearDown(container.dispose);
  return container;
}
