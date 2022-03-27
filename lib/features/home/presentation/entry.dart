import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';

import 'package:freegamesapi/features/home/presentation/blocs/games_list.dart';

class HomeScreen extends ConsumerWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final gamesList = ref.watch(gamesListBloc);

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
              title: Text(game.title ?? 'No Title'),
              subtitle: game.shortDescription != null ? Text(game.shortDescription!) : null,
            );
          },
          itemCount: games.length,
        ),
        error: (error) => Text(error).center(),
      ),
    );
  }
}
