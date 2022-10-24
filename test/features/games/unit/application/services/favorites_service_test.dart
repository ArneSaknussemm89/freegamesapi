import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import 'package:freegamesexample/core/application/services/cloud_firestore.dart';
import 'package:freegamesexample/core/domain/models/app_user.dart';
import 'package:freegamesexample/features/games/application/services/favorites_service.dart';
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

import '../../../../../utils.dart';

const kTestAddFavoriteGameId = 999999999;
const kTestAddFavoriteDocId = 'test_add_favorite_doc_id';
const kTestAddFavoriteOwnerId = 'test_owner_id';
final testAddFavoriteSavedOn = DateTime(2022, 1, 1);

void main() {
  group('Favorites Service', () {
    late MockAppFirestoreService service;
    late FakeFirebaseFirestore fakeFirestore;
    late Game testGame;

    setUp(() {
      fakeFirestore = FakeFirebaseFirestore();
      service = MockAppFirestoreService();
      testGame = Game(
        kTestAddFavoriteGameId,
        'Game Test 1',
        'https://placehold.it/150x150',
        'test',
        'https://google.com',
        'Action/Adventure',
        'Mac OS, Windows, Linux',
        'Test Publisher',
        'Test Developer',
        testAddFavoriteSavedOn,
        'https://fake.freetogame.com/test',
      );
      when(() => service.firestore).thenReturn(fakeFirestore);
      when(() => service.favorites).thenReturn(
        fakeFirestore.collection('favorites').withConverter<FavoriteGame>(
              fromFirestore: (snapshot, _) => FavoriteGame.fromJson(snapshot.data()!),
              toFirestore: (fav, _) => fav.toJson(),
            ),
      );
      when(() => service.users).thenReturn(
        fakeFirestore.collection('users').withConverter<AppUser>(
              fromFirestore: (snapshot, _) => AppUser.fromJson(snapshot.data()!),
              toFirestore: (user, _) => user.toJson(),
            ),
      );
    });

    test('can instantiate', () async {
      final favs = FavoriteGamesService(appFirestore: service);
      expect(favs, isNotNull);
      expect(favs.appFirestore, service);
    });

    test('can add favorite', () async {
      addTearDown(() async {
        final docs = await fakeFirestore.collection('favorites').get();
        Future.forEach<QueryDocumentSnapshot>(docs.docs, (doc) async {
          await doc.reference.delete();
        });
      });

      final favs = FavoriteGamesService(appFirestore: service);
      await favs.addFavorite(kTestAddFavoriteOwnerId, testGame);
      final docs = await fakeFirestore.collection('favorites').get();
      expect(docs.docs.length, 1);
    });

    test('can remove favorite', () async {
      addTearDown(() async {
        final docs = await fakeFirestore.collection('favorites').get();
        Future.forEach<QueryDocumentSnapshot>(docs.docs, (doc) async {
          await doc.reference.delete();
        });
      });

      // Start by adding a favorite.
      final favs = FavoriteGamesService(appFirestore: service);
      await favs.addFavorite(kTestAddFavoriteOwnerId, testGame);
      final docs = await fakeFirestore.collection('favorites').get();
      expect(docs.docs.length, 1);

      // Now remove it.
      await favs.removeFavorite(kTestAddFavoriteOwnerId, testGame);
      final newDocs = await fakeFirestore.collection('favorites').get();
      expect(newDocs.docs.length, 0);
    });

    test('can read provider', () async {
      final root = createContainer();
      final container = createContainer(
        parent: root,
        overrides: [
          appFirestoreServiceProvider.overrideWithProvider(
            Provider.autoDispose((ref) => service),
          ),
        ],
      );

      final favs = container.read(favoriteGamesServiceProvider);
      expect(favs, isNotNull);
    });
  });
}
