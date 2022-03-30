import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:riverpod/riverpod.dart';

final firebaseAuthProvider = Provider.autoDispose<FirebaseAuth>((ref) {
  FlutterFireUIAuth.configureProviders([
    const EmailProviderConfiguration(),
    const PhoneProviderConfiguration(),
  ]);

  return FirebaseAuth.instance;
});
