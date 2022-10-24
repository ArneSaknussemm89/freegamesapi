import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// Games feature elements.
import 'package:freegamesexample/features/games/application/providers/games_list_filter.dart';
import 'package:freegamesexample/features/games/domain/value_objects/games_list_filter.dart';

class GamesFilterWidget extends ConsumerWidget {
  const GamesFilterWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final filter = ref.watch(gamesListFilterNotifierProvider);
    final notifier = ref.watch(gamesListFilterNotifierProvider.notifier);

    return ToggleButtons(
      onPressed: notifier.setFilter,
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
