import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:supercharged/supercharged.dart';

import 'package:freegamesexample/features/games/presentation/view_models/game.dart';

class GameTileWidget extends ConsumerWidget {
  const GameTileWidget({Key? key, required this.viewModel}) : super(key: key);

  final GameVM viewModel;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loading = ref.watch(gameVMFavoriteWaiting(viewModel));
    final controller = ref.watch(gameVMFavoriteWaiting(viewModel).notifier);

    final icon = viewModel.favorite ? const Icon(Icons.favorite, color: Colors.red) : const Icon(Icons.favorite_border);
    return ListTile(
      title: Text(viewModel.game.title, style: Theme.of(context).textTheme.bodyLarge),
      subtitle: Text(viewModel.game.gameUrl),
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
        child: loading
            ? const CircularProgressIndicator.adaptive().center()
            : icon.gestures(
                onTap: () => viewModel.onTap(controller),
              ),
      ).constrained(maxHeight: 50, maxWidth: 50),
    );
  }
}
