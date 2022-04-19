import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';

import 'package:freegamesexample/application/services/cloud_firestore.dart';
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

final favoriteGamesServiceProvider = Provider.autoDispose<FavoriteGamesService>((ref) {
  final appFirestore = ref.watch(appFirestoreServiceProvider);
  return FavoriteGamesService(appFirestore: appFirestore);
}, dependencies: [appFirestoreServiceProvider]);

class FavoriteGamesService {
  const FavoriteGamesService({required this.appFirestore});

  final AppFirestoreService appFirestore;

  // Add a favorites to the list.
  Future<void> addFavorite(String uid, Game game) async {
    await appFirestore.favorites.add(
      FavoriteGame(
        gameId: game.id,
        ownerId: uid,
        savedOn: DateTime.now(),
      ),
    );

    return;
  }

  // Remove a favorite from the list.
  Future<void> removeFavorite(String uid, Game game) async {
    final docs =
        await appFirestore.favorites.where('ownerId', isEqualTo: uid).where('gameId', isEqualTo: game.id).get();

    await Future.forEach<QueryDocumentSnapshot<FavoriteGame>>(
      docs.docs,
      (doc) async {
        await doc.reference.delete();
      },
    );

    return;
  }
}
