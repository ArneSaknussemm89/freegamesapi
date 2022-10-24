import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:freegamesexample/core/domain/models/app_user.dart';
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';

// Provider for the firestore. Skipping from coverage because Firebase products are already well tested on
// their end and we are just using their implementation. No need to retest the wheel.

// coverage:ignore-file
final cloudFirestoreProvider = Provider.autoDispose<FirebaseFirestore>(
  (ref) {
    return FirebaseFirestore.instance;
  },
);

final appFirestoreServiceProvider = Provider.autoDispose<AppFirestoreService>((ref) {
  final firestore = ref.read(cloudFirestoreProvider);
  return AppFirestoreService(firestore: firestore);
}, dependencies: [cloudFirestoreProvider]);

class AppFirestoreService {
  const AppFirestoreService({required this.firestore});

  final FirebaseFirestore firestore;

  CollectionReference<AppUser> get users => firestore.collection('users').withConverter<AppUser>(
        fromFirestore: (snapshot, _) => AppUser.fromJson(snapshot.data()!),
        toFirestore: (user, _) => user.toJson(),
      );
  CollectionReference<FavoriteGame> get favorites => firestore.collection('favorites').withConverter<FavoriteGame>(
        fromFirestore: (snapshot, _) => FavoriteGame.fromJson(snapshot.data()!),
        toFirestore: (fav, _) => fav.toJson(),
      );
}
