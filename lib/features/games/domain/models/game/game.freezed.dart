// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'game.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Game _$GameFromJson(Map<String, dynamic> json) {
  switch (json['runtimeType']) {
    case 'default':
      return _Game.fromJson(json);
    case 'notFound':
      return _GameNotFound.fromJson(json);

    default:
      throw CheckedFromJsonException(json, 'runtimeType', 'Game',
          'Invalid union type "${json['runtimeType']}"!');
  }
}

/// @nodoc
mixin _$Game {
  int get id => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;
  String get thumbnail => throw _privateConstructorUsedError;
  String get shortDescription => throw _privateConstructorUsedError;
  DateTime get releaseDate => throw _privateConstructorUsedError;
  String get gameUrl => throw _privateConstructorUsedError;
  String get genre => throw _privateConstructorUsedError;
  String get platform => throw _privateConstructorUsedError;
  String get publisher => throw _privateConstructorUsedError;
  String get developer => throw _privateConstructorUsedError;
  String get freetogameProfileUrl => throw _privateConstructorUsedError;
  bool get isFavorite => throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int id,
            String title,
            String thumbnail,
            String shortDescription,
            DateTime releaseDate,
            String gameUrl,
            String genre,
            String platform,
            String publisher,
            String developer,
            String freetogameProfileUrl,
            bool isFavorite)
        $default, {
    required TResult Function(
            int id,
            String title,
            String thumbnail,
            String shortDescription,
            String gameUrl,
            String genre,
            String platform,
            String publisher,
            String developer,
            String freetogameProfileUrl,
            bool isFavorite,
            DateTime releaseDate)
        notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int id,
            String title,
            String thumbnail,
            String shortDescription,
            DateTime releaseDate,
            String gameUrl,
            String genre,
            String platform,
            String publisher,
            String developer,
            String freetogameProfileUrl,
            bool isFavorite)?
        $default, {
    TResult? Function(
            int id,
            String title,
            String thumbnail,
            String shortDescription,
            String gameUrl,
            String genre,
            String platform,
            String publisher,
            String developer,
            String freetogameProfileUrl,
            bool isFavorite,
            DateTime releaseDate)?
        notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int id,
            String title,
            String thumbnail,
            String shortDescription,
            DateTime releaseDate,
            String gameUrl,
            String genre,
            String platform,
            String publisher,
            String developer,
            String freetogameProfileUrl,
            bool isFavorite)?
        $default, {
    TResult Function(
            int id,
            String title,
            String thumbnail,
            String shortDescription,
            String gameUrl,
            String genre,
            String platform,
            String publisher,
            String developer,
            String freetogameProfileUrl,
            bool isFavorite,
            DateTime releaseDate)?
        notFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Game value) $default, {
    required TResult Function(_GameNotFound value) notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Game value)? $default, {
    TResult? Function(_GameNotFound value)? notFound,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Game value)? $default, {
    TResult Function(_GameNotFound value)? notFound,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;

  /// Serializes this Game to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $GameCopyWith<Game> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $GameCopyWith<$Res> {
  factory $GameCopyWith(Game value, $Res Function(Game) then) =
      _$GameCopyWithImpl<$Res, Game>;
  @useResult
  $Res call(
      {int id,
      String title,
      String thumbnail,
      String shortDescription,
      DateTime releaseDate,
      String gameUrl,
      String genre,
      String platform,
      String publisher,
      String developer,
      String freetogameProfileUrl,
      bool isFavorite});
}

/// @nodoc
class _$GameCopyWithImpl<$Res, $Val extends Game>
    implements $GameCopyWith<$Res> {
  _$GameCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? thumbnail = null,
    Object? shortDescription = null,
    Object? releaseDate = null,
    Object? gameUrl = null,
    Object? genre = null,
    Object? platform = null,
    Object? publisher = null,
    Object? developer = null,
    Object? freetogameProfileUrl = null,
    Object? isFavorite = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      gameUrl: null == gameUrl
          ? _value.gameUrl
          : gameUrl // ignore: cast_nullable_to_non_nullable
              as String,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      publisher: null == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      developer: null == developer
          ? _value.developer
          : developer // ignore: cast_nullable_to_non_nullable
              as String,
      freetogameProfileUrl: null == freetogameProfileUrl
          ? _value.freetogameProfileUrl
          : freetogameProfileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$GameImplCopyWith<$Res> implements $GameCopyWith<$Res> {
  factory _$$GameImplCopyWith(
          _$GameImpl value, $Res Function(_$GameImpl) then) =
      __$$GameImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String thumbnail,
      String shortDescription,
      DateTime releaseDate,
      String gameUrl,
      String genre,
      String platform,
      String publisher,
      String developer,
      String freetogameProfileUrl,
      bool isFavorite});
}

