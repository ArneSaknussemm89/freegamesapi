// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target

part of 'authentication.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more informations: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
class _$AuthenticationEventTearOff {
  const _$AuthenticationEventTearOff();

  SignInWithPhoneNumber signInWithPhoneNumber() {
    return const SignInWithPhoneNumber();
  }

  Authenticate authenticate(User user) {
    return Authenticate(
      user,
    );
  }

  Unauthenticate unauthenticate() {
    return const Unauthenticate();
  }
}

/// @nodoc
const $AuthenticationEvent = _$AuthenticationEventTearOff();

/// @nodoc
mixin _$AuthenticationEvent {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInWithPhoneNumber,
    required TResult Function(User user) authenticate,
    required TResult Function() unauthenticate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? signInWithPhoneNumber,
    TResult Function(User user)? authenticate,
    TResult Function()? unauthenticate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInWithPhoneNumber,
    TResult Function(User user)? authenticate,
    TResult Function()? unauthenticate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInWithPhoneNumber value)
        signInWithPhoneNumber,
    required TResult Function(Authenticate value) authenticate,
    required TResult Function(Unauthenticate value) unauthenticate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInWithPhoneNumber value)? signInWithPhoneNumber,
    TResult Function(Authenticate value)? authenticate,
    TResult Function(Unauthenticate value)? unauthenticate,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInWithPhoneNumber value)? signInWithPhoneNumber,
    TResult Function(Authenticate value)? authenticate,
    TResult Function(Unauthenticate value)? unauthenticate,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationEventCopyWith<$Res> {
  factory $AuthenticationEventCopyWith(
          AuthenticationEvent value, $Res Function(AuthenticationEvent) then) =
      _$AuthenticationEventCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationEventCopyWithImpl<$Res>
    implements $AuthenticationEventCopyWith<$Res> {
  _$AuthenticationEventCopyWithImpl(this._value, this._then);

  final AuthenticationEvent _value;
  // ignore: unused_field
  final $Res Function(AuthenticationEvent) _then;
}

/// @nodoc
abstract class $SignInWithPhoneNumberCopyWith<$Res> {
  factory $SignInWithPhoneNumberCopyWith(SignInWithPhoneNumber value,
          $Res Function(SignInWithPhoneNumber) then) =
      _$SignInWithPhoneNumberCopyWithImpl<$Res>;
}

/// @nodoc
class _$SignInWithPhoneNumberCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements $SignInWithPhoneNumberCopyWith<$Res> {
  _$SignInWithPhoneNumberCopyWithImpl(
      SignInWithPhoneNumber _value, $Res Function(SignInWithPhoneNumber) _then)
      : super(_value, (v) => _then(v as SignInWithPhoneNumber));

  @override
  SignInWithPhoneNumber get _value => super._value as SignInWithPhoneNumber;
}

/// @nodoc

class _$SignInWithPhoneNumber implements SignInWithPhoneNumber {
  const _$SignInWithPhoneNumber();

  @override
  String toString() {
    return 'AuthenticationEvent.signInWithPhoneNumber()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignInWithPhoneNumber);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInWithPhoneNumber,
    required TResult Function(User user) authenticate,
    required TResult Function() unauthenticate,
  }) {
    return signInWithPhoneNumber();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? signInWithPhoneNumber,
    TResult Function(User user)? authenticate,
    TResult Function()? unauthenticate,
  }) {
    return signInWithPhoneNumber?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInWithPhoneNumber,
    TResult Function(User user)? authenticate,
    TResult Function()? unauthenticate,
    required TResult orElse(),
  }) {
    if (signInWithPhoneNumber != null) {
      return signInWithPhoneNumber();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInWithPhoneNumber value)
        signInWithPhoneNumber,
    required TResult Function(Authenticate value) authenticate,
    required TResult Function(Unauthenticate value) unauthenticate,
  }) {
    return signInWithPhoneNumber(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInWithPhoneNumber value)? signInWithPhoneNumber,
    TResult Function(Authenticate value)? authenticate,
    TResult Function(Unauthenticate value)? unauthenticate,
  }) {
    return signInWithPhoneNumber?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInWithPhoneNumber value)? signInWithPhoneNumber,
    TResult Function(Authenticate value)? authenticate,
    TResult Function(Unauthenticate value)? unauthenticate,
    required TResult orElse(),
  }) {
    if (signInWithPhoneNumber != null) {
      return signInWithPhoneNumber(this);
    }
    return orElse();
  }
}

