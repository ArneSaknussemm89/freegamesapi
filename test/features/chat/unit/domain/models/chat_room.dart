import 'package:flutter_test/flutter_test.dart';

import 'package:freegamesexample/features/chat/domain/models/chat_room.dart';

void main() {
  group('ChatRoom', () {
    late final DateTime now;

    setUpAll(() {
      now = DateTime.now();
    });

    test('can be instantiated', () {
      final room = ChatRoom(
        id: '1',
        name: 'Test Room',
        gameId: '1',
        createdAt: now,
        updatedAt: now,
        lastMessageAt: now,
      );
      expect(room, isNotNull);
      expect(room.createdAt, now);
    });
  });
}
