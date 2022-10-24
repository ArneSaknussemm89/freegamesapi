import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freegamesexample/features/games/application/providers/favorites_list.dart';
import 'package:freegamesexample/features/games/application/providers/game.dart';
import 'package:freegamesexample/features/games/domain/models/game/game.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:styled_widget/styled_widget.dart';

import 'package:freegamesexample/core/presentation/constants.dart';
import 'package:freegamesexample/core/presentation/layouts/layouts.dart';
import 'package:freegamesexample/core/presentation/widgets/error_view.dart';

class FavoriteGamesPage extends StatelessWidget {
  const FavoriteGamesPage({Key? key}) : super(key: key);

  Widget mobile(BuildContext context) {
    return MobileLayout(bodyBuilder: (context) => const FavoriteGamesPageBody());
  }

  Widget tablet(BuildContext context) {
    return TabletLayout(bodyBuilder: (context) => const FavoriteGamesPageBody());
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(
      mobile: mobile,
      tablet: tablet,
      desktop: tablet,
    );
  }
}

class FavoriteGamesPageBody extends ConsumerWidget {
  const FavoriteGamesPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fetchUserFavoritesProvider);

    return state.when(
      loading: const CircularProgressIndicator.adaptive().center,
      error: ErrorViewWidget.builder,
      data: (favorites) {
        if (favorites.isEmpty) {
          return Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text('No favorites yet.', style: Theme.of(context).textTheme.displayMedium),
              const Icon(Icons.mood_rounded, size: 44).padding(top: Spacing.two),
            ],
          );
        }

        return Column(
          children: [
            Text('Favorites', style: Theme.of(context).textTheme.displayMedium).padding(all: Spacing.two),
            ListView.builder(
              itemCount: favorites.length,
              itemBuilder: (context, index) {
                final favorite = favorites[index];
                final game = ref.watch(fetchOneGameProvider(id: favorite.gameId));

                return game.when(
                  data: (data) {
                    late final Game matched;
                    if (data == null) {
                      matched = Game.notFound();
                    } else {
                      matched = data;
                    }
                    return ListTile(
                      title: Text(matched.title, style: Theme.of(context).textTheme.bodyLarge),
                      subtitle: Text(matched.gameUrl),
                    );
                  },
                  error: ErrorViewWidget.builder,
                  loading: const CircularProgressIndicator.adaptive().center,
                );
              },
            ).expanded()
          ],
        );
      },
    );
  }
}
