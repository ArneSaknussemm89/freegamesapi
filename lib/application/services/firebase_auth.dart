import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutterfire_ui/auth.dart';
import 'package:freegamesexample/application/use_cases/create_firestore_user.dart';
import 'package:riverpod/riverpod.dart';

final firebaseAuthProvider = Provider.autoDispose<FirebaseAuth>((ref) {
  FlutterFireUIAuth.configureProviders([
    const EmailProviderConfiguration(),
    const PhoneProviderConfiguration(),
  ]);

  return FirebaseAuth.instance;
});

final firebaseUserProvider = StreamProvider.autoDispose<User?>((ref) {
  return ref.watch(firebaseAuthProvider).authStateChanges();
});

final firebaseAuthServiceProvider = Provider.autoDispose<FirebaseAuthService>((ref) {
  final createFirestoreAppUserUseCase = ref.watch(createFirestoreAppUserUseCaseProvider);
  final user = ref.watch(firebaseUserProvider);

  return FirebaseAuthService(
    user: user.value,
    createFirestoreAppUserUseCase: createFirestoreAppUserUseCase,
  );
});

class FirebaseAuthService {
  const FirebaseAuthService({required this.user, required this.createFirestoreAppUserUseCase});

  final User? user;
  final CreateFirestoreAppUserUseCase createFirestoreAppUserUseCase;

  void createFirestoreAppUser() {
    if (user == null) return;
    createFirestoreAppUserUseCase.execute(user!.toCreateFirestoreAppUserUseCaseParams);
  }
}
