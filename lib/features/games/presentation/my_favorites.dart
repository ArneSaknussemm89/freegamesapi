import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:styled_widget/styled_widget.dart';

import 'package:freegamesexample/features/games/application/blocs/favorites_list.dart';
import 'package:freegamesexample/presentation/constants.dart';
import 'package:freegamesexample/presentation/layouts/layouts.dart';
import 'package:freegamesexample/presentation/widgets/error_view.dart';

class FavoriteGamesPage extends StatelessWidget {
  const FavoriteGamesPage({Key? key}) : super(key: key);

  Widget mobile(BuildContext context) {
    return MobileLayout(
      bodyBuilder: (_) => const FavoriteGamesPageBody(),
    );
  }

  Widget tablet(BuildContext context) {
    return TabletLayout(
      bodyBuilder: (_) => const FavoriteGamesPageBody(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout.builder(mobile: mobile, tablet: tablet, desktop: tablet);
  }
}

class FavoriteGamesPageBody extends ConsumerWidget {
  const FavoriteGamesPageBody({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final favorites = ref.watch(favoriteGamesListBlocProvider);

    return favorites.when(
      loading: const CircularProgressIndicator.adaptive().center,
      loaded: (favs, games, vms) {
        if (vms.isEmpty) {
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
              itemCount: vms.length,
              itemBuilder: (context, index) {
                final model = vms[index];

                return ListTile(
                  title: Text(model.game.title),
                  subtitle: Text(model.game.gameUrl),
                  trailing: const Icon(Icons.favorite),
                );
              },
            ).expanded()
          ],
        );
      },
      error: (error) => ErrorViewWidget(error: error),
    );
  }
}
