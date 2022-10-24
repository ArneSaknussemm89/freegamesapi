import 'package:riverpod_annotation/riverpod_annotation.dart';

// Games feature elements.
import 'package:freegamesexample/features/games/domain/value_objects/games_list_filter.dart';

part 'games_list_filter.g.dart';

@riverpod
class GamesListFilterNotifier extends _$GamesListFilterNotifier {
  @override
  GamesListFilter build() {
    return GamesListFilter.all;
  }

  void setFilter(int index) {
    switch (index) {
      case 0:
        state = GamesListFilter.all;
        break;
      case 1:
        state = GamesListFilter.onlyFavorites;
        break;
    }
  }
}
