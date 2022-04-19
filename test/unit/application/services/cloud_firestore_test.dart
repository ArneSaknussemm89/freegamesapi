import 'package:fake_cloud_firestore/fake_cloud_firestore.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import 'package:freegamesexample/application/services/cloud_firestore.dart';

import '../../../utils.dart';

void main() {
  group('Cloud Firestore service class', () {
    late FakeFirebaseFirestore firestore;

    setUp(() {
      firestore = FakeFirebaseFirestore();
    });

    test('can be instantiated', () {
      final service = AppFirestoreService(firestore: firestore);
      expect(service, isNotNull);
    });

    test('can read provider', () {
      final root = createContainer();
      final container = createContainer(
        parent: root,
        overrides: [
          cloudFirestoreProvider.overrideWithProvider(Provider.autoDispose((ref) => firestore)),
        ],
      );

      final service = container.read(appFirestoreServiceProvider);
      expect(service, isNotNull);
    });
  });
}
