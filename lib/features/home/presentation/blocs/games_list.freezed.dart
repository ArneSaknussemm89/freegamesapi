// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'games_list.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$GamesListEventTearOff {
  const _$GamesListEventTearOff();

  GamesListFetchAll fetchAll() {
    return const GamesListFetchAll();
  }

  GamesListLoad load(List<Game> games) {
    return GamesListLoad(
      games,
    );
  }

  GamesListHasError hasError(Object? error) {
    return GamesListHasError(
      error,
    );
  }

  GamesListRetry retry() {
    return const GamesListRetry();
  }
}

/// @nodoc
const $GamesListEvent = _$GamesListEventTearOff();

/// @nodoc
mixin _$GamesListEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAll,
    required TResult Function(List<Game> games) load,
    required TResult Function(Object? error) hasError,
    required TResult Function() retry,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAll,
    TResult Function(List<Game> games)? load,
    TResult Function(Object? error)? hasError,
    TResult Function()? retry,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAll,
    TResult Function(List<Game> games)? load,
    TResult Function(Object? error)? hasError,
    TResult Function()? retry,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GamesListFetchAll value) fetchAll,
    required TResult Function(GamesListLoad value) load,
    required TResult Function(GamesListHasError value) hasError,
    required TResult Function(GamesListRetry value) retry,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GamesListFetchAll value)? fetchAll,
    TResult Function(GamesListLoad value)? load,
    TResult Function(GamesListHasError value)? hasError,
    TResult Function(GamesListRetry value)? retry,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GamesListFetchAll value)? fetchAll,
    TResult Function(GamesListLoad value)? load,
    TResult Function(GamesListHasError value)? hasError,
    TResult Function(GamesListRetry value)? retry,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamesListEventCopyWith<$Res> {
  factory $GamesListEventCopyWith(
          GamesListEvent value, $Res Function(GamesListEvent) then) =
      _$GamesListEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$GamesListEventCopyWithImpl<$Res>
    implements $GamesListEventCopyWith<$Res> {
  _$GamesListEventCopyWithImpl(this._value, this._then);

  final GamesListEvent _value;
  // ignore: unused_field
  final $Res Function(GamesListEvent) _then;
}

/// @nodoc
abstract class $GamesListFetchAllCopyWith<$Res> {
  factory $GamesListFetchAllCopyWith(
          GamesListFetchAll value, $Res Function(GamesListFetchAll) then) =
      _$GamesListFetchAllCopyWithImpl<$Res>;
}

/// @nodoc
class _$GamesListFetchAllCopyWithImpl<$Res>
    extends _$GamesListEventCopyWithImpl<$Res>
    implements $GamesListFetchAllCopyWith<$Res> {
  _$GamesListFetchAllCopyWithImpl(
      GamesListFetchAll _value, $Res Function(GamesListFetchAll) _then)
      : super(_value, (v) => _then(v as GamesListFetchAll));

  @override
  GamesListFetchAll get _value => super._value as GamesListFetchAll;
}

/// @nodoc

class _$GamesListFetchAll implements GamesListFetchAll {
  const _$GamesListFetchAll();

  @override
  String toString() {
    return 'GamesListEvent.fetchAll()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GamesListFetchAll);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAll,
    required TResult Function(List<Game> games) load,
    required TResult Function(Object? error) hasError,
    required TResult Function() retry,
  }) {
    return fetchAll();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAll,
    TResult Function(List<Game> games)? load,
    TResult Function(Object? error)? hasError,
    TResult Function()? retry,
  }) {
    return fetchAll?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAll,
    TResult Function(List<Game> games)? load,
    TResult Function(Object? error)? hasError,
    TResult Function()? retry,
    required TResult orElse(),
  }) {
    if (fetchAll != null) {
      return fetchAll();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GamesListFetchAll value) fetchAll,
    required TResult Function(GamesListLoad value) load,
    required TResult Function(GamesListHasError value) hasError,
    required TResult Function(GamesListRetry value) retry,
  }) {
    return fetchAll(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GamesListFetchAll value)? fetchAll,
    TResult Function(GamesListLoad value)? load,
    TResult Function(GamesListHasError value)? hasError,
    TResult Function(GamesListRetry value)? retry,
  }) {
    return fetchAll?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GamesListFetchAll value)? fetchAll,
    TResult Function(GamesListLoad value)? load,
    TResult Function(GamesListHasError value)? hasError,
    TResult Function(GamesListRetry value)? retry,
    required TResult orElse(),
  }) {
    if (fetchAll != null) {
      return fetchAll(this);
    }
    return orElse();
  }
}

