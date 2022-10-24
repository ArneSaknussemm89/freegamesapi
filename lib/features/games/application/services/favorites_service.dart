import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

// Core elements.
import 'package:freegamesexample/core/application/providers/authentication.dart';
import 'package:freegamesexample/core/application/services/cloud_firestore.dart';

// Games feature elements.
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';

part 'favorites_service.g.dart';

@riverpod
FavoriteGamesService favoriteGamesService(FavoriteGamesServiceRef ref) {
  final service = ref.watch(appFirestoreServiceProvider);
  final auth = ref.watch(authenticationServiceProvider);
  return FavoriteGamesService(service: service, auth: auth);
}

class FavoriteGamesService {
  const FavoriteGamesService({required this.service, required this.auth});

  final AppFirestoreService service;
  final AuthenticationState auth;

  // Add a favorites to the list.
  Future<void> addFavorite(Game game) async {
    auth.whenOrNull(authenticated: (user) {
      service.favorites.add(
        FavoriteGame(
          gameId: game.id,
          ownerId: user.uid,
          savedOn: DateTime.now(),
        ),
      );
    });

    return;
  }

  // Remove a favorite from the list.
  Future<void> removeFavorite(Game game) async {
    auth.whenOrNull(authenticated: (user) async {
      final docs = await service.favorites //
          .where('ownerId', isEqualTo: user.uid)
          .where('gameId', isEqualTo: game.id)
          .get();
      // Now update docs.
      await Future.forEach<QueryDocumentSnapshot<FavoriteGame>>(
        docs.docs,
        (doc) async {
          await doc.reference.delete();
        },
      );
    });

    return;
  }
}
