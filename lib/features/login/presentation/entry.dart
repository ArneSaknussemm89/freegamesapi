import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';

import 'package:freegamesexample/core/application/services/firebase_auth.dart';
import 'package:freegamesexample/routing/router.dart';

class LoginPage extends ConsumerWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final auth = ref.watch(firebaseAuthProvider);

    return SignInScreen(
      auth: auth,
      sideBuilder: (context, constraints) {
        return Image.asset(
          'assets/images/logo_full_color.png',
          fit: BoxFit.cover,
        );
      },
      headerBuilder: (
        context,
        constraints,
        shrinkOffset,
      ) {
        return AspectRatio(
          aspectRatio: 16.0 / 9.0,
          child: Image.asset(
            'assets/images/logo_transparent.png',
            fit: BoxFit.contain,
          ),
        );
      },
      actions: [
        AuthStateChangeAction<SignedIn>(
          (context, state) {
            context.router.navigate(
              const GamesRootRoute(
                children: [
                  GamesListingRoute(),
                ],
              ),
            );
          },
        ),
      ],
    );
  }
}
