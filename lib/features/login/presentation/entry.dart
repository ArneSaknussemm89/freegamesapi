import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:freegamesexample/application/services/firebase_auth.dart';

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
        print(shrinkOffset);
        return Image.asset(
          'assets/images/logo_transparent.png',
          fit: BoxFit.contain,
        );
      },
    );
  }
}