abstract class SignInWithPhoneNumber implements AuthenticationEvent {
  const factory SignInWithPhoneNumber() = _$SignInWithPhoneNumber;
}

/// @nodoc
abstract class $AuthenticateCopyWith<$Res> {
  factory $AuthenticateCopyWith(
          Authenticate value, $Res Function(Authenticate) then) =
      _$AuthenticateCopyWithImpl<$Res>;
  $Res call({User user});
}

/// @nodoc
class _$AuthenticateCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements $AuthenticateCopyWith<$Res> {
  _$AuthenticateCopyWithImpl(
      Authenticate _value, $Res Function(Authenticate) _then)
      : super(_value, (v) => _then(v as Authenticate));

  @override
  Authenticate get _value => super._value as Authenticate;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(Authenticate(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$Authenticate implements Authenticate {
  const _$Authenticate(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AuthenticationEvent.authenticate(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Authenticate &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  $AuthenticateCopyWith<Authenticate> get copyWith =>
      _$AuthenticateCopyWithImpl<Authenticate>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInWithPhoneNumber,
    required TResult Function(User user) authenticate,
    required TResult Function() unauthenticate,
  }) {
    return authenticate(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? signInWithPhoneNumber,
    TResult Function(User user)? authenticate,
    TResult Function()? unauthenticate,
  }) {
    return authenticate?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInWithPhoneNumber,
    TResult Function(User user)? authenticate,
    TResult Function()? unauthenticate,
    required TResult orElse(),
  }) {
    if (authenticate != null) {
      return authenticate(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInWithPhoneNumber value)
        signInWithPhoneNumber,
    required TResult Function(Authenticate value) authenticate,
    required TResult Function(Unauthenticate value) unauthenticate,
  }) {
    return authenticate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInWithPhoneNumber value)? signInWithPhoneNumber,
    TResult Function(Authenticate value)? authenticate,
    TResult Function(Unauthenticate value)? unauthenticate,
  }) {
    return authenticate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInWithPhoneNumber value)? signInWithPhoneNumber,
    TResult Function(Authenticate value)? authenticate,
    TResult Function(Unauthenticate value)? unauthenticate,
    required TResult orElse(),
  }) {
    if (authenticate != null) {
      return authenticate(this);
    }
    return orElse();
  }
}

abstract class Authenticate implements AuthenticationEvent {
  const factory Authenticate(User user) = _$Authenticate;

