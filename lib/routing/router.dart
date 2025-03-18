import 'package:auto_route/auto_route.dart';

import 'package:freegamesexample/core/presentation/widgets/empty_router_page.dart';
import 'package:freegamesexample/features/games/presentation/screens/listing_page.dart';
import 'package:freegamesexample/features/games/presentation/my_favorites.dart';
import 'package:freegamesexample/features/login/presentation/auth_entry.dart';
import 'package:freegamesexample/features/login/presentation/login.dart';

part 'router.gr.dart';

@AutoRouterConfig(replaceInRouteName: 'Page,Route')
class AppRouter extends RootStackRouter {
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: AuthEntryRoute.page,
          path: '/',
          initial: true,
        ),
        AutoRoute(
          page: LoginRoute.page,
          path: '/login',
        ),
        AutoRoute(
          page: EmptyRouterRoute.page,
          path: '/games',
          children: <AutoRoute>[
            AutoRoute(
              page: GamesListingRoute.page,
              path: '',
            ),
            AutoRoute(page: FavoriteGamesRoute.page, path: 'favorites'),
          ],
        ),
      ];
}
