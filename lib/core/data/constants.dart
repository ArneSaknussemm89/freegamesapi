import 'package:flutter/material.dart';

// coverage:ignore-file

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

class AppConstants {
  static const String favoritesFirebaseKey = 'favorites';
  static const String usersFirebaseKey = 'users';
}
