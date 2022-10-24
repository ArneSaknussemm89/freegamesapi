// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'game.freezed.dart';
part 'game.g.dart';

@freezed
class Game with _$Game {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Game({
    required int id,
    required String title,
    required String thumbnail,
    required String shortDescription,
    required DateTime releaseDate,
    @Default('') String gameUrl,
    @Default('') String genre,
    @Default('') String platform,
    @Default('') String publisher,
    @Default('') String developer,
    @Default('') String freetogameProfileUrl,
    @Default(false) bool isFavorite,
  }) = _Game;

  factory Game.notFound([
    @Default(0) int id,
    @Default('') String title,
    @Default('') String thumbnail,
    @Default('') String shortDescription,
    @Default('') String gameUrl,
    @Default('') String genre,
    @Default('') String platform,
    @Default('') String publisher,
    @Default('') String developer,
    @Default('') String freetogameProfileUrl,
    @Default(false) bool isFavorite,
    @Default(DateTime.now) DateTime releaseDate,
  ]) = _GameNotFound;

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}
