import 'package:firebase_auth/firebase_auth.dart';
import 'package:riverpod/riverpod.dart';

import 'package:freegamesexample/application/services/cloud_firestore.dart';
import 'package:freegamesexample/core/use_cases.dart';
import 'package:freegamesexample/domain/models/app_user.dart';
import 'package:freegamesexample/domain/value_objects/create_firestore_user_params.dart';

final createFirestoreAppUserUseCaseProvider = Provider.autoDispose(
  (ref) {
    final service = ref.watch(appFirestoreServiceProvider);
    return CreateFirestoreAppUserUseCase(service: service);
  },
);

extension CreateFirestoreAppUserUseCaseParamsExt on User {
  CreateFirestoreAppUserUseCaseParams get toCreateFirestoreAppUserUseCaseParams =>
      CreateFirestoreAppUserUseCaseParams(this);
}

class CreateFirestoreAppUserUseCase
    extends AsyncUseCaseWithParams<Exception, AppUser, CreateFirestoreAppUserUseCaseParams> {
  const CreateFirestoreAppUserUseCase({
    required this.service,
  });

  final AppFirestoreService service;

  @override
  Future<UseCaseResult<Exception, AppUser>> execute(
    CreateFirestoreAppUserUseCaseParams params,
  ) async {
    try {
      final existing = await service.users.doc(params.user.uid).get();
      if (existing.exists) {
        return UseCaseResult.success(existing.data()!);
      }

      final user = AppUser(
        displayName: params.user.displayName ?? 'Unnamed Person',
        uid: params.user.uid,
      );
      await service.users.doc(params.user.uid).set(user);
      return UseCaseResult.success(user);
    } on Exception catch (exception) {
      return UseCaseResult.failure(exception, StackTrace.current);
    }
  }
}
