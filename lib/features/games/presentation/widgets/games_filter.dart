import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freegamesexample/features/games/application/blocs/favorites_list.dart';

class GamesFilterWidget extends ConsumerWidget {
  const GamesFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(favoriteGamesListFiltersProvider);
    final notifier = ref.watch(favoriteGamesListFiltersProvider.notifier);

    return ToggleButtons(
      onPressed: (selectedIndex) => notifier.state = selectedIndex == 0
          ? GamesListFilter.all
          : GamesListFilter.onlyFavorites,
      isSelected: [
        filter == GamesListFilter.all,
        filter == GamesListFilter.onlyFavorites,
      ],
      children: const [
        Icon(Icons.list),
        Icon(Icons.favorite),
      ],
    );
  }
}
