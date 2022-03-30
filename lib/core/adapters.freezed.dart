// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'adapters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AdapterResponseTearOff {
  const _$AdapterResponseTearOff();

  AdapterResponseSuccess<T> success<T>(T data) {
    return AdapterResponseSuccess<T>(
      data,
    );
  }

  AdapterResponseFailure<T> failure<T>(Object? error, StackTrace trace) {
    return AdapterResponseFailure<T>(
      error,
      trace,
    );
  }
}

/// @nodoc
const $AdapterResponse = _$AdapterResponseTearOff();

/// @nodoc
mixin _$AdapterResponse<T> {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Object? error, StackTrace trace) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object? error, StackTrace trace)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object? error, StackTrace trace)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(AdapterResponseSuccess<T> value) success,
    required TResult Function(AdapterResponseFailure<T> value) failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AdapterResponseSuccess<T> value)? success,
    TResult Function(AdapterResponseFailure<T> value)? failure,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdapterResponseSuccess<T> value)? success,
    TResult Function(AdapterResponseFailure<T> value)? failure,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdapterResponseCopyWith<T, $Res> {
  factory $AdapterResponseCopyWith(
          AdapterResponse<T> value, $Res Function(AdapterResponse<T>) then) =
      _$AdapterResponseCopyWithImpl<T, $Res>;
}

/// @nodoc
class _$AdapterResponseCopyWithImpl<T, $Res>
    implements $AdapterResponseCopyWith<T, $Res> {
  _$AdapterResponseCopyWithImpl(this._value, this._then);

  final AdapterResponse<T> _value;
  // ignore: unused_field
  final $Res Function(AdapterResponse<T>) _then;
}

/// @nodoc
abstract class $AdapterResponseSuccessCopyWith<T, $Res> {
  factory $AdapterResponseSuccessCopyWith(AdapterResponseSuccess<T> value,
          $Res Function(AdapterResponseSuccess<T>) then) =
      _$AdapterResponseSuccessCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class _$AdapterResponseSuccessCopyWithImpl<T, $Res>
    extends _$AdapterResponseCopyWithImpl<T, $Res>
    implements $AdapterResponseSuccessCopyWith<T, $Res> {
  _$AdapterResponseSuccessCopyWithImpl(AdapterResponseSuccess<T> _value,
      $Res Function(AdapterResponseSuccess<T>) _then)
      : super(_value, (v) => _then(v as AdapterResponseSuccess<T>));

  @override
  AdapterResponseSuccess<T> get _value =>
      super._value as AdapterResponseSuccess<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(AdapterResponseSuccess<T>(
      data == freezed
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$AdapterResponseSuccess<T> implements AdapterResponseSuccess<T> {
  const _$AdapterResponseSuccess(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'AdapterResponse<$T>.success(data: $data)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdapterResponseSuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  $AdapterResponseSuccessCopyWith<T, AdapterResponseSuccess<T>> get copyWith =>
      _$AdapterResponseSuccessCopyWithImpl<T, AdapterResponseSuccess<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Object? error, StackTrace trace) failure,
  }) {
    return success(data);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object? error, StackTrace trace)? failure,
  }) {
    return success?.call(data);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object? error, StackTrace trace)? failure,
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
    required TResult Function(AdapterResponseSuccess<T> value) success,
    required TResult Function(AdapterResponseFailure<T> value) failure,
  }) {
    return success(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AdapterResponseSuccess<T> value)? success,
    TResult Function(AdapterResponseFailure<T> value)? failure,
  }) {
    return success?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdapterResponseSuccess<T> value)? success,
    TResult Function(AdapterResponseFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (success != null) {
      return success(this);
    }
    return orElse();
  }
}

abstract class AdapterResponseSuccess<T> implements AdapterResponse<T> {
  const factory AdapterResponseSuccess(T data) = _$AdapterResponseSuccess<T>;

  T get data;
  @JsonKey(ignore: true)
  $AdapterResponseSuccessCopyWith<T, AdapterResponseSuccess<T>> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AdapterResponseFailureCopyWith<T, $Res> {
  factory $AdapterResponseFailureCopyWith(AdapterResponseFailure<T> value,
          $Res Function(AdapterResponseFailure<T>) then) =
      _$AdapterResponseFailureCopyWithImpl<T, $Res>;
  $Res call({Object? error, StackTrace trace});
}

/// @nodoc
class _$AdapterResponseFailureCopyWithImpl<T, $Res>
    extends _$AdapterResponseCopyWithImpl<T, $Res>
    implements $AdapterResponseFailureCopyWith<T, $Res> {
  _$AdapterResponseFailureCopyWithImpl(AdapterResponseFailure<T> _value,
      $Res Function(AdapterResponseFailure<T>) _then)
      : super(_value, (v) => _then(v as AdapterResponseFailure<T>));

  @override
  AdapterResponseFailure<T> get _value =>
      super._value as AdapterResponseFailure<T>;

  @override
  $Res call({
    Object? error = freezed,
    Object? trace = freezed,
  }) {
    return _then(AdapterResponseFailure<T>(
      error == freezed ? _value.error : error,
      trace == freezed
          ? _value.trace
          : trace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$AdapterResponseFailure<T> implements AdapterResponseFailure<T> {
  const _$AdapterResponseFailure(this.error, this.trace);

  @override
  final Object? error;
  @override
  final StackTrace trace;

  @override
  String toString() {
    return 'AdapterResponse<$T>.failure(error: $error, trace: $trace)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is AdapterResponseFailure<T> &&
            const DeepCollectionEquality().equals(other.error, error) &&
            const DeepCollectionEquality().equals(other.trace, trace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      const DeepCollectionEquality().hash(error),
      const DeepCollectionEquality().hash(trace));

  @JsonKey(ignore: true)
  @override
  $AdapterResponseFailureCopyWith<T, AdapterResponseFailure<T>> get copyWith =>
      _$AdapterResponseFailureCopyWithImpl<T, AdapterResponseFailure<T>>(
          this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function(T data) success,
    required TResult Function(Object? error, StackTrace trace) failure,
  }) {
    return failure(error, trace);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object? error, StackTrace trace)? failure,
  }) {
    return failure?.call(error, trace);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function(T data)? success,
    TResult Function(Object? error, StackTrace trace)? failure,
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
    required TResult Function(AdapterResponseSuccess<T> value) success,
    required TResult Function(AdapterResponseFailure<T> value) failure,
  }) {
    return failure(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(AdapterResponseSuccess<T> value)? success,
    TResult Function(AdapterResponseFailure<T> value)? failure,
  }) {
    return failure?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(AdapterResponseSuccess<T> value)? success,
    TResult Function(AdapterResponseFailure<T> value)? failure,
    required TResult orElse(),
  }) {
    if (failure != null) {
      return failure(this);
    }
    return orElse();
  }
}

abstract class AdapterResponseFailure<T> implements AdapterResponse<T> {
  const factory AdapterResponseFailure(Object? error, StackTrace trace) =
      _$AdapterResponseFailure<T>;

  Object? get error;
  StackTrace get trace;
  @JsonKey(ignore: true)
  $AdapterResponseFailureCopyWith<T, AdapterResponseFailure<T>> get copyWith =>
      throw _privateConstructorUsedError;
}
