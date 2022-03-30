import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod/riverpod.dart';

import 'package:freegamesexample/application/services/cloud_firestore.dart';

final favoriteGamesServiceProvider = Provider.autoDispose<FavoriteGamesService>((ref) {
  final firestore = ref.watch(cloudFirestoreProvider);
  return FavoriteGamesService(firestore: firestore);
});

class FavoriteGamesService {
  const FavoriteGamesService({required this.firestore});

  final FirebaseFirestore firestore;

  // Add a favorites to the list.
  Future<void> addFavorite(int gameId) async {
    return await firestore.collection('favorites').doc(gameId.toString()).set({});
  }

  // Remove a favorite from the list.
  Future<void> removeFavorite(int gameId) async {
    return await firestore.collection('favorites').doc(gameId.toString()).delete();
  }
}
