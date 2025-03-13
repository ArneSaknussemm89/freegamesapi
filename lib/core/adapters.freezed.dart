// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'adapters.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

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
    TResult? Function(T data)? success,
    TResult? Function(Object? error, StackTrace trace)? failure,
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
    TResult? Function(AdapterResponseSuccess<T> value)? success,
    TResult? Function(AdapterResponseFailure<T> value)? failure,
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
      _$AdapterResponseCopyWithImpl<T, $Res, AdapterResponse<T>>;
}

/// @nodoc
class _$AdapterResponseCopyWithImpl<T, $Res, $Val extends AdapterResponse<T>>
    implements $AdapterResponseCopyWith<T, $Res> {
  _$AdapterResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of AdapterResponse
  /// with the given fields replaced by the non-null parameter values.
}

/// @nodoc
abstract class _$$AdapterResponseSuccessImplCopyWith<T, $Res> {
  factory _$$AdapterResponseSuccessImplCopyWith(
          _$AdapterResponseSuccessImpl<T> value,
          $Res Function(_$AdapterResponseSuccessImpl<T>) then) =
      __$$AdapterResponseSuccessImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({T data});
}

/// @nodoc
class __$$AdapterResponseSuccessImplCopyWithImpl<T, $Res>
    extends _$AdapterResponseCopyWithImpl<T, $Res,
        _$AdapterResponseSuccessImpl<T>>
    implements _$$AdapterResponseSuccessImplCopyWith<T, $Res> {
  __$$AdapterResponseSuccessImplCopyWithImpl(
      _$AdapterResponseSuccessImpl<T> _value,
      $Res Function(_$AdapterResponseSuccessImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AdapterResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? data = freezed,
  }) {
    return _then(_$AdapterResponseSuccessImpl<T>(
      freezed == data
          ? _value.data
          : data // ignore: cast_nullable_to_non_nullable
              as T,
    ));
  }
}

/// @nodoc

class _$AdapterResponseSuccessImpl<T> implements AdapterResponseSuccess<T> {
  const _$AdapterResponseSuccessImpl(this.data);

  @override
  final T data;

  @override
  String toString() {
    return 'AdapterResponse<$T>.success(data: $data)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdapterResponseSuccessImpl<T> &&
            const DeepCollectionEquality().equals(other.data, data));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(data));

  /// Create a copy of AdapterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdapterResponseSuccessImplCopyWith<T, _$AdapterResponseSuccessImpl<T>>
      get copyWith => __$$AdapterResponseSuccessImplCopyWithImpl<T,
          _$AdapterResponseSuccessImpl<T>>(this, _$identity);

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
    TResult? Function(T data)? success,
    TResult? Function(Object? error, StackTrace trace)? failure,
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
    TResult? Function(AdapterResponseSuccess<T> value)? success,
    TResult? Function(AdapterResponseFailure<T> value)? failure,
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
      _$AdapterResponseSuccessImpl<T>;

  T get data;

  /// Create a copy of AdapterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdapterResponseSuccessImplCopyWith<T, _$AdapterResponseSuccessImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$AdapterResponseFailureImplCopyWith<T, $Res> {
  factory _$$AdapterResponseFailureImplCopyWith(
          _$AdapterResponseFailureImpl<T> value,
          $Res Function(_$AdapterResponseFailureImpl<T>) then) =
      __$$AdapterResponseFailureImplCopyWithImpl<T, $Res>;
  @useResult
  $Res call({Object? error, StackTrace trace});
}

/// @nodoc
class __$$AdapterResponseFailureImplCopyWithImpl<T, $Res>
    extends _$AdapterResponseCopyWithImpl<T, $Res,
        _$AdapterResponseFailureImpl<T>>
    implements _$$AdapterResponseFailureImplCopyWith<T, $Res> {
  __$$AdapterResponseFailureImplCopyWithImpl(
      _$AdapterResponseFailureImpl<T> _value,
      $Res Function(_$AdapterResponseFailureImpl<T>) _then)
      : super(_value, _then);

  /// Create a copy of AdapterResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? error = freezed,
    Object? trace = null,
  }) {
    return _then(_$AdapterResponseFailureImpl<T>(
      freezed == error ? _value.error : error,
      null == trace
          ? _value.trace
          : trace // ignore: cast_nullable_to_non_nullable
              as StackTrace,
    ));
  }
}

/// @nodoc

class _$AdapterResponseFailureImpl<T> implements AdapterResponseFailure<T> {
  const _$AdapterResponseFailureImpl(this.error, this.trace);

  @override
  final Object? error;
  @override
  final StackTrace trace;

  @override
  String toString() {
    return 'AdapterResponse<$T>.failure(error: $error, trace: $trace)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AdapterResponseFailureImpl<T> &&
            const DeepCollectionEquality().equals(other.error, error) &&
            (identical(other.trace, trace) || other.trace == trace));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, const DeepCollectionEquality().hash(error), trace);

  /// Create a copy of AdapterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$AdapterResponseFailureImplCopyWith<T, _$AdapterResponseFailureImpl<T>>
      get copyWith => __$$AdapterResponseFailureImplCopyWithImpl<T,
          _$AdapterResponseFailureImpl<T>>(this, _$identity);

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
    TResult? Function(T data)? success,
    TResult? Function(Object? error, StackTrace trace)? failure,
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
    TResult? Function(AdapterResponseSuccess<T> value)? success,
    TResult? Function(AdapterResponseFailure<T> value)? failure,
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
      _$AdapterResponseFailureImpl<T>;

  Object? get error;
  StackTrace get trace;

  /// Create a copy of AdapterResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$AdapterResponseFailureImplCopyWith<T, _$AdapterResponseFailureImpl<T>>
      get copyWith => throw _privateConstructorUsedError;
}
