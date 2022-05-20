import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_room.freezed.dart';
part 'chat_room.g.dart';

/// A "chat room" is a room created by a user related to a game.
/// Allows people to put messages in the room.
///
/// Very, very basic implementation.

@freezed
class ChatRoom with _$ChatRoom {
  const factory ChatRoom({
    required String id,
    required String name,
    required String gameId,
    required DateTime createdAt,
    required DateTime updatedAt,
    required DateTime lastMessageAt,
  }) = _ChatRoom;

  factory ChatRoom.fromJson(Map<String, dynamic> json) => _$ChatRoomFromJson(json);
}
