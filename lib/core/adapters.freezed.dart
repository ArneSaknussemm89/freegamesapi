// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'adapters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

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
abstract class _$$AdapterResponseSuccessCopyWith<T, $Res> {
  factory _$$AdapterResponseSuccessCopyWith(_$AdapterResponseSuccess<T> value,
          $Res Function(_$AdapterResponseSuccess<T>) then) =
      __$$AdapterResponseSuccessCopyWithImpl<T, $Res>;
  $Res call({T data});
}

/// @nodoc
class __$$AdapterResponseSuccessCopyWithImpl<T, $Res>
    extends _$AdapterResponseCopyWithImpl<T, $Res>
    implements _$$AdapterResponseSuccessCopyWith<T, $Res> {
  __$$AdapterResponseSuccessCopyWithImpl(_$AdapterResponseSuccess<T> _value,
      $Res Function(_$AdapterResponseSuccess<T>) _then)
      : super(_value, (v) => _then(v as _$AdapterResponseSuccess<T>));

  @override
  _$AdapterResponseSuccess<T> get _value =>
      super._value as _$AdapterResponseSuccess<T>;

  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$AdapterResponseSuccess<T>(
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
            other is _$AdapterResponseSuccess<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  @JsonKey(ignore: true)
  @override
  _$$AdapterResponseSuccessCopyWith<T, _$AdapterResponseSuccess<T>>
      get copyWith => __$$AdapterResponseSuccessCopyWithImpl<T,
          _$AdapterResponseSuccess<T>>(this, _$identity);

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
  const factory AdapterResponseSuccess(final T data) =
      _$AdapterResponseSuccess<T>;

  T get data => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$AdapterResponseSuccessCopyWith<T, _$AdapterResponseSuccess<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdapterResponseFailureCopyWith<T, $Res> {
  factory _$$AdapterResponseFailureCopyWith(_$AdapterResponseFailure<T> value,
          $Res Function(_$AdapterResponseFailure<T>) then) =
      __$$AdapterResponseFailureCopyWithImpl<T, $Res>;
  $Res call({Object? error, StackTrace trace});
}

/// @nodoc
class __$$AdapterResponseFailureCopyWithImpl<T, $Res>
    extends _$AdapterResponseCopyWithImpl<T, $Res>
    implements _$$AdapterResponseFailureCopyWith<T, $Res> {
  __$$AdapterResponseFailureCopyWithImpl(_$AdapterResponseFailure<T> _value,
      $Res Function(_$AdapterResponseFailure<T>) _then)
      : super(_value, (v) => _then(v as _$AdapterResponseFailure<T>));

  @override
  _$AdapterResponseFailure<T> get _value =>
      super._value as _$AdapterResponseFailure<T>;

  @override
  $Res call({
    Object? error = freezed,
    Object? trace = freezed,
  }) {
    return _then(_$AdapterResponseFailure<T>(
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
            other is _$AdapterResponseFailure<T> &&
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
  _$$AdapterResponseFailureCopyWith<T, _$AdapterResponseFailure<T>>
      get copyWith => __$$AdapterResponseFailureCopyWithImpl<T,
          _$AdapterResponseFailure<T>>(this, _$identity);

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
  const factory AdapterResponseFailure(
          final Object? error, final StackTrace trace) =
      _$AdapterResponseFailure<T>;

  Object? get error => throw _privateConstructorUsedError;
  StackTrace get trace => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  _$$AdapterResponseFailureCopyWith<T, _$AdapterResponseFailure<T>>
      get copyWith => throw _privateConstructorUsedError;
}
