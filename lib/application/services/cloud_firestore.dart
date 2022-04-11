import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:freegamesexample/domain/models/app_user.dart';
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';

// Provider for the firestore.
final cloudFirestoreProvider = Provider.autoDispose<FirebaseFirestore>(
  (ref) => FirebaseFirestore.instance,
);

final appFirestoreServiceProvider = Provider.autoDispose<AppFirestoreService>((ref) {
  final firestore = ref.read(cloudFirestoreProvider);
  return AppFirestoreService(firestore: firestore);
});

class AppFirestoreService {
  const AppFirestoreService({required this.firestore});

  final FirebaseFirestore firestore;

  AppUserCollectionReference get users => appUsersRef;
  FavoriteGameCollectionReference get favorites => favoriteGamesRef;
}
