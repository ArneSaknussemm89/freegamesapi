import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import 'package:freegamesexample/features/home/presentation/blocs/games_list.dart';

class HomePage extends ConsumerWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamesList = ref.watch(gamesListBlocProvider);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: gamesList.when(
        loading: () => const CircularProgressIndicator.adaptive().center(),
        loaded: (games) => ListView.builder(
          itemBuilder: (context, index) {
            final game = games[index];
            return ListTile(
              title: Text(game.title, style: Theme.of(context).textTheme.headline6),
              subtitle: Text(game.shortDescription),
            );
          },
          itemCount: games.length,
        ),
        error: (error) => Text(error).center(),
      ),
    );
  }
}
