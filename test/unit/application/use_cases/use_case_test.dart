@Tags(['use_case'])

import 'package:flutter_test/flutter_test.dart';

import '../../../utils.dart';

void main() {
  group('UseCase class', () {
    test('can be instantiated', () {
      const useCase = MockUseCase();
      expect(useCase, isNotNull);
    });

    test('use case directly returns value', () {
      const useCase = MockUseCase();
      final result = useCase.execute();
      result.when(
        failure: (error, trace) {
          fail('should not have failed');
        },
        success: (data) {
          expect(data, TestConstants.kMockUseCaseResult);
        },
      );
    });
  });
}
