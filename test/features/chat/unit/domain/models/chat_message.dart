import 'package:flutter_test/flutter_test.dart';

import 'package:freegamesexample/features/chat/domain/models/chat_message.dart';

void main() {
  group('ChatMessage', () {
    late final DateTime now;

    setUpAll(() {
      now = DateTime.now();
    });

    test('can be instantiated', () {
      final chatMessage = ChatMessage(
        id: '1',
        ownerId: '12',
        roomId: '123',
        message: '1234',
        createdAt: now,
        updatedAt: now,
      );
      expect(chatMessage, isNotNull);
      expect(chatMessage.createdAt, now);
    });
  });
}
