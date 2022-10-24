import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../../../../utils.dart';

void main() {
  group('Favorite Games List Provider', () {
    late final ProviderContainer root;
    setUp(() {
      root = createContainer();
    });

    test('can be read', () {
      final container = createContainer(parent: root);
    });
  });
}
