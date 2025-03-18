// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$GameImpl _$$GameImplFromJson(Map<String, dynamic> json) => _$GameImpl(
      id: (json['id'] as num).toInt(),
      title: json['title'] as String,
      thumbnail: json['thumbnail'] as String,
      shortDescription: json['short_description'] as String,
      gameUrl: json['game_url'] as String? ?? '',
      genre: json['genre'] as String? ?? '',
      platform: json['platform'] as String? ?? '',
      publisher: json['publisher'] as String? ?? '',
      developer: json['developer'] as String? ?? '',
      freetogameProfileUrl: json['freetogame_profile_url'] as String? ?? '',
      isFavorite: json['is_favorite'] as bool? ?? false,
      releaseDate: json['release_date'] == null
          ? null
          : DateTime.parse(json['release_date'] as String),
    );

const _$$GameImplFieldMap = <String, String>{
  'id': 'id',
  'title': 'title',
  'thumbnail': 'thumbnail',
  'shortDescription': 'short_description',
  'gameUrl': 'game_url',
  'genre': 'genre',
  'platform': 'platform',
  'publisher': 'publisher',
  'developer': 'developer',
  'freetogameProfileUrl': 'freetogame_profile_url',
  'isFavorite': 'is_favorite',
  'releaseDate': 'release_date',
};

// ignore: unused_element
abstract class _$$GameImplPerFieldToJson {
  // ignore: unused_element
  static Object? id(int instance) => instance;
  // ignore: unused_element
  static Object? title(String instance) => instance;
  // ignore: unused_element
  static Object? thumbnail(String instance) => instance;
  // ignore: unused_element
  static Object? shortDescription(String instance) => instance;
  // ignore: unused_element
  static Object? gameUrl(String instance) => instance;
  // ignore: unused_element
  static Object? genre(String instance) => instance;
  // ignore: unused_element
  static Object? platform(String instance) => instance;
  // ignore: unused_element
  static Object? publisher(String instance) => instance;
  // ignore: unused_element
  static Object? developer(String instance) => instance;
  // ignore: unused_element
  static Object? freetogameProfileUrl(String instance) => instance;
  // ignore: unused_element
  static Object? isFavorite(bool instance) => instance;
  // ignore: unused_element
  static Object? releaseDate(DateTime? instance) => instance?.toIso8601String();
}

Map<String, dynamic> _$$GameImplToJson(_$GameImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'thumbnail': instance.thumbnail,
      'short_description': instance.shortDescription,
      'game_url': instance.gameUrl,
      'genre': instance.genre,
      'platform': instance.platform,
      'publisher': instance.publisher,
      'developer': instance.developer,
      'freetogame_profile_url': instance.freetogameProfileUrl,
      'is_favorite': instance.isFavorite,
      'release_date': instance.releaseDate?.toIso8601String(),
    };
