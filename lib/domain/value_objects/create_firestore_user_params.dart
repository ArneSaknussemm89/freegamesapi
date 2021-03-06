import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';

// coverage:ignore-file
extension CreateFirestoreAppUserUseCaseParamsX on User {
  CreateFirestoreAppUserUseCaseParams get toCreateFirestoreAppUserUseCaseParams {
    return CreateFirestoreAppUserUseCaseParams(this);
  }
}

class CreateFirestoreAppUserUseCaseParams extends Equatable {
  const CreateFirestoreAppUserUseCaseParams(this.user);

  final User user;

  @override
  List<Object?> get props => [user];
}
