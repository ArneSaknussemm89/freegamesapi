import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:equatable/equatable.dart';
import 'package:freegamesexample/core/domain/domain.dart';

part 'favorite.g.dart';

@firestoreSerializable
class FavoriteGame extends Equatable {
  const FavoriteGame({
    required this.gameId,
    required this.ownerId,
    required this.savedOn,
  });

  final int gameId;
  final String ownerId;
  final DateTime savedOn;

  factory FavoriteGame.fromJson(Map<String, dynamic> json) =>
      _$FavoriteGameFromJson(json);
  Map<String, dynamic> toJson() => _$FavoriteGameToJson(this);

  @override
  List<Object?> get props => [gameId, ownerId, savedOn];
}

// coverage:ignore-start
@Collection<FavoriteGame>('favorites')
final favoriteGamesRef = FavoriteGameCollectionReference();
// coverage:ignore-end
