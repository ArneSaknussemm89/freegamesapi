// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

part of 'router.dart';

class _$AppRouter extends RootStackRouter {
  _$AppRouter([GlobalKey<NavigatorState>? navigatorKey]) : super(navigatorKey);

  @override
  final Map<String, PageFactory> pagesMap = {
    LoginRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const LoginPage(),
      );
    },
    GamesRootRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const EmptyRouterPage(),
      );
    },
    GamesListingRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const GamesListingPage(),
      );
    },
    FavoriteGamesRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
        routeData: routeData,
        child: const FavoriteGamesPage(),
      );
    },
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(
          '/#redirect',
          path: '/',
          redirectTo: '/login',
          fullMatch: true,
        ),
        RouteConfig(
          LoginRoute.name,
          path: '/login',
        ),
        RouteConfig(
          GamesRootRoute.name,
          path: '/games',
          children: [
            RouteConfig(
              GamesListingRoute.name,
              path: '',
              parent: GamesRootRoute.name,
            ),
            RouteConfig(
              FavoriteGamesRoute.name,
              path: 'favorites',
              parent: GamesRootRoute.name,
            ),
          ],
        ),
      ];
}

/// generated route for
/// [LoginPage]
class LoginRoute extends PageRouteInfo<void> {
  const LoginRoute()
      : super(
          LoginRoute.name,
          path: '/login',
        );

  static const String name = 'LoginRoute';
}

/// generated route for
/// [EmptyRouterPage]
class GamesRootRoute extends PageRouteInfo<void> {
  const GamesRootRoute({List<PageRouteInfo>? children})
      : super(
          GamesRootRoute.name,
          path: '/games',
          initialChildren: children,
        );

  static const String name = 'GamesRootRoute';
}

/// generated route for
/// [GamesListingPage]
class GamesListingRoute extends PageRouteInfo<void> {
  const GamesListingRoute()
      : super(
          GamesListingRoute.name,
          path: '',
        );

  static const String name = 'GamesListingRoute';
}

/// generated route for
/// [FavoriteGamesPage]
class FavoriteGamesRoute extends PageRouteInfo<void> {
  const FavoriteGamesRoute()
      : super(
          FavoriteGamesRoute.name,
          path: 'favorites',
        );

  static const String name = 'FavoriteGamesRoute';
}
