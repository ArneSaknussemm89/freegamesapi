// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'favorite.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

FavoriteGame _$FavoriteGameFromJson(Map<String, dynamic> json) => FavoriteGame(
      gameId: json['gameId'] as int,
      savedOn: DateTime.parse(json['savedOn'] as String),
    );

Map<String, dynamic> _$FavoriteGameToJson(FavoriteGame instance) =>
    <String, dynamic>{
      'gameId': instance.gameId,
      'savedOn': instance.savedOn.toIso8601String(),
    };
