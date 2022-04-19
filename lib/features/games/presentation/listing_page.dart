import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import 'package:freegamesexample/features/games/application/blocs/favorites_list.dart';
import 'package:freegamesexample/features/games/application/blocs/games_list.dart';
import 'package:freegamesexample/features/games/presentation/widgets/game_tile.dart';
import 'package:freegamesexample/features/games/presentation/widgets/games_filter.dart';
import 'package:freegamesexample/presentation/constants.dart';

class GamesListingPage extends ConsumerWidget {
  const GamesListingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final isLoading = ref.watch(
      favoriteGamesListBlocProvider.select(
        (state) => state.when(
          error: (error) => false,
          loading: () => true,
          loaded: (_, __, ___) => false,
        ),
      ),
    );
    final games = ref.watch(gamesListProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const GamesFilterWidget().padding(bottom: Spacing.four),
          isLoading
              ? const CircularProgressIndicator.adaptive().center()
              : ListView.builder(
                  itemBuilder: (context, index) {
                    final vm = games[index];
                    return GameTileWidget(viewModel: vm);
                  },
                  itemCount: games.length,
                ).expanded(),
        ],
      ),
    );
  }
}