/// @nodoc
class __$$GameImplCopyWithImpl<$Res>
    extends _$GameCopyWithImpl<$Res, _$GameImpl>
    implements _$$GameImplCopyWith<$Res> {
  __$$GameImplCopyWithImpl(_$GameImpl _value, $Res Function(_$GameImpl) _then)
      : super(_value, _then);

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? thumbnail = null,
    Object? shortDescription = null,
    Object? releaseDate = null,
    Object? gameUrl = null,
    Object? genre = null,
    Object? platform = null,
    Object? publisher = null,
    Object? developer = null,
    Object? freetogameProfileUrl = null,
    Object? isFavorite = null,
  }) {
    return _then(_$GameImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      thumbnail: null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      shortDescription: null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      releaseDate: null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
      gameUrl: null == gameUrl
          ? _value.gameUrl
          : gameUrl // ignore: cast_nullable_to_non_nullable
              as String,
      genre: null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
      platform: null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      publisher: null == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      developer: null == developer
          ? _value.developer
          : developer // ignore: cast_nullable_to_non_nullable
              as String,
      freetogameProfileUrl: null == freetogameProfileUrl
          ? _value.freetogameProfileUrl
          : freetogameProfileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      isFavorite: null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

@JsonSerializable(fieldRename: FieldRename.snake)
class _$GameImpl implements _Game {
  const _$GameImpl(
      {required this.id,
      required this.title,
      required this.thumbnail,
      required this.shortDescription,
      required this.releaseDate,
      this.gameUrl = '',
      this.genre = '',
      this.platform = '',
      this.publisher = '',
      this.developer = '',
      this.freetogameProfileUrl = '',
      this.isFavorite = false,
      final String? $type})
      : $type = $type ?? 'default';

  factory _$GameImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameImplFromJson(json);

  @override
  final int id;
  @override
  final String title;
  @override
  final String thumbnail;
  @override
  final String shortDescription;
  @override
  final DateTime releaseDate;
  @override
  @JsonKey()
  final String gameUrl;
  @override
  @JsonKey()
  final String genre;
  @override
  @JsonKey()
  final String platform;
  @override
  @JsonKey()
  final String publisher;
  @override
  @JsonKey()
  final String developer;
  @override
  @JsonKey()
  final String freetogameProfileUrl;
  @override
  @JsonKey()
  final bool isFavorite;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Game(id: $id, title: $title, thumbnail: $thumbnail, shortDescription: $shortDescription, releaseDate: $releaseDate, gameUrl: $gameUrl, genre: $genre, platform: $platform, publisher: $publisher, developer: $developer, freetogameProfileUrl: $freetogameProfileUrl, isFavorite: $isFavorite)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate) &&
            (identical(other.gameUrl, gameUrl) || other.gameUrl == gameUrl) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.developer, developer) ||
                other.developer == developer) &&
            (identical(other.freetogameProfileUrl, freetogameProfileUrl) ||
                other.freetogameProfileUrl == freetogameProfileUrl) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      thumbnail,
      shortDescription,
      releaseDate,
      gameUrl,
      genre,
      platform,
      publisher,
      developer,
      freetogameProfileUrl,
      isFavorite);

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      __$$GameImplCopyWithImpl<_$GameImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int id,
            String title,
            String thumbnail,
            String shortDescription,
            DateTime releaseDate,
            String gameUrl,
            String genre,
            String platform,
            String publisher,
            String developer,
            String freetogameProfileUrl,
            bool isFavorite)
        $default, {
    required TResult Function(
            int id,
            String title,
            String thumbnail,
            String shortDescription,
            String gameUrl,
            String genre,
            String platform,
            String publisher,
            String developer,
            String freetogameProfileUrl,
            bool isFavorite,
            DateTime releaseDate)
        notFound,
  }) {
    return $default(
        id,
        title,
        thumbnail,
        shortDescription,
        releaseDate,
        gameUrl,
        genre,
        platform,
        publisher,
        developer,
        freetogameProfileUrl,
        isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int id,
            String title,
            String thumbnail,
            String shortDescription,
            DateTime releaseDate,
            String gameUrl,
            String genre,
            String platform,
            String publisher,
            String developer,
            String freetogameProfileUrl,
            bool isFavorite)?
        $default, {
    TResult? Function(
            int id,
            String title,
            String thumbnail,
            String shortDescription,
            String gameUrl,
            String genre,
            String platform,
            String publisher,
            String developer,
            String freetogameProfileUrl,
            bool isFavorite,
            DateTime releaseDate)?
        notFound,
  }) {
    return $default?.call(
        id,
        title,
        thumbnail,
        shortDescription,
        releaseDate,
        gameUrl,
        genre,
        platform,
        publisher,
        developer,
        freetogameProfileUrl,
        isFavorite);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int id,
            String title,
            String thumbnail,
            String shortDescription,
            DateTime releaseDate,
            String gameUrl,
            String genre,
            String platform,
            String publisher,
            String developer,
            String freetogameProfileUrl,
            bool isFavorite)?
        $default, {
    TResult Function(
            int id,
            String title,
            String thumbnail,
            String shortDescription,
            String gameUrl,
            String genre,
            String platform,
            String publisher,
            String developer,
            String freetogameProfileUrl,
            bool isFavorite,
            DateTime releaseDate)?
        notFound,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(
          id,
          title,
          thumbnail,
          shortDescription,
          releaseDate,
          gameUrl,
          genre,
          platform,
          publisher,
          developer,
          freetogameProfileUrl,
          isFavorite);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Game value) $default, {
    required TResult Function(_GameNotFound value) notFound,
  }) {
    return $default(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Game value)? $default, {
    TResult? Function(_GameNotFound value)? notFound,
  }) {
    return $default?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Game value)? $default, {
    TResult Function(_GameNotFound value)? notFound,
    required TResult orElse(),
  }) {
    if ($default != null) {
      return $default(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GameImplToJson(
      this,
    );
  }
}

abstract class _Game implements Game {
  const factory _Game(
      {required final int id,
      required final String title,
      required final String thumbnail,
      required final String shortDescription,
      required final DateTime releaseDate,
      final String gameUrl,
      final String genre,
      final String platform,
      final String publisher,
      final String developer,
      final String freetogameProfileUrl,
      final bool isFavorite}) = _$GameImpl;

  factory _Game.fromJson(Map<String, dynamic> json) = _$GameImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get thumbnail;
  @override
  String get shortDescription;
  @override
  DateTime get releaseDate;
  @override
  String get gameUrl;
  @override
  String get genre;
  @override
  String get platform;
  @override
  String get publisher;
  @override
  String get developer;
  @override
  String get freetogameProfileUrl;
  @override
  bool get isFavorite;

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameImplCopyWith<_$GameImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$GameNotFoundImplCopyWith<$Res>
    implements $GameCopyWith<$Res> {
  factory _$$GameNotFoundImplCopyWith(
          _$GameNotFoundImpl value, $Res Function(_$GameNotFoundImpl) then) =
      __$$GameNotFoundImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int id,
      String title,
      String thumbnail,
      String shortDescription,
      String gameUrl,
      String genre,
      String platform,
      String publisher,
      String developer,
      String freetogameProfileUrl,
      bool isFavorite,
      DateTime releaseDate});
}

