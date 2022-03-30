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
    HomeRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const HomePage());
    },
    FavoriteGamesRoute.name: (routeData) {
      return AdaptivePage<dynamic>(
          routeData: routeData, child: const FavoriteGamesPage());
    }
  };

  @override
  List<RouteConfig> get routes => [
        RouteConfig(HomeRoute.name, path: '/'),
        RouteConfig(FavoriteGamesRoute.name, path: '/favorite-games-page')
      ];
}

/// generated route for
/// [HomePage]
class HomeRoute extends PageRouteInfo<void> {
  const HomeRoute() : super(HomeRoute.name, path: '/');

  static const String name = 'HomeRoute';
}

/// generated route for
/// [FavoriteGamesPage]
class FavoriteGamesRoute extends PageRouteInfo<void> {
  const FavoriteGamesRoute()
      : super(FavoriteGamesRoute.name, path: '/favorite-games-page');

  static const String name = 'FavoriteGamesRoute';
}
