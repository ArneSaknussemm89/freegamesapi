import 'package:flutter_test/flutter_test.dart';

import 'package:freegamesexample/features/games/domain/value_objects/fetch_user_favorites_params.dart';

import '../../../../../utils.dart';

void main() {
  group('FetchUserFavoritesUseCaseParams', () {
    test('same props means identical', () {
      final params1 = FetchUserFavoritesUseCaseParams(TestConstants.testUser.uid);
      final params2 = FetchUserFavoritesUseCaseParams(TestConstants.testUser.uid);
      expect(params1, equals(params2));
    });
  });
}
