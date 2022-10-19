import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:riverpod/riverpod.dart';

import 'package:freegamesexample/application/blocs/authentication.dart';
import 'package:freegamesexample/application/services/cloud_firestore.dart';
import 'package:freegamesexample/application/use_cases/create_firestore_user.dart';
import 'package:freegamesexample/data/adapters/dio_adapter.dart';
import 'package:freegamesexample/data/constants.dart';
import 'package:freegamesexample/features/games/application/blocs/favorites_list.dart';
import 'package:freegamesexample/features/games/application/services/favorites_service.dart';
import 'package:freegamesexample/features/games/application/use_cases/add_favorite_game.dart';
import 'package:freegamesexample/features/games/data/data_sources/games_api.dart';
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

class MockAddFavoriteGameUseCase extends Mock implements AddFavoriteGameUseCase {}

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

class MockFavoriteGamesBloc extends MockBloc<FavoriteGamesListEvent, FavoriteGamesListState>
    implements FavoriteGamesBloc {}

class MockAuthenticationBloc extends MockBloc<AuthenticationEvent, AuthenticationState> implements AuthenticationBloc {}

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
    1,
    'Game Test 1',
    'https://placehold.it/150x150',
    'test',
    'https://google.com',
    'Action/Adventure',
    'Mac OS, Windows, Linux',
    'Test Publisher',
    'Test Developer',
    kTestDateTime,
    'https://fake.freetogame.com/test',
  );

  static final Game kTestGame2 = Game(
    2,
    'Game Test 2',
    'https://placehold.it/150x150',
    'test',
    'https://google.com',
    'Action/Adventure',
    'Mac OS, Windows, Linux',
    'Test Publisher',
    'Test Developer',
    kTestDateTime,
    'https://fake.freetogame.com/test',
  );

  static final Game kTestGame3 = Game(
    3,
    'Game Test 3',
    'https://placehold.it/150x150',
    'test',
    'https://google.com',
    'Action/Adventure',
    'Mac OS, Windows, Linux',
    'Test Publisher',
    'Test Developer',
    kTestDateTime,
    'https://fake.freetogame.com/test',
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