  User get user;
  @JsonKey(ignore: true)
  $AuthenticateCopyWith<Authenticate> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UnauthenticateCopyWith<$Res> {
  factory $UnauthenticateCopyWith(
          Unauthenticate value, $Res Function(Unauthenticate) then) =
      _$UnauthenticateCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnauthenticateCopyWithImpl<$Res>
    extends _$AuthenticationEventCopyWithImpl<$Res>
    implements $UnauthenticateCopyWith<$Res> {
  _$UnauthenticateCopyWithImpl(
      Unauthenticate _value, $Res Function(Unauthenticate) _then)
      : super(_value, (v) => _then(v as Unauthenticate));

  @override
  Unauthenticate get _value => super._value as Unauthenticate;
}

/// @nodoc

class _$Unauthenticate implements Unauthenticate {
  const _$Unauthenticate();

  @override
  String toString() {
    return 'AuthenticationEvent.unauthenticate()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Unauthenticate);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() signInWithPhoneNumber,
    required TResult Function(User user) authenticate,
    required TResult Function() unauthenticate,
  }) {
    return unauthenticate();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? signInWithPhoneNumber,
    TResult Function(User user)? authenticate,
    TResult Function()? unauthenticate,
  }) {
    return unauthenticate?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? signInWithPhoneNumber,
    TResult Function(User user)? authenticate,
    TResult Function()? unauthenticate,
    required TResult orElse(),
  }) {
    if (unauthenticate != null) {
      return unauthenticate();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(SignInWithPhoneNumber value)
        signInWithPhoneNumber,
    required TResult Function(Authenticate value) authenticate,
    required TResult Function(Unauthenticate value) unauthenticate,
  }) {
    return unauthenticate(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(SignInWithPhoneNumber value)? signInWithPhoneNumber,
    TResult Function(Authenticate value)? authenticate,
    TResult Function(Unauthenticate value)? unauthenticate,
  }) {
    return unauthenticate?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(SignInWithPhoneNumber value)? signInWithPhoneNumber,
    TResult Function(Authenticate value)? authenticate,
    TResult Function(Unauthenticate value)? unauthenticate,
    required TResult orElse(),
  }) {
    if (unauthenticate != null) {
      return unauthenticate(this);
    }
    return orElse();
  }
}

abstract class Unauthenticate implements AuthenticationEvent {
  const factory Unauthenticate() = _$Unauthenticate;
}

/// @nodoc
class _$AuthenticationStateTearOff {
  const _$AuthenticationStateTearOff();

  Uninitialized uninitialized() {
    return const Uninitialized();
  }

  Unauthenticated unauthenticated() {
    return const Unauthenticated();
  }

  Authenticated authenticated(User user) {
    return Authenticated(
      user,
    );
  }
}

/// @nodoc
const $AuthenticationState = _$AuthenticationStateTearOff();

/// @nodoc
mixin _$AuthenticationState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() unauthenticated,
    required TResult Function(User user) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? unauthenticated,
    TResult Function(User user)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? unauthenticated,
    TResult Function(User user)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Uninitialized value) uninitialized,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Authenticated value) authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Uninitialized value)? uninitialized,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticated value)? authenticated,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Uninitialized value)? uninitialized,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticated value)? authenticated,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res>;
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  final AuthenticationState _value;
  // ignore: unused_field
  final $Res Function(AuthenticationState) _then;
}

/// @nodoc
abstract class $UninitializedCopyWith<$Res> {
  factory $UninitializedCopyWith(
          Uninitialized value, $Res Function(Uninitialized) then) =
      _$UninitializedCopyWithImpl<$Res>;
}

/// @nodoc
class _$UninitializedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $UninitializedCopyWith<$Res> {
  _$UninitializedCopyWithImpl(
      Uninitialized _value, $Res Function(Uninitialized) _then)
      : super(_value, (v) => _then(v as Uninitialized));

  @override
  Uninitialized get _value => super._value as Uninitialized;
}

/// @nodoc

class _$Uninitialized implements Uninitialized {
  const _$Uninitialized();

  @override
  String toString() {
    return 'AuthenticationState.uninitialized()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Uninitialized);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() unauthenticated,
    required TResult Function(User user) authenticated,
  }) {
    return uninitialized();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? unauthenticated,
    TResult Function(User user)? authenticated,
  }) {
    return uninitialized?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? unauthenticated,
    TResult Function(User user)? authenticated,
    required TResult orElse(),
  }) {
    if (uninitialized != null) {
      return uninitialized();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Uninitialized value) uninitialized,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Authenticated value) authenticated,
  }) {
    return uninitialized(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Uninitialized value)? uninitialized,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticated value)? authenticated,
  }) {
    return uninitialized?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Uninitialized value)? uninitialized,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (uninitialized != null) {
      return uninitialized(this);
    }
    return orElse();
  }
}

abstract class Uninitialized implements AuthenticationState {
  const factory Uninitialized() = _$Uninitialized;
}

