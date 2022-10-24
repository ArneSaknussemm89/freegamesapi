import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

// Core elements.
import 'package:freegamesexample/core/presentation/constants.dart';
import 'package:freegamesexample/core/presentation/widgets/error_view.dart';

// Games feature elements.
import 'package:freegamesexample/features/games/application/providers/filtered_games_list.dart';
import 'package:freegamesexample/features/games/presentation/widgets/game_tile.dart';
import 'package:freegamesexample/features/games/presentation/widgets/games_filter.dart';

class GamesListingPage extends ConsumerWidget {
  const GamesListingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(fetchFilteredGamesProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const GamesFilterWidget().padding(bottom: Spacing.four),
          state.when(
            loading: const CircularProgressIndicator.adaptive().center,
            data: (games) {
              return ListView.builder(
                itemBuilder: (context, index) {
                  final game = games[index];
                  return GameTileWidget(gameId: game.id);
                },
                itemCount: games.length,
              ).expanded();
            },
            error: ErrorViewWidget.builder,
          ),
        ],
      ),
    );
  }
}