/// @nodoc
class __$$GameNotFoundImplCopyWithImpl<$Res>
    extends _$GameCopyWithImpl<$Res, _$GameNotFoundImpl>
    implements _$$GameNotFoundImplCopyWith<$Res> {
  __$$GameNotFoundImplCopyWithImpl(
      _$GameNotFoundImpl _value, $Res Function(_$GameNotFoundImpl) _then)
      : super(_value, _then);

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? title = null,
    Object? thumbnail = null,
    Object? shortDescription = null,
    Object? gameUrl = null,
    Object? genre = null,
    Object? platform = null,
    Object? publisher = null,
    Object? developer = null,
    Object? freetogameProfileUrl = null,
    Object? isFavorite = null,
    Object? releaseDate = null,
  }) {
    return _then(_$GameNotFoundImpl(
      null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
      null == thumbnail
          ? _value.thumbnail
          : thumbnail // ignore: cast_nullable_to_non_nullable
              as String,
      null == shortDescription
          ? _value.shortDescription
          : shortDescription // ignore: cast_nullable_to_non_nullable
              as String,
      null == gameUrl
          ? _value.gameUrl
          : gameUrl // ignore: cast_nullable_to_non_nullable
              as String,
      null == genre
          ? _value.genre
          : genre // ignore: cast_nullable_to_non_nullable
              as String,
      null == platform
          ? _value.platform
          : platform // ignore: cast_nullable_to_non_nullable
              as String,
      null == publisher
          ? _value.publisher
          : publisher // ignore: cast_nullable_to_non_nullable
              as String,
      null == developer
          ? _value.developer
          : developer // ignore: cast_nullable_to_non_nullable
              as String,
      null == freetogameProfileUrl
          ? _value.freetogameProfileUrl
          : freetogameProfileUrl // ignore: cast_nullable_to_non_nullable
              as String,
      null == isFavorite
          ? _value.isFavorite
          : isFavorite // ignore: cast_nullable_to_non_nullable
              as bool,
      null == releaseDate
          ? _value.releaseDate
          : releaseDate // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$GameNotFoundImpl implements _GameNotFound {
  _$GameNotFoundImpl(
      [this.id = 0,
      this.title = '',
      this.thumbnail = '',
      this.shortDescription = '',
      this.gameUrl = '',
      this.genre = '',
      this.platform = '',
      this.publisher = '',
      this.developer = '',
      this.freetogameProfileUrl = '',
      this.isFavorite = false,
      this.releaseDate = DateTime.now,
      final String? $type])
      : $type = $type ?? 'notFound';

  factory _$GameNotFoundImpl.fromJson(Map<String, dynamic> json) =>
      _$$GameNotFoundImplFromJson(json);

  @override
  @JsonKey()
  final int id;
  @override
  @JsonKey()
  final String title;
  @override
  @JsonKey()
  final String thumbnail;
  @override
  @JsonKey()
  final String shortDescription;
  @override
  @JsonKey()
  final String gameUrl;
  @override
  @JsonKey()
  final String genre;
  @override
  @JsonKey()
  final String platform;
  @override
  @JsonKey()
  final String publisher;
  @override
  @JsonKey()
  final String developer;
  @override
  @JsonKey()
  final String freetogameProfileUrl;
  @override
  @JsonKey()
  final bool isFavorite;
  @override
  @JsonKey()
  final DateTime releaseDate;

  @JsonKey(name: 'runtimeType')
  final String $type;

  @override
  String toString() {
    return 'Game.notFound(id: $id, title: $title, thumbnail: $thumbnail, shortDescription: $shortDescription, gameUrl: $gameUrl, genre: $genre, platform: $platform, publisher: $publisher, developer: $developer, freetogameProfileUrl: $freetogameProfileUrl, isFavorite: $isFavorite, releaseDate: $releaseDate)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$GameNotFoundImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.title, title) || other.title == title) &&
            (identical(other.thumbnail, thumbnail) ||
                other.thumbnail == thumbnail) &&
            (identical(other.shortDescription, shortDescription) ||
                other.shortDescription == shortDescription) &&
            (identical(other.gameUrl, gameUrl) || other.gameUrl == gameUrl) &&
            (identical(other.genre, genre) || other.genre == genre) &&
            (identical(other.platform, platform) ||
                other.platform == platform) &&
            (identical(other.publisher, publisher) ||
                other.publisher == publisher) &&
            (identical(other.developer, developer) ||
                other.developer == developer) &&
            (identical(other.freetogameProfileUrl, freetogameProfileUrl) ||
                other.freetogameProfileUrl == freetogameProfileUrl) &&
            (identical(other.isFavorite, isFavorite) ||
                other.isFavorite == isFavorite) &&
            (identical(other.releaseDate, releaseDate) ||
                other.releaseDate == releaseDate));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      title,
      thumbnail,
      shortDescription,
      gameUrl,
      genre,
      platform,
      publisher,
      developer,
      freetogameProfileUrl,
      isFavorite,
      releaseDate);

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$GameNotFoundImplCopyWith<_$GameNotFoundImpl> get copyWith =>
      __$$GameNotFoundImplCopyWithImpl<_$GameNotFoundImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>(
    TResult Function(
            int id,
            String title,
            String thumbnail,
            String shortDescription,
            DateTime releaseDate,
            String gameUrl,
            String genre,
            String platform,
            String publisher,
            String developer,
            String freetogameProfileUrl,
            bool isFavorite)
        $default, {
    required TResult Function(
            int id,
            String title,
            String thumbnail,
            String shortDescription,
            String gameUrl,
            String genre,
            String platform,
            String publisher,
            String developer,
            String freetogameProfileUrl,
            bool isFavorite,
            DateTime releaseDate)
        notFound,
  }) {
    return notFound(
        id,
        title,
        thumbnail,
        shortDescription,
        gameUrl,
        genre,
        platform,
        publisher,
        developer,
        freetogameProfileUrl,
        isFavorite,
        releaseDate);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>(
    TResult? Function(
            int id,
            String title,
            String thumbnail,
            String shortDescription,
            DateTime releaseDate,
            String gameUrl,
            String genre,
            String platform,
            String publisher,
            String developer,
            String freetogameProfileUrl,
            bool isFavorite)?
        $default, {
    TResult? Function(
            int id,
            String title,
            String thumbnail,
            String shortDescription,
            String gameUrl,
            String genre,
            String platform,
            String publisher,
            String developer,
            String freetogameProfileUrl,
            bool isFavorite,
            DateTime releaseDate)?
        notFound,
  }) {
    return notFound?.call(
        id,
        title,
        thumbnail,
        shortDescription,
        gameUrl,
        genre,
        platform,
        publisher,
        developer,
        freetogameProfileUrl,
        isFavorite,
        releaseDate);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>(
    TResult Function(
            int id,
            String title,
            String thumbnail,
            String shortDescription,
            DateTime releaseDate,
            String gameUrl,
            String genre,
            String platform,
            String publisher,
            String developer,
            String freetogameProfileUrl,
            bool isFavorite)?
        $default, {
    TResult Function(
            int id,
            String title,
            String thumbnail,
            String shortDescription,
            String gameUrl,
            String genre,
            String platform,
            String publisher,
            String developer,
            String freetogameProfileUrl,
            bool isFavorite,
            DateTime releaseDate)?
        notFound,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(
          id,
          title,
          thumbnail,
          shortDescription,
          gameUrl,
          genre,
          platform,
          publisher,
          developer,
          freetogameProfileUrl,
          isFavorite,
          releaseDate);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>(
    TResult Function(_Game value) $default, {
    required TResult Function(_GameNotFound value) notFound,
  }) {
    return notFound(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>(
    TResult? Function(_Game value)? $default, {
    TResult? Function(_GameNotFound value)? notFound,
  }) {
    return notFound?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>(
    TResult Function(_Game value)? $default, {
    TResult Function(_GameNotFound value)? notFound,
    required TResult orElse(),
  }) {
    if (notFound != null) {
      return notFound(this);
    }
    return orElse();
  }

  @override
  Map<String, dynamic> toJson() {
    return _$$GameNotFoundImplToJson(
      this,
    );
  }
}

abstract class _GameNotFound implements Game {
  factory _GameNotFound(
      [final int id,
      final String title,
      final String thumbnail,
      final String shortDescription,
      final String gameUrl,
      final String genre,
      final String platform,
      final String publisher,
      final String developer,
      final String freetogameProfileUrl,
      final bool isFavorite,
      final DateTime releaseDate]) = _$GameNotFoundImpl;

  factory _GameNotFound.fromJson(Map<String, dynamic> json) =
      _$GameNotFoundImpl.fromJson;

  @override
  int get id;
  @override
  String get title;
  @override
  String get thumbnail;
  @override
  String get shortDescription;
  @override
  String get gameUrl;
  @override
  String get genre;
  @override
  String get platform;
  @override
  String get publisher;
  @override
  String get developer;
  @override
  String get freetogameProfileUrl;
  @override
  bool get isFavorite;
  @override
  DateTime get releaseDate;

  /// Create a copy of Game
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$GameNotFoundImplCopyWith<_$GameNotFoundImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
