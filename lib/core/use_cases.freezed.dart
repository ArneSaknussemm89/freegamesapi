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
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$UseCaseResult<E, T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error, StackTrace trace) failure,
    required TResult Function(T data) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object? error, StackTrace trace)? failure,
    TResult? Function(T data)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error, StackTrace trace)? failure,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UseCaseResultFailure<E, T> value) failure,
    required TResult Function(UseCaseResultSuccess<E, T> value) success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UseCaseResultFailure<E, T> value)? failure,
    TResult? Function(UseCaseResultSuccess<E, T> value)? success,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UseCaseResultFailure<E, T> value)? failure,
    TResult Function(UseCaseResultSuccess<E, T> value)? success,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UseCaseResultCopyWith<E, T, $Res> {
  factory $UseCaseResultCopyWith(
          UseCaseResult<E, T> value, $Res Function(UseCaseResult<E, T>) then) =
      _$UseCaseResultCopyWithImpl<E, T, $Res, UseCaseResult<E, T>>;
}

/// @nodoc
class _$UseCaseResultCopyWithImpl<E, T, $Res, $Val extends UseCaseResult<E, T>>
    implements $UseCaseResultCopyWith<E, T, $Res> {
  _$UseCaseResultCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$UseCaseResultFailureCopyWith<E, T, $Res> {
  factory _$$UseCaseResultFailureCopyWith(_$UseCaseResultFailure<E, T> value,
          $Res Function(_$UseCaseResultFailure<E, T>) then) =
      __$$UseCaseResultFailureCopyWithImpl<E, T, $Res>;
  @useResult
  $Res call({Object? error, StackTrace trace});
}

/// @nodoc
class __$$UseCaseResultFailureCopyWithImpl<E, T, $Res>
    extends _$UseCaseResultCopyWithImpl<E, T, $Res,
        _$UseCaseResultFailure<E, T>>
    implements _$$UseCaseResultFailureCopyWith<E, T, $Res> {
  __$$UseCaseResultFailureCopyWithImpl(_$UseCaseResultFailure<E, T> _value,
      $Res Function(_$UseCaseResultFailure<E, T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? trace = null,
  }) {
    return _then(_$UseCaseResultFailure<E, T>(
      freezed == error ? _value.error : error,
      null == trace
          ? _value.trace
          : trace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$UseCaseResultFailure<E, T> implements UseCaseResultFailure<E, T> {
  const _$UseCaseResultFailure(this.error, this.trace);

  @override
  final Object? error;
  @override
  final StackTrace trace;

  @override
  String toString() {
    return 'UseCaseResult<$E, $T>.failure(error: $error, trace: $trace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UseCaseResultFailure<E, T> &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.trace, trace) || other.trace == trace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), trace);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UseCaseResultFailureCopyWith<E, T, _$UseCaseResultFailure<E, T>>
      get copyWith => __$$UseCaseResultFailureCopyWithImpl<E, T,
          _$UseCaseResultFailure<E, T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error, StackTrace trace) failure,
    required TResult Function(T data) success,
  }) {
    return failure(error, trace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object? error, StackTrace trace)? failure,
    TResult? Function(T data)? success,
  }) {
    return failure?.call(error, trace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error, StackTrace trace)? failure,
    TResult Function(T data)? success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(error, trace);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(UseCaseResultFailure<E, T> value) failure,
    required TResult Function(UseCaseResultSuccess<E, T> value) success,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UseCaseResultFailure<E, T> value)? failure,
    TResult? Function(UseCaseResultSuccess<E, T> value)? success,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UseCaseResultFailure<E, T> value)? failure,
    TResult Function(UseCaseResultSuccess<E, T> value)? success,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class UseCaseResultFailure<E, T> implements UseCaseResult<E, T> {
  const factory UseCaseResultFailure(
          final Object? error, final StackTrace trace) =
      _$UseCaseResultFailure<E, T>;

  Object? get error;
  StackTrace get trace;
  @JsonKey(ignore: true)
  _$$UseCaseResultFailureCopyWith<E, T, _$UseCaseResultFailure<E, T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$UseCaseResultSuccessCopyWith<E, T, $Res> {
  factory _$$UseCaseResultSuccessCopyWith(_$UseCaseResultSuccess<E, T> value,
          $Res Function(_$UseCaseResultSuccess<E, T>) then) =
      __$$UseCaseResultSuccessCopyWithImpl<E, T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$UseCaseResultSuccessCopyWithImpl<E, T, $Res>
    extends _$UseCaseResultCopyWithImpl<E, T, $Res,
        _$UseCaseResultSuccess<E, T>>
    implements _$$UseCaseResultSuccessCopyWith<E, T, $Res> {
  __$$UseCaseResultSuccessCopyWithImpl(_$UseCaseResultSuccess<E, T> _value,
      $Res Function(_$UseCaseResultSuccess<E, T>) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = null,
  }) {
    return _then(_$UseCaseResultSuccess<E, T>(
      null == data
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
            other is _$UseCaseResultSuccess<E, T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UseCaseResultSuccessCopyWith<E, T, _$UseCaseResultSuccess<E, T>>
      get copyWith => __$$UseCaseResultSuccessCopyWithImpl<E, T,
          _$UseCaseResultSuccess<E, T>>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(Object? error, StackTrace trace) failure,
    required TResult Function(T data) success,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function(Object? error, StackTrace trace)? failure,
    TResult? Function(T data)? success,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(Object? error, StackTrace trace)? failure,
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
    required TResult Function(UseCaseResultFailure<E, T> value) failure,
    required TResult Function(UseCaseResultSuccess<E, T> value) success,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(UseCaseResultFailure<E, T> value)? failure,
    TResult? Function(UseCaseResultSuccess<E, T> value)? success,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(UseCaseResultFailure<E, T> value)? failure,
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
  const factory UseCaseResultSuccess(final T data) =
      _$UseCaseResultSuccess<E, T>;

  T get data;
  @JsonKey(ignore: true)
  _$$UseCaseResultSuccessCopyWith<E, T, _$UseCaseResultSuccess<E, T>>
      get copyWith => throw _privateConstructorUsedError;
}
