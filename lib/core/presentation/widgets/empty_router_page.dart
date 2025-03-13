import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

// A route that just renders an AutoRouter to allow for nested routing.
@RoutePage()
class EmptyRouterPage extends StatelessWidget {
  const EmptyRouterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return const AutoRouter();
  }
}