abstract class GamesListFetchAll implements GamesListEvent {
  const factory GamesListFetchAll() = _$GamesListFetchAll;
}

/// @nodoc
abstract class $GamesListLoadCopyWith<$Res> {
  factory $GamesListLoadCopyWith(
          GamesListLoad value, $Res Function(GamesListLoad) then) =
      _$GamesListLoadCopyWithImpl<$Res>;
  $Res call({List<Game> games});
}

/// @nodoc
class _$GamesListLoadCopyWithImpl<$Res>
    extends _$GamesListEventCopyWithImpl<$Res>
    implements $GamesListLoadCopyWith<$Res> {
  _$GamesListLoadCopyWithImpl(
      GamesListLoad _value, $Res Function(GamesListLoad) _then)
      : super(_value, (v) => _then(v as GamesListLoad));

  @override
  GamesListLoad get _value => super._value as GamesListLoad;

  @override
  $Res call({
    Object? games = freezed,
  }) {
    return _then(GamesListLoad(
      games == freezed
          ? _value.games
          : games // ignore: cast_nullable_to_non_nullable
              as List<Game>,
    ));
  }
}

/// @nodoc

class _$GamesListLoad implements GamesListLoad {
  const _$GamesListLoad(this.games);

  @override
  final List<Game> games;

  @override
  String toString() {
    return 'GamesListEvent.load(games: $games)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GamesListLoad &&
            const DeepCollectionEquality().equals(other.games, games));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(games));

  @JsonKey(ignore: true)
  @override
  $GamesListLoadCopyWith<GamesListLoad> get copyWith =>
      _$GamesListLoadCopyWithImpl<GamesListLoad>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAll,
    required TResult Function(List<Game> games) load,
    required TResult Function(Object? error) hasError,
    required TResult Function() retry,
  }) {
    return load(games);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAll,
    TResult Function(List<Game> games)? load,
    TResult Function(Object? error)? hasError,
    TResult Function()? retry,
  }) {
    return load?.call(games);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAll,
    TResult Function(List<Game> games)? load,
    TResult Function(Object? error)? hasError,
    TResult Function()? retry,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(games);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GamesListFetchAll value) fetchAll,
    required TResult Function(GamesListLoad value) load,
    required TResult Function(GamesListHasError value) hasError,
    required TResult Function(GamesListRetry value) retry,
  }) {
    return load(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GamesListFetchAll value)? fetchAll,
    TResult Function(GamesListLoad value)? load,
    TResult Function(GamesListHasError value)? hasError,
    TResult Function(GamesListRetry value)? retry,
  }) {
    return load?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GamesListFetchAll value)? fetchAll,
    TResult Function(GamesListLoad value)? load,
    TResult Function(GamesListHasError value)? hasError,
    TResult Function(GamesListRetry value)? retry,
    required TResult orElse(),
  }) {
    if (load != null) {
      return load(this);
    }
    return orElse();
  }
}

abstract class GamesListLoad implements GamesListEvent {
  const factory GamesListLoad(List<Game> games) = _$GamesListLoad;

  List<Game> get games;
  @JsonKey(ignore: true)
  $GamesListLoadCopyWith<GamesListLoad> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamesListHasErrorCopyWith<$Res> {
  factory $GamesListHasErrorCopyWith(
          GamesListHasError value, $Res Function(GamesListHasError) then) =
      _$GamesListHasErrorCopyWithImpl<$Res>;
  $Res call({Object? error});
}

/// @nodoc
class _$GamesListHasErrorCopyWithImpl<$Res>
    extends _$GamesListEventCopyWithImpl<$Res>
    implements $GamesListHasErrorCopyWith<$Res> {
  _$GamesListHasErrorCopyWithImpl(
      GamesListHasError _value, $Res Function(GamesListHasError) _then)
      : super(_value, (v) => _then(v as GamesListHasError));

  @override
  GamesListHasError get _value => super._value as GamesListHasError;

  @override
  $Res call({
    Object? error = freezed,
  }) {
    return _then(GamesListHasError(
      error == freezed ? _value.error : error,
    ));
  }
}

/// @nodoc

class _$GamesListHasError implements GamesListHasError {
  const _$GamesListHasError(this.error);

