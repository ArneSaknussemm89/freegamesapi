// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Game _$$_GameFromJson(Map<String, dynamic> json) => _$_Game(
      id: json['id'] as int,
      title: json['title'] as String,
      thumbnail: json['thumbnail'] as String,
      shortDescription: json['short_description'] as String,
      releaseDate: DateTime.parse(json['release_date'] as String),
      gameUrl: json['game_url'] as String? ?? '',
      genre: json['genre'] as String? ?? '',
      platform: json['platform'] as String? ?? '',
      publisher: json['publisher'] as String? ?? '',
      developer: json['developer'] as String? ?? '',
      freetogameProfileUrl: json['freetogame_profile_url'] as String? ?? '',
      isFavorite: json['is_favorite'] as bool? ?? false,
      $type: json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_GameToJson(_$_Game instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'short_description': instance.shortDescription,
      'release_date': instance.releaseDate.toIso8601String(),
      'game_url': instance.gameUrl,
      'genre': instance.genre,
      'platform': instance.platform,
      'publisher': instance.publisher,
      'developer': instance.developer,
      'freetogame_profile_url': instance.freetogameProfileUrl,
      'is_favorite': instance.isFavorite,
      'runtimeType': instance.$type,
    };

_$_GameNotFound _$$_GameNotFoundFromJson(Map<String, dynamic> json) =>
    _$_GameNotFound(
      json['id'] as int? ?? 0,
      json['title'] as String? ?? '',
      json['thumbnail'] as String? ?? '',
      json['shortDescription'] as String? ?? '',
      json['gameUrl'] as String? ?? '',
      json['genre'] as String? ?? '',
      json['platform'] as String? ?? '',
      json['publisher'] as String? ?? '',
      json['developer'] as String? ?? '',
      json['freetogameProfileUrl'] as String? ?? '',
      json['isFavorite'] as bool? ?? false,
      json['releaseDate'] == null
          ? DateTime.now
          : DateTime.parse(json['releaseDate'] as String),
      json['runtimeType'] as String?,
    );

Map<String, dynamic> _$$_GameNotFoundToJson(_$_GameNotFound instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'shortDescription': instance.shortDescription,
      'gameUrl': instance.gameUrl,
      'genre': instance.genre,
      'platform': instance.platform,
      'publisher': instance.publisher,
      'developer': instance.developer,
      'freetogameProfileUrl': instance.freetogameProfileUrl,
      'isFavorite': instance.isFavorite,
      'releaseDate': instance.releaseDate.toIso8601String(),
      'runtimeType': instance.$type,
    };
