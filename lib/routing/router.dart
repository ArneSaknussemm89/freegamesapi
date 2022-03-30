import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import 'package:freegamesexample/features/favorites/presentation/entry.dart';
import 'package:freegamesexample/features/home/presentation/entry.dart';
import 'package:freegamesexample/features/login/presentation/entry.dart';

part 'router.gr.dart';

@AdaptiveAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: <AutoRoute>[
    AdaptiveRoute(page: LoginPage, path: '/login', initial: true),
    AdaptiveRoute(page: HomePage, path: '/'),
    AdaptiveRoute(page: FavoriteGamesPage, path: '/favorites'),
  ],
)
class AppRouter extends _$AppRouter {}