/// @nodoc
abstract class $UnauthenticatedCopyWith<$Res> {
  factory $UnauthenticatedCopyWith(
          Unauthenticated value, $Res Function(Unauthenticated) then) =
      _$UnauthenticatedCopyWithImpl<$Res>;
}

/// @nodoc
class _$UnauthenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $UnauthenticatedCopyWith<$Res> {
  _$UnauthenticatedCopyWithImpl(
      Unauthenticated _value, $Res Function(Unauthenticated) _then)
      : super(_value, (v) => _then(v as Unauthenticated));

  @override
  Unauthenticated get _value => super._value as Unauthenticated;
}

/// @nodoc

class _$Unauthenticated implements Unauthenticated {
  const _$Unauthenticated();

  @override
  String toString() {
    return 'AuthenticationState.unauthenticated()';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is Unauthenticated);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() unauthenticated,
    required TResult Function(User user) authenticated,
  }) {
    return unauthenticated();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? unauthenticated,
    TResult Function(User user)? authenticated,
  }) {
    return unauthenticated?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? unauthenticated,
    TResult Function(User user)? authenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Uninitialized value) uninitialized,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Authenticated value) authenticated,
  }) {
    return unauthenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Uninitialized value)? uninitialized,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticated value)? authenticated,
  }) {
    return unauthenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Uninitialized value)? uninitialized,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (unauthenticated != null) {
      return unauthenticated(this);
    }
    return orElse();
  }
}

abstract class Unauthenticated implements AuthenticationState {
  const factory Unauthenticated() = _$Unauthenticated;
}

/// @nodoc
abstract class $AuthenticatedCopyWith<$Res> {
  factory $AuthenticatedCopyWith(
          Authenticated value, $Res Function(Authenticated) then) =
      _$AuthenticatedCopyWithImpl<$Res>;
  $Res call({User user});
}

/// @nodoc
class _$AuthenticatedCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res>
    implements $AuthenticatedCopyWith<$Res> {
  _$AuthenticatedCopyWithImpl(
      Authenticated _value, $Res Function(Authenticated) _then)
      : super(_value, (v) => _then(v as Authenticated));

  @override
  Authenticated get _value => super._value as Authenticated;

  @override
  $Res call({
    Object? user = freezed,
  }) {
    return _then(Authenticated(
      user == freezed
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as User,
    ));
  }
}

/// @nodoc

class _$Authenticated implements Authenticated {
  const _$Authenticated(this.user);

  @override
  final User user;

  @override
  String toString() {
    return 'AuthenticationState.authenticated(user: $user)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Authenticated &&
            const DeepCollectionEquality().equals(other.user, user));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(user));

  @JsonKey(ignore: true)
  @override
  $AuthenticatedCopyWith<Authenticated> get copyWith =>
      _$AuthenticatedCopyWithImpl<Authenticated>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() uninitialized,
    required TResult Function() unauthenticated,
    required TResult Function(User user) authenticated,
  }) {
    return authenticated(user);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? unauthenticated,
    TResult Function(User user)? authenticated,
  }) {
    return authenticated?.call(user);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? uninitialized,
    TResult Function()? unauthenticated,
    TResult Function(User user)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(user);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(Uninitialized value) uninitialized,
    required TResult Function(Unauthenticated value) unauthenticated,
    required TResult Function(Authenticated value) authenticated,
  }) {
    return authenticated(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult Function(Uninitialized value)? uninitialized,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticated value)? authenticated,
  }) {
    return authenticated?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(Uninitialized value)? uninitialized,
    TResult Function(Unauthenticated value)? unauthenticated,
    TResult Function(Authenticated value)? authenticated,
    required TResult orElse(),
  }) {
    if (authenticated != null) {
      return authenticated(this);
    }
    return orElse();
  }
}

abstract class Authenticated implements AuthenticationState {
  const factory Authenticated(User user) = _$Authenticated;

  User get user;
  @JsonKey(ignore: true)
  $AuthenticatedCopyWith<Authenticated> get copyWith =>
      throw _privateConstructorUsedError;
}
