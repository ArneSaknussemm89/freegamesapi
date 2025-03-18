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
    @Default('') String gameUrl,
    @Default('') String genre,
    @Default('') String platform,
    @Default('') String publisher,
    @Default('') String developer,
    @Default('') String freetogameProfileUrl,
    @Default(false) bool isFavorite,
    @Default(null) DateTime? releaseDate,
  }) = _Game;

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
}