  @override
  final Object? error;

  @override
  String toString() {
    return 'GamesListEvent.hasError(error: $error)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GamesListHasError &&
            const DeepCollectionEquality().equals(other.error, error));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(error));

  @JsonKey(ignore: true)
  @override
  $GamesListHasErrorCopyWith<GamesListHasError> get copyWith =>
      _$GamesListHasErrorCopyWithImpl<GamesListHasError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAll,
    required TResult Function(List<Game> games) load,
    required TResult Function(Object? error) hasError,
    required TResult Function() retry,
  }) {
    return hasError(error);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAll,
    TResult Function(List<Game> games)? load,
    TResult Function(Object? error)? hasError,
    TResult Function()? retry,
  }) {
    return hasError?.call(error);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAll,
    TResult Function(List<Game> games)? load,
    TResult Function(Object? error)? hasError,
    TResult Function()? retry,
    required TResult orElse(),
  }) {
    if (hasError != null) {
      return hasError(error);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GamesListFetchAll value) fetchAll,
    required TResult Function(GamesListLoad value) load,
    required TResult Function(GamesListHasError value) hasError,
    required TResult Function(GamesListRetry value) retry,
  }) {
    return hasError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GamesListFetchAll value)? fetchAll,
    TResult Function(GamesListLoad value)? load,
    TResult Function(GamesListHasError value)? hasError,
    TResult Function(GamesListRetry value)? retry,
  }) {
    return hasError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GamesListFetchAll value)? fetchAll,
    TResult Function(GamesListLoad value)? load,
    TResult Function(GamesListHasError value)? hasError,
    TResult Function(GamesListRetry value)? retry,
    required TResult orElse(),
  }) {
    if (hasError != null) {
      return hasError(this);
    }
    return orElse();
  }
}

abstract class GamesListHasError implements GamesListEvent {
  const factory GamesListHasError(Object? error) = _$GamesListHasError;

  Object? get error;
  @JsonKey(ignore: true)
  $GamesListHasErrorCopyWith<GamesListHasError> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamesListRetryCopyWith<$Res> {
  factory $GamesListRetryCopyWith(
          GamesListRetry value, $Res Function(GamesListRetry) then) =
      _$GamesListRetryCopyWithImpl<$Res>;
}

/// @nodoc
class _$GamesListRetryCopyWithImpl<$Res>
    extends _$GamesListEventCopyWithImpl<$Res>
    implements $GamesListRetryCopyWith<$Res> {
  _$GamesListRetryCopyWithImpl(
      GamesListRetry _value, $Res Function(GamesListRetry) _then)
      : super(_value, (v) => _then(v as GamesListRetry));

  @override
  GamesListRetry get _value => super._value as GamesListRetry;
}

/// @nodoc

class _$GamesListRetry implements GamesListRetry {
  const _$GamesListRetry();

  @override
  String toString() {
    return 'GamesListEvent.retry()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GamesListRetry);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() fetchAll,
    required TResult Function(List<Game> games) load,
    required TResult Function(Object? error) hasError,
    required TResult Function() retry,
  }) {
    return retry();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? fetchAll,
    TResult Function(List<Game> games)? load,
    TResult Function(Object? error)? hasError,
    TResult Function()? retry,
  }) {
    return retry?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? fetchAll,
    TResult Function(List<Game> games)? load,
    TResult Function(Object? error)? hasError,
    TResult Function()? retry,
    required TResult orElse(),
  }) {
    if (retry != null) {
      return retry();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GamesListFetchAll value) fetchAll,
    required TResult Function(GamesListLoad value) load,
    required TResult Function(GamesListHasError value) hasError,
    required TResult Function(GamesListRetry value) retry,
  }) {
    return retry(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GamesListFetchAll value)? fetchAll,
    TResult Function(GamesListLoad value)? load,
    TResult Function(GamesListHasError value)? hasError,
    TResult Function(GamesListRetry value)? retry,
  }) {
    return retry?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GamesListFetchAll value)? fetchAll,
    TResult Function(GamesListLoad value)? load,
    TResult Function(GamesListHasError value)? hasError,
    TResult Function(GamesListRetry value)? retry,
    required TResult orElse(),
  }) {
    if (retry != null) {
      return retry(this);
    }
    return orElse();
  }
}

