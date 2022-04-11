// ignore_for_file: invalid_annotation_target

import 'package:freezed_annotation/freezed_annotation.dart';

part 'game.freezed.dart';
part 'game.g.dart';

@freezed
class Game with _$Game {
  @JsonSerializable(fieldRename: FieldRename.snake)
  const factory Game(
    int id,
    String title,
    String thumbnail,
    String shortDescription,
    String gameUrl,
    String genre,
    String platform,
    String publisher,
    String developer,
    DateTime releaseDate,
    String freetogameProfileUrl,
  ) = _Game;

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}
