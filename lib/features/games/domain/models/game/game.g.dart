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
    };
