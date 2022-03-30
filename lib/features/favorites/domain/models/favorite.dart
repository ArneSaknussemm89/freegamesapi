import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'favorite.g.dart';

@JsonSerializable()
class FavoriteGame extends Equatable {
  const FavoriteGame({
    required this.gameId,
    required this.savedOn,
  });

  final int gameId;
  final DateTime savedOn;

  factory FavoriteGame.fromJson(Map<String, dynamic> json) => _$FavoriteGameFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteGameToJson(this);

  @override
  List<Object?> get props => [gameId, savedOn];
}