abstract class GamesListRetry implements GamesListEvent {
  const factory GamesListRetry() = _$GamesListRetry;
}

/// @nodoc
class _$GamesListStateTearOff {
  const _$GamesListStateTearOff();

  GamesListLoading loading() {
    return const GamesListLoading();
  }

  GamesListLoaded loaded(List<Game> games) {
    return GamesListLoaded(
      games,
    );
  }

  GamesListError error(String message) {
    return GamesListError(
      message,
    );
  }
}

/// @nodoc
const $GamesListState = _$GamesListStateTearOff();

/// @nodoc
mixin _$GamesListState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Game> games) loaded,
    required TResult Function(String message) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Game> games)? loaded,
    TResult Function(String message)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Game> games)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GamesListLoading value) loading,
    required TResult Function(GamesListLoaded value) loaded,
    required TResult Function(GamesListError value) error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GamesListLoading value)? loading,
    TResult Function(GamesListLoaded value)? loaded,
    TResult Function(GamesListError value)? error,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GamesListLoading value)? loading,
    TResult Function(GamesListLoaded value)? loaded,
    TResult Function(GamesListError value)? error,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamesListStateCopyWith<$Res> {
  factory $GamesListStateCopyWith(
          GamesListState value, $Res Function(GamesListState) then) =
      _$GamesListStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$GamesListStateCopyWithImpl<$Res>
    implements $GamesListStateCopyWith<$Res> {
  _$GamesListStateCopyWithImpl(this._value, this._then);

  final GamesListState _value;
  // ignore: unused_field
  final $Res Function(GamesListState) _then;
}

/// @nodoc
abstract class $GamesListLoadingCopyWith<$Res> {
  factory $GamesListLoadingCopyWith(
          GamesListLoading value, $Res Function(GamesListLoading) then) =
      _$GamesListLoadingCopyWithImpl<$Res>;
}

/// @nodoc
class _$GamesListLoadingCopyWithImpl<$Res>
    extends _$GamesListStateCopyWithImpl<$Res>
    implements $GamesListLoadingCopyWith<$Res> {
  _$GamesListLoadingCopyWithImpl(
      GamesListLoading _value, $Res Function(GamesListLoading) _then)
      : super(_value, (v) => _then(v as GamesListLoading));

  @override
  GamesListLoading get _value => super._value as GamesListLoading;
}

/// @nodoc

class _$GamesListLoading implements GamesListLoading {
  const _$GamesListLoading();

  @override
  String toString() {
    return 'GamesListState.loading()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is GamesListLoading);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Game> games) loaded,
    required TResult Function(String message) error,
  }) {
    return loading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Game> games)? loaded,
    TResult Function(String message)? error,
  }) {
    return loading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Game> games)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GamesListLoading value) loading,
    required TResult Function(GamesListLoaded value) loaded,
    required TResult Function(GamesListError value) error,
  }) {
    return loading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GamesListLoading value)? loading,
    TResult Function(GamesListLoaded value)? loaded,
    TResult Function(GamesListError value)? error,
  }) {
    return loading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GamesListLoading value)? loading,
    TResult Function(GamesListLoaded value)? loaded,
    TResult Function(GamesListError value)? error,
    required TResult orElse(),
  }) {
    if (loading != null) {
      return loading(this);
    }
    return orElse();
  }
}

abstract class GamesListLoading implements GamesListState {
  const factory GamesListLoading() = _$GamesListLoading;
}

/// @nodoc
abstract class $GamesListLoadedCopyWith<$Res> {
  factory $GamesListLoadedCopyWith(
          GamesListLoaded value, $Res Function(GamesListLoaded) then) =
      _$GamesListLoadedCopyWithImpl<$Res>;
  $Res call({List<Game> games});
}

/// @nodoc
class _$GamesListLoadedCopyWithImpl<$Res>
    extends _$GamesListStateCopyWithImpl<$Res>
    implements $GamesListLoadedCopyWith<$Res> {
  _$GamesListLoadedCopyWithImpl(
      GamesListLoaded _value, $Res Function(GamesListLoaded) _then)
      : super(_value, (v) => _then(v as GamesListLoaded));

  @override
  GamesListLoaded get _value => super._value as GamesListLoaded;

  @override
  $Res call({
    Object? games = freezed,
  }) {
    return _then(GamesListLoaded(
      games == freezed
          ? _value.games
          : games // ignore: cast_nullable_to_non_nullable
              as List<Game>,
    ));
  }
}

