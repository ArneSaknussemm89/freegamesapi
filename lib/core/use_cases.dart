import 'package:freezed_annotation/freezed_annotation.dart';

part 'use_cases.freezed.dart';

/// These classes are used to define the use cases of the application.
///
abstract class UseCaseBase {
  const UseCaseBase();
}

class Void {
  const Void._();
}

const kVoid = Void._();

@freezed
class UseCaseResult<E, T> with _$UseCaseResult<E, T> {
  const factory UseCaseResult.failure(E error, StackTrace trace) =
      UseCaseResultFailure<E, T>;
  const factory UseCaseResult.success(T data) = UseCaseResultSuccess<E, T>;
}

abstract class UseCase<E, T> extends UseCaseBase {
  const UseCase();
}

abstract class UseCaseWithParams<E, T, P> extends UseCaseBase {
  const UseCaseWithParams();
}

abstract class AsyncUseCase<E, T> extends UseCaseBase {
  const AsyncUseCase();
}

abstract class AsyncUseCaseWithParams<E, T, P> extends UseCaseBase {
  const AsyncUseCaseWithParams();
}

abstract class StreamUseCase<E, T> extends UseCaseBase {
  const StreamUseCase();
}

abstract class StreamUseCaseWithParams<E, T, P> extends UseCaseBase {
  const StreamUseCaseWithParams();
}
