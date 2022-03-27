import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '/features/home/presentation/entry.dart';

part 'router.gr.dart';

/// The root router for the application. The class name is rewritten to a route following this
/// convention:
///
/// MyCoolScreen => MyCoolRoute (The word "Screen" is replaced with "Route").
@AdaptiveAutoRouter(
  replaceInRouteName: 'Screen,Route',
  routes: <AutoRoute>[
    AdaptiveRoute(page: HomeScreen, initial: true),
  ],
)
class RootRouter extends _$RootRouter{}