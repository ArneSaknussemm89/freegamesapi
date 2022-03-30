// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$_Game _$$_GameFromJson(Map<String, dynamic> json) => _$_Game(
      json['id'] as int,
      json['title'] as String,
      json['thumbnail'] as String,
      json['short_description'] as String,
      json['game_url'] as String,
      json['genre'] as String,
      json['platform'] as String,
      json['publisher'] as String,
      json['developer'] as String,
      DateTime.parse(json['release_date'] as String),
      json['freetogame_profile_url'] as String,
    );

Map<String, dynamic> _$$_GameToJson(_$_Game instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'short_description': instance.shortDescription,
      'game_url': instance.gameUrl,
      'genre': instance.genre,
      'platform': instance.platform,
      'publisher': instance.publisher,
      'developer': instance.developer,
      'release_date': instance.releaseDate.toIso8601String(),
      'freetogame_profile_url': instance.freetogameProfileUrl,
    };
