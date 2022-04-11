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
  const factory UseCaseResult.failure(Object? error, StackTrace trace) = UseCaseResultFailure<E, T>;
  const factory UseCaseResult.success(T data) = UseCaseResultSuccess<E, T>;
}

abstract class UseCase<E, T> extends UseCaseBase {
  const UseCase();

  UseCaseResult<E, T> execute();
}

abstract class UseCaseWithParams<E, T, P> extends UseCaseBase {
  const UseCaseWithParams();

  UseCaseResult<E, T> execute(P params);
}

abstract class AsyncUseCase<E, T> extends UseCaseBase {
  const AsyncUseCase();

  Future<UseCaseResult<E, T>> execute();
}

abstract class AsyncUseCaseWithParams<E, T, P> extends UseCaseBase {
  const AsyncUseCaseWithParams();

  Future<UseCaseResult<E, T>> execute(P params);
}

abstract class StreamUseCase<E, T> extends UseCaseBase {
  const StreamUseCase();

  Stream<UseCaseResult<E, T>> execute();
}

abstract class StreamUseCaseWithParams<E, T, P> extends UseCaseBase {
  const StreamUseCaseWithParams();

  Stream<UseCaseResult<E, T>> execute(P params);
}
