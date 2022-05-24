import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:dio/dio.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:firebase_auth_mocks/firebase_auth_mocks.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/foundation.dart';
import 'package:freegamesexample/core/use_cases.dart';
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

class MockDioClient extends Mock implements Dio {}

class MockUseCase extends UseCase<Exception, String> {
  const MockUseCase();

  @override
  UseCaseResult<Exception, String> execute() {
    return const UseCaseResult.success(TestConstants.kMockUseCaseResult);
  }
}

class MockStreamUseCase extends StreamUseCase<Exception, String> {
  const MockStreamUseCase();

  @override
  UseCaseResult<Exception, Stream<String>> execute() {
    return UseCaseResult.success(Stream.fromIterable(TestConstants.elements));
  }
}

class MockStreamUseCaseWithParams extends StreamUseCaseWithParams<Exception, String, List<String>> {
  const MockStreamUseCaseWithParams();

  @override
  UseCaseResult<Exception, Stream<String>> execute(List<String> params) {
    return UseCaseResult.success(Stream.fromIterable(TestConstants.elements + params));
  }
}

class Listener<T> extends Mock {
  void call(T? prev, T value);
}

// Helper function for an easy delay.
Future<void> delay(int seconds) async => Future.delayed(Duration(seconds: seconds));

class MockFavoriteGamesBloc extends MockBloc<FavoriteGamesListEvent, FavoriteGamesListState>
    implements FavoriteGamesBloc {}

class MockAuthenticationBloc extends MockBloc<AuthenticationEvent, AuthenticationState> implements AuthenticationBloc {}

class TestConstants {
  static final kTestDateTime = DateTime(2022, 1, 1);
  static const kTestFirebaseAuthUserEmail = 'testfirebaseauthuser@gmail.vom';
  static const kTestFirebaseAuthUserPassword = 'testfirebaseauthuserpassword';
  static const kTestFirebaseAuthUserId = 'mock_uid';
  static const kTestFirebaseAuthDisplayName = 'Mock User';
  static const kMockUseCaseResult = 'Mock Use Case Result';

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

  static const dioAdapterFailedMessage = 'API call failed';
  static const dioAdapterSuccessMessage = 'API call was succuessful';

  static const elements = [
    'GET',
    'PUT',
    'DELETE',
    'POST',
    'PATCH',
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
  Duration? disposeDelay,
}) {
  final container = ProviderContainer(
    parent: parent,
    overrides: overrides,
    observers: observers,
    disposeDelay: disposeDelay,
  );
  addTearDown(container.dispose);
  return container;
}

/// Cloud Firestore helpers.
class FakeCollectionReference<Value> extends QueryReference<FakeQuerySnapshot<Value>>
    implements FirestoreCollectionReference<FakeQuerySnapshot<Value>> {
  FakeCollectionReference(this.valueListenable);
  final ValueListenable<List<Value>> valueListenable;

  @override
  Future<FakeQuerySnapshot<Value>> get([GetOptions? options]) async {
    return FakeQuerySnapshot<Value>(
      valueListenable.value.map(FakeFirestoreQueryDocumentSnapshot.new).toList(),
    );
  }

  @override
  CollectionReference<Object?> get reference => throw UnimplementedError();

  @override
  Stream<FakeQuerySnapshot<Value>> snapshots([GetOptions? options]) {
    late StreamController<FakeQuerySnapshot<Value>> controller;

    void listener() {
      controller.add(
        FakeQuerySnapshot<Value>(
          valueListenable.value.map(FakeFirestoreQueryDocumentSnapshot.new).toList(),
        ),
      );
    }

    controller = StreamController(
      sync: true,
      onListen: () {
        valueListenable.addListener(listener);
        listener();
      },
      onCancel: () {
        valueListenable.removeListener(listener);
        controller.close();
      },
    );

    return controller.stream;
  }

  @override
  String get path => throw UnimplementedError();

  @override
  FirestoreDocumentReference<FirestoreDocumentSnapshot> doc([String? id]) {
    throw UnimplementedError();
  }

  @override
  QueryReference<FakeQuerySnapshot<Value>> limit(int limit) {
    throw UnimplementedError();
  }

  @override
  QueryReference<FakeQuerySnapshot<Value>> limitToLast(int limit) {
    throw UnimplementedError();
  }
}

class FakeQuerySnapshot<Value> extends FirestoreQuerySnapshot {
  FakeQuerySnapshot(this.docs);

  @override
  List<FirestoreDocumentChange<FirestoreQueryDocumentSnapshot>> get docChanges => throw UnimplementedError();

  @override
  final List<FakeFirestoreQueryDocumentSnapshot<Value>> docs;

  @override
  SnapshotMetadata get metadata => throw UnimplementedError();

  @override
  QuerySnapshot<Object?> get snapshot => throw UnimplementedError();
}

class FakeFirestoreQueryDocumentSnapshot<Value> extends FirestoreQueryDocumentSnapshot {
  FakeFirestoreQueryDocumentSnapshot(this.data);

  @override
  final Value data;

  @override
  FirestoreDocumentReference<FirestoreDocumentSnapshot> get reference => throw UnimplementedError();

  @override
  QueryDocumentSnapshot<Object?> get snapshot => throw UnimplementedError();

  @override
  SnapshotMetadata get metadata => throw UnimplementedError();
}

class FakeDocumentReference<Value> extends FirestoreDocumentReference<FakeDocumentSnapshot<Value>> {
  FakeDocumentReference(
    this.valueListenable, {
    this.errorListenable,
    this.emitCurrentValue = true,
  });

  final ValueListenable<Value> valueListenable;
  final ValueListenable<Object>? errorListenable;
  final bool emitCurrentValue;

  @override
  Future<FakeDocumentSnapshot<Value>> get([GetOptions? options]) async {
    return FakeDocumentSnapshot<Value>(valueListenable.value);
  }

  @override
  DocumentReference<Object?> get reference => throw UnimplementedError();

  @override
  Stream<FakeDocumentSnapshot<Value>> snapshots([GetOptions? options]) {
    late StreamController<FakeDocumentSnapshot<Value>> controller;

    void listener() {
      controller.add(FakeDocumentSnapshot(valueListenable.value));
    }

    void onError() {
      controller.addError(errorListenable!.value);
    }

    controller = StreamController(
      sync: true,
      onListen: () {
        valueListenable.addListener(listener);
        errorListenable?.addListener(onError);
        if (emitCurrentValue) Future(listener);
      },
      onCancel: () {
        valueListenable.removeListener(listener);
        errorListenable?.removeListener(onError);
        controller.close();
      },
    );

    return controller.stream;
  }

  @override
  Future<void> delete() => throw UnimplementedError();

  @override
  String get id => throw UnimplementedError();

  @override
  String get path => throw UnimplementedError();
}

class FakeDocumentSnapshot<Value> extends FirestoreDocumentSnapshot {
  FakeDocumentSnapshot(this.data);

  @override
  final Value data;

  @override
  FirestoreDocumentReference<FirestoreDocumentSnapshot> get reference => throw UnimplementedError();

  @override
  DocumentSnapshot<Object?> get snapshot => throw UnimplementedError();

  @override
  SnapshotMetadata get metadata => throw UnimplementedError();
}
