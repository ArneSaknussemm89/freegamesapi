import 'package:riverpod_annotation/riverpod_annotation.dart';

// Core elements.
import 'package:freegamesexample/core/application/providers/authentication.dart';
import 'package:freegamesexample/core/application/services/cloud_firestore.dart';

// Games feature elements.
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';

part 'favorites_list.g.dart';

@riverpod
Future<List<FavoriteGame>> fetchUserFavorites(FetchUserFavoritesRef ref) async {
  final firestoreService = ref.watch(appFirestoreServiceProvider);
  final auth = ref.watch(authenticationServiceProvider);

  try {
    return auth.maybeWhen(
      orElse: () => <FavoriteGame>[],
      authenticated: (user) async {
        final favorites = await firestoreService.favorites.where('ownerId', isEqualTo: user.uid).get();
        if (favorites.docs.isEmpty) {
          return <FavoriteGame>[];
        }
        // Else return a list of the favs.
        final favs = favorites.docs.map((doc) => doc.data()).toList();
        return favs;
      },
    );
  } on Exception catch (e) {
    // @TODO: Add crashlytics
    return [];
  }
}
