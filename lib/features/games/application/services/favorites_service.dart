import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Core elements.
import 'package:freegamesexample/application/services/cloud_firestore.dart';

// Games feature elements.
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

part 'favorites_service.g.dart';

@riverpod
class FavoriteGamesService extends _$FavoriteGamesService {
  FavoriteGamesService({required this.appFirestore});

  @override
  FavoriteGamesService build() {
    final firestore = ref.watch(appFirestoreServiceProvider);
    return FavoriteGamesService(appFirestore: firestore);
  }

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
