// A widget that basically just fires off an auth check and then redirects to either login
// if unauthenticated or to the game listing if authenticated.

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:freegamesexample/core/application/providers/authentication.dart';

@RoutePage()
class AuthEntryPage extends ConsumerWidget {
  const AuthEntryPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Add listener to the auth state.
    ref.listen(authenticationServiceProvider, (previous, next) {
      var _ = switch (next) {
        Authenticated() => context.router.replaceNamed('/games'),
        Unauthenticated() => context.router.replaceNamed('/login'),
        _ => print('uninitialized'),
      };
    });

    return const CircularProgressIndicator.adaptive();
  }
}
