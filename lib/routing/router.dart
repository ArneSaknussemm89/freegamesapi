import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:freegamesexample/features/favorites/presentation/entry.dart';
import 'package:freegamesexample/features/home/presentation/entry.dart';

part 'router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AdaptiveRoute(page: HomePage, initial: true),
    AdaptiveRoute(page: FavoriteGamesPage),
  ],
)
class AppRouter extends _$AppRouter {}
