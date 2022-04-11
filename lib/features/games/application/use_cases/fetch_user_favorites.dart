import 'package:riverpod/riverpod.dart';

import 'package:freegamesexample/application/services/cloud_firestore.dart';
import 'package:freegamesexample/core/use_cases.dart';
import 'package:freegamesexample/features/games/domain/models/favorites/favorite.dart';
import 'package:freegamesexample/features/games/domain/value_objects/fetch_user_favorites_params.dart';

final fetchUserFavoritesUseCaseProvider = Provider.autoDispose<FetchUserFavoritesUseCase>((ref) {
  final firestoreService = ref.watch(appFirestoreServiceProvider);

  return FetchUserFavoritesUseCase(firestoreService: firestoreService);
});

class FetchUserFavoritesUseCase
    extends AsyncUseCaseWithParams<Object?, List<FavoriteGame>, FetchUserFavoritesUseCaseParams> {
  const FetchUserFavoritesUseCase({
    required this.firestoreService,
  });

  final AppFirestoreService firestoreService;

  @override
  Future<UseCaseResult<Object?, List<FavoriteGame>>> execute(
    FetchUserFavoritesUseCaseParams params,
  ) async {
    try {
      final favorites = await firestoreService.favorites.whereOwnerId(isEqualTo: params.uid).get();
      if (favorites.docs.isEmpty) {
        return const UseCaseResult.success(<FavoriteGame>[]);
      }
      // Else return a list of the favs.
      final favs = favorites.docs.map((doc) => doc.data).toList();
      return UseCaseResult.success(favs);
    } on Exception catch (e) {
      return UseCaseResult.failure(e, StackTrace.current);
    }
  }
}
