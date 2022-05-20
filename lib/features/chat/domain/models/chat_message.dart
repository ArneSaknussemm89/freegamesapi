import 'package:freezed_annotation/freezed_annotation.dart';

part 'chat_message.freezed.dart';
part 'chat_message.g.dart';

// A chat message is simply a message created by a user for "chat".

@freezed
class ChatMessage with _$ChatMessage {
  const factory ChatMessage({
    required String id,
    required String ownerId,
    required String roomId,
    required String message,
    required DateTime createdAt,
    required DateTime updatedAt,
    @Default(false) bool edited,
  }) = _ChatMessage;

  factory ChatMessage.fromJson(Map<String, dynamic> json) => _$ChatMessageFromJson(json);
}
