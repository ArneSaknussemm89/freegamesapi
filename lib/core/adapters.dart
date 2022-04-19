import 'package:equatable/equatable.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'adapters.freezed.dart';

// Default implementation of an adapter.
// coverage:ignore-start
abstract class Adapter {
  const Adapter();
}
// coverage:ignore-end

abstract class AsyncAdapter<T, O> {
  const AsyncAdapter();

  Future<T> get<R>(O options);
  Future<T> post<R>(O options);
  Future<T> put<R>(O options);
  Future<T> patch<R>(O options);
  Future<T> delete<R>(O options);
}

@freezed
class AdapterResponse<T> with _$AdapterResponse<T> {
  const factory AdapterResponse.success(T data) = AdapterResponseSuccess<T>;
  const factory AdapterResponse.failure(Object? error, StackTrace trace) =
      AdapterResponseFailure<T>;
}

class AdapterOptions extends Equatable {
  const AdapterOptions({
    required this.path,
    this.query,
    this.body,
    this.headers,
  });

  final String path;
  final Map<String, dynamic>? query;
  final Map<String, dynamic>? body;
  final Map<String, dynamic>? headers;

  @override
  List<Object?> get props => [path, query, body, headers];
}
