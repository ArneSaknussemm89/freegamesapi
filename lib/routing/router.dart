import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:freegamesexample/features/games/presentation/listing_page.dart';
import 'package:freegamesexample/features/games/presentation/my_favorites.dart';
import 'package:freegamesexample/features/login/presentation/entry.dart';

part 'router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AdaptiveRoute(page: LoginPage, path: '/login', initial: true),
    AdaptiveRoute(
      page: EmptyRouterPage,
      path: '/games',
      name: 'GamesRootRoute',
      children: <AutoRoute>[
        AdaptiveRoute(
          page: GamesListingPage,
          path: '',
        ),
        AdaptiveRoute(page: FavoriteGamesPage, path: 'favorites'),
      ],
    ),
  ],
)
class AppRouter extends _$AppRouter {}
