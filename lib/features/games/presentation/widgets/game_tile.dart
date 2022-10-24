import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:supercharged/supercharged.dart';

// Core elements.
import 'package:freegamesexample/core/presentation/widgets/error_view.dart';

// Games feature elements.
import 'package:freegamesexample/features/games/application/providers/game.dart';
import 'package:freegamesexample/features/games/application/services/favorites_service.dart';

class GameTileWidget extends ConsumerWidget {
  const GameTileWidget({super.key, required this.gameId});

  final int gameId;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fetchOneGameProvider(id: gameId));
    final service = ref.watch(favoriteGamesServiceProvider);
    final router = context.router;

    return state.when(
      data: (game) {
        if (game == null) {
          return Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            mainAxisSize: MainAxisSize.max,
            children: [
              Text('Game not found', style: Theme.of(context).textTheme.headline6).padding(all: 10),
              ElevatedButton.icon(
                onPressed: router.pop,
                icon: const Icon(Icons.arrow_back_ios_new),
                label: const Text('Go Back'),
              ),
            ],
          ).center();
        }

        final icon =
            game.isFavorite ? const Icon(Icons.favorite, color: Colors.red) : const Icon(Icons.favorite_border);
        return ListTile(
          title: Text(game.title, style: Theme.of(context).textTheme.bodyLarge),
          subtitle: Text(game.gameUrl),
          trailing: AnimatedSwitcher(
            duration: 50.milliseconds,
            layoutBuilder: (Widget? currentChild, List<Widget> previousChildren) {
              return Stack(
                fit: StackFit.expand,
                alignment: Alignment.center,
                children: <Widget>[
                  ...previousChildren.map(
                    (child) => child.positioned(top: 0, right: 0, bottom: 0, left: 0),
                  ),
                  if (currentChild != null)
                    currentChild.positioned(
                      top: 0,
                      right: 0,
                      bottom: 0,
                      left: 0,
                    ),
                ],
              );
            },
            child: icon.gestures(
              onTap: () => service.addFavorite(game),
            ),
          ).constrained(maxHeight: 50, maxWidth: 50),
        );
      },
      error: ErrorViewWidget.builder,
      loading: const CircularProgressIndicator.adaptive().center,
    );
  }
}
