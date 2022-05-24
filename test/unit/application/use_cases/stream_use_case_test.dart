@Tags(['use_case', 'stream'])

import 'package:flutter_test/flutter_test.dart';

import '../../../utils.dart';

void main() {
  group('StreamUseCase', () {
    late final MockStreamUseCase useCase;
    late final MockStreamUseCaseWithParams useCaseWithParams;
    late final List<String> params;

    setUpAll(() {
      useCase = const MockStreamUseCase();
      useCaseWithParams = const MockStreamUseCaseWithParams();
      params = [
        'GET',
        'PUT',
      ];
    });

    test('can be instantiated', () {
      expect(useCase, isNotNull);
    });

    test('const constructor means same instance', () {
      const useCase1 = MockStreamUseCase();
      expect(useCase1, useCase);
    });

    test('can be instantiated with params', () {
      expect(useCaseWithParams, isNotNull);
    });

    test('can execute', () {
      final result = useCase.execute();
      result.when(
        failure: (error, trace) {
          fail('should not have failed');
        },
        success: (stream) {
          expect(stream, emitsInOrder(TestConstants.elements));
        },
      );
    });

    test('can execute with params', () {
      final result = useCaseWithParams.execute(params);
      result.when(
        failure: (error, trace) {
          fail('should not have failed');
        },
        success: (stream) {
          expect(stream, emitsInOrder(TestConstants.elements + params));
        },
      );
    });
  });
}
