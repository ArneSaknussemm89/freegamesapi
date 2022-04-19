import 'package:flutter_test/flutter_test.dart';

import 'package:freegamesexample/domain/models/app_user.dart';

const kTestAppUserId = 'test_user_id';
const kTestAppUserName = 'test_user_name';

// This test group will ensure that the App User object can be instantiated and
// that it can be created from a json-type Map object.
void main() {
  group('AppUser model', () {
    late Map<String, dynamic> userJson;

    setUp(() {
      userJson = {
        'uid': kTestAppUserId,
        'displayName': kTestAppUserName,
      };
    });

    test('can be instantiated', () {
      const user = AppUser(uid: kTestAppUserId, displayName: kTestAppUserName);
      expect(user, isNotNull);
    });

    test('equal props means identical', () {
      const user1 = AppUser(uid: kTestAppUserId, displayName: kTestAppUserName);
      const user2 = AppUser(uid: kTestAppUserId, displayName: kTestAppUserName);

      expect(user1.props, equals(user2.props));
    });

    test('can be created from a json-type Map object', () {
      final user = AppUser.fromJson(userJson);

      expect(user, isNotNull);
      expect(user.uid, userJson['uid']);
      expect(user.displayName, userJson['displayName']);
    });

    test('can be serialized to json', () {
      final user = AppUser.fromJson(userJson);
      final serialized = user.toJson();

      expect(serialized['uid'], userJson['uid']);
      expect(serialized['displayName'], userJson['displayName']);
    });
  });
}