/// @nodoc

class _$GamesListLoaded implements GamesListLoaded {
  const _$GamesListLoaded(this.games);

  @override
  final List<Game> games;

  @override
  String toString() {
    return 'GamesListState.loaded(games: $games)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GamesListLoaded &&
            const DeepCollectionEquality().equals(other.games, games));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(games));

  @JsonKey(ignore: true)
  @override
  $GamesListLoadedCopyWith<GamesListLoaded> get copyWith =>
      _$GamesListLoadedCopyWithImpl<GamesListLoaded>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Game> games) loaded,
    required TResult Function(String message) error,
  }) {
    return loaded(games);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Game> games)? loaded,
    TResult Function(String message)? error,
  }) {
    return loaded?.call(games);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Game> games)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(games);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GamesListLoading value) loading,
    required TResult Function(GamesListLoaded value) loaded,
    required TResult Function(GamesListError value) error,
  }) {
    return loaded(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GamesListLoading value)? loading,
    TResult Function(GamesListLoaded value)? loaded,
    TResult Function(GamesListError value)? error,
  }) {
    return loaded?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GamesListLoading value)? loading,
    TResult Function(GamesListLoaded value)? loaded,
    TResult Function(GamesListError value)? error,
    required TResult orElse(),
  }) {
    if (loaded != null) {
      return loaded(this);
    }
    return orElse();
  }
}

abstract class GamesListLoaded implements GamesListState {
  const factory GamesListLoaded(List<Game> games) = _$GamesListLoaded;

  List<Game> get games;
  @JsonKey(ignore: true)
  $GamesListLoadedCopyWith<GamesListLoaded> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GamesListErrorCopyWith<$Res> {
  factory $GamesListErrorCopyWith(
          GamesListError value, $Res Function(GamesListError) then) =
      _$GamesListErrorCopyWithImpl<$Res>;
  $Res call({String message});
}

/// @nodoc
class _$GamesListErrorCopyWithImpl<$Res>
    extends _$GamesListStateCopyWithImpl<$Res>
    implements $GamesListErrorCopyWith<$Res> {
  _$GamesListErrorCopyWithImpl(
      GamesListError _value, $Res Function(GamesListError) _then)
      : super(_value, (v) => _then(v as GamesListError));

  @override
  GamesListError get _value => super._value as GamesListError;

  @override
  $Res call({
    Object? message = freezed,
  }) {
    return _then(GamesListError(
      message == freezed
          ? _value.message
          : message // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$GamesListError implements GamesListError {
  const _$GamesListError(this.message);

  @override
  final String message;

  @override
  String toString() {
    return 'GamesListState.error(message: $message)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is GamesListError &&
            const DeepCollectionEquality().equals(other.message, message));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(message));

  @JsonKey(ignore: true)
  @override
  $GamesListErrorCopyWith<GamesListError> get copyWith =>
      _$GamesListErrorCopyWithImpl<GamesListError>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() loading,
    required TResult Function(List<Game> games) loaded,
    required TResult Function(String message) error,
  }) {
    return error(message);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Game> games)? loaded,
    TResult Function(String message)? error,
  }) {
    return error?.call(message);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? loading,
    TResult Function(List<Game> games)? loaded,
    TResult Function(String message)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(message);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(GamesListLoading value) loading,
    required TResult Function(GamesListLoaded value) loaded,
    required TResult Function(GamesListError value) error,
  }) {
    return error(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(GamesListLoading value)? loading,
    TResult Function(GamesListLoaded value)? loaded,
    TResult Function(GamesListError value)? error,
  }) {
    return error?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(GamesListLoading value)? loading,
    TResult Function(GamesListLoaded value)? loaded,
    TResult Function(GamesListError value)? error,
    required TResult orElse(),
  }) {
    if (error != null) {
      return error(this);
    }
    return orElse();
  }
}

abstract class GamesListError implements GamesListState {
  const factory GamesListError(String message) = _$GamesListError;

  String get message;
  @JsonKey(ignore: true)
  $GamesListErrorCopyWith<GamesListError> get copyWith =>
      throw _privateConstructorUsedError;
}
