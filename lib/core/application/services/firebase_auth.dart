import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider, PhoneAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:riverpod/riverpod.dart';

// Reusing FlutterFire's functionality that's already been tested. Once we add stuff like Google/Apple login
// then we may want to make sure this is tested.
// coverage:ignore-file
final firebaseAuthProvider = Provider.autoDispose<FirebaseAuth>((ref) {
  FirebaseUIAuth.configureProviders([
    EmailAuthProvider(),
    PhoneAuthProvider(),
  ]);

  return FirebaseAuth.instance;
});
