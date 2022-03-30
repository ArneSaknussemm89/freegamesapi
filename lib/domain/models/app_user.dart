import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cloud_firestore_odm/cloud_firestore_odm.dart';
import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

import 'package:freegamesexample/features/favorites/domain/models/favorite.dart';

part 'app_user.g.dart';

@JsonSerializable()
class AppUser extends Equatable {
  const AppUser({
    required this.uid,
    required this.displayName,
  });

  final String uid;
  final String displayName;

  factory AppUser.fromJson(Map<String, dynamic> json) => _$AppUserFromJson(json);
  Map<String, dynamic> toJson() => _$AppUserToJson(this);

  @override
  List<Object?> get props => [uid, displayName];
}


@Collection<AppUser>('users')
@Collection<FavoriteGame>('users/*/favorites')
final appUsersRef = AppUserCollectionReference();
