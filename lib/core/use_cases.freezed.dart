// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'use_cases.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$UseCaseResultTearOff {
  const _$UseCaseResultTearOff();

  UseCaseResultException<E, T> exception<E, T>(E exception, StackTrace trace) {
    return UseCaseResultException<E, T>(
      exception,
      trace,
    );
  }

  UseCaseResultSuccess<E, T> success<E, T>(T data) {
    return UseCaseResultSuccess<E, T>(
      data,
    );
  }
}

/// @nodoc
const $UseCaseResult = _$UseCaseResultTearOff();

/// @nodoc
mixin _$UseCaseResult<E, T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(E exception, StackTrace trace) exception,
    required TResult Function(T data) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(E exception, StackTrace trace)? exception,
    TResult Function(T data)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(E exception, StackTrace trace)? exception,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UseCaseResultException<E, T> value) exception,
    required TResult Function(UseCaseResultSuccess<E, T> value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UseCaseResultException<E, T> value)? exception,
    TResult Function(UseCaseResultSuccess<E, T> value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UseCaseResultException<E, T> value)? exception,
    TResult Function(UseCaseResultSuccess<E, T> value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UseCaseResultCopyWith<E, T, $Res> {
  factory $UseCaseResultCopyWith(
          UseCaseResult<E, T> value, $Res Function(UseCaseResult<E, T>) then) =
      _$UseCaseResultCopyWithImpl<E, T, $Res>;
}

/// @nodoc
class _$UseCaseResultCopyWithImpl<E, T, $Res>
    implements $UseCaseResultCopyWith<E, T, $Res> {
  _$UseCaseResultCopyWithImpl(this._value, this._then);

  final UseCaseResult<E, T> _value;
  // ignore: unused_field
  final $Res Function(UseCaseResult<E, T>) _then;
}

/// @nodoc
abstract class $UseCaseResultExceptionCopyWith<E, T, $Res> {
  factory $UseCaseResultExceptionCopyWith(UseCaseResultException<E, T> value,
          $Res Function(UseCaseResultException<E, T>) then) =
      _$UseCaseResultExceptionCopyWithImpl<E, T, $Res>;
  $Res call({E exception, StackTrace trace});
}

/// @nodoc
class _$UseCaseResultExceptionCopyWithImpl<E, T, $Res>
    extends _$UseCaseResultCopyWithImpl<E, T, $Res>
    implements $UseCaseResultExceptionCopyWith<E, T, $Res> {
  _$UseCaseResultExceptionCopyWithImpl(UseCaseResultException<E, T> _value,
      $Res Function(UseCaseResultException<E, T>) _then)
      : super(_value, (v) => _then(v as UseCaseResultException<E, T>));

  @override
  UseCaseResultException<E, T> get _value =>
      super._value as UseCaseResultException<E, T>;

  @override
  $Res call({
    Object? exception = freezed,
    Object? trace = freezed,
  }) {
    return _then(UseCaseResultException<E, T>(
      exception == freezed
          ? _value.exception
          : exception // ignore: cast_nullable_to_non_nullable
              as E,
      trace == freezed
          ? _value.trace
          : trace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$UseCaseResultException<E, T> implements UseCaseResultException<E, T> {
  const _$UseCaseResultException(this.exception, this.trace);

  @override
  final E exception;
  @override
  final StackTrace trace;

  @override
  String toString() {
    return 'UseCaseResult<$E, $T>.exception(exception: $exception, trace: $trace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UseCaseResultException<E, T> &&
            const DeepCollectionEquality().equals(other.exception, exception) &&
            const DeepCollectionEquality().equals(other.trace, trace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(exception),
      const DeepCollectionEquality().hash(trace));

  @JsonKey(ignore: true)
  @override
  $UseCaseResultExceptionCopyWith<E, T, UseCaseResultException<E, T>>
      get copyWith => _$UseCaseResultExceptionCopyWithImpl<E, T,
          UseCaseResultException<E, T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(E exception, StackTrace trace) exception,
    required TResult Function(T data) success,
  }) {
    return exception(this.exception, trace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(E exception, StackTrace trace)? exception,
    TResult Function(T data)? success,
  }) {
    return exception?.call(this.exception, trace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(E exception, StackTrace trace)? exception,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this.exception, trace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UseCaseResultException<E, T> value) exception,
    required TResult Function(UseCaseResultSuccess<E, T> value) success,
  }) {
    return exception(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UseCaseResultException<E, T> value)? exception,
    TResult Function(UseCaseResultSuccess<E, T> value)? success,
  }) {
    return exception?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UseCaseResultException<E, T> value)? exception,
    TResult Function(UseCaseResultSuccess<E, T> value)? success,
    required TResult orElse(),
  }) {
    if (exception != null) {
      return exception(this);
    }
    return orElse();
  }
}

abstract class UseCaseResultException<E, T> implements UseCaseResult<E, T> {
  const factory UseCaseResultException(E exception, StackTrace trace) =
      _$UseCaseResultException<E, T>;

  E get exception;
  StackTrace get trace;
  @JsonKey(ignore: true)
  $UseCaseResultExceptionCopyWith<E, T, UseCaseResultException<E, T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UseCaseResultSuccessCopyWith<E, T, $Res> {
  factory $UseCaseResultSuccessCopyWith(UseCaseResultSuccess<E, T> value,
          $Res Function(UseCaseResultSuccess<E, T>) then) =
      _$UseCaseResultSuccessCopyWithImpl<E, T, $Res>;
  $Res call({T data});
}

/// @nodoc
class _$UseCaseResultSuccessCopyWithImpl<E, T, $Res>
    extends _$UseCaseResultCopyWithImpl<E, T, $Res>
    implements $UseCaseResultSuccessCopyWith<E, T, $Res> {
  _$UseCaseResultSuccessCopyWithImpl(UseCaseResultSuccess<E, T> _value,
      $Res Function(UseCaseResultSuccess<E, T>) _then)
      : super(_value, (v) => _then(v as UseCaseResultSuccess<E, T>));

  @override
  UseCaseResultSuccess<E, T> get _value =>
      super._value as UseCaseResultSuccess<E, T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(UseCaseResultSuccess<E, T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$UseCaseResultSuccess<E, T> implements UseCaseResultSuccess<E, T> {
  const _$UseCaseResultSuccess(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'UseCaseResult<$E, $T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is UseCaseResultSuccess<E, T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  $UseCaseResultSuccessCopyWith<E, T, UseCaseResultSuccess<E, T>>
      get copyWith =>
          _$UseCaseResultSuccessCopyWithImpl<E, T, UseCaseResultSuccess<E, T>>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(E exception, StackTrace trace) exception,
    required TResult Function(T data) success,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(E exception, StackTrace trace)? exception,
    TResult Function(T data)? success,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(E exception, StackTrace trace)? exception,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(data);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UseCaseResultException<E, T> value) exception,
    required TResult Function(UseCaseResultSuccess<E, T> value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(UseCaseResultException<E, T> value)? exception,
    TResult Function(UseCaseResultSuccess<E, T> value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UseCaseResultException<E, T> value)? exception,
    TResult Function(UseCaseResultSuccess<E, T> value)? success,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class UseCaseResultSuccess<E, T> implements UseCaseResult<E, T> {
  const factory UseCaseResultSuccess(T data) = _$UseCaseResultSuccess<E, T>;

  T get data;
  @JsonKey(ignore: true)
  $UseCaseResultSuccessCopyWith<E, T, UseCaseResultSuccess<E, T>>
      get copyWith => throw _privateConstructorUsedError;
}
