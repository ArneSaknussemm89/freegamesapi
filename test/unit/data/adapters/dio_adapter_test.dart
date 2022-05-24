import 'package:dio/dio.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:freegamesexample/data/adapters/dio_adapter.dart';
import 'package:mocktail/mocktail.dart';

import '../../../utils.dart';

void main() {
  group('DioAdapter successes', () {
    late final MockDioClient client;
    late final DioAdapter adapter;
    late final DioAdapterOptions optionsGet;
    late final DioAdapterOptions optionsPut;
    late final DioAdapterOptions optionsDelete;
    late final DioAdapterOptions optionsPost;
    late final DioAdapterOptions optionsPatch;

    setUpAll(() {
      client = MockDioClient();
      adapter = DioAdapter(client: client);
      optionsGet = const DioAdapterOptions(
        path: '/get',
      );
      optionsPut = const DioAdapterOptions(
        path: '/put',
      );
      optionsDelete = const DioAdapterOptions(
        path: '/delete',
      );
      optionsPost = const DioAdapterOptions(
        path: '/post',
      );
      optionsPatch = const DioAdapterOptions(
        path: '/patch',
      );

      when(() => client.get<String>(optionsGet.path)).thenAnswer(
        (_) => Future.value(
          Response(
            requestOptions: RequestOptions(path: optionsGet.path),
            statusCode: 200,
            statusMessage: TestConstants.dioAdapterSuccessMessage,
            data: 'GET',
          ),
        ),
      );
      when(() => client.put<String>(optionsPut.path)).thenAnswer(
        (_) => Future.value(
          Response(
            requestOptions: RequestOptions(path: optionsPut.path),
            statusCode: 200,
            statusMessage: TestConstants.dioAdapterSuccessMessage,
            data: 'PUT',
          ),
        ),
      );
      when(() => client.delete<bool>(optionsDelete.path)).thenAnswer(
        (_) => Future.value(
          Response(
            requestOptions: RequestOptions(path: optionsDelete.path),
            statusCode: 200,
            statusMessage: TestConstants.dioAdapterSuccessMessage,
            data: true,
          ),
        ),
      );
      when(() => client.post<Map<String, dynamic>>(optionsPost.path)).thenAnswer(
        (_) => Future.value(
          Response(
            requestOptions: RequestOptions(path: optionsPost.path),
            statusCode: 200,
            statusMessage: TestConstants.dioAdapterSuccessMessage,
            data: {
              'success': true,
            },
          ),
        ),
      );
      when(() => client.patch<int>(optionsPatch.path)).thenAnswer(
        (_) => Future.value(
          Response(
            requestOptions: RequestOptions(path: optionsPatch.path),
            statusCode: 200,
            statusMessage: TestConstants.dioAdapterSuccessMessage,
            data: 1000,
          ),
        ),
      );
    });

    test('calling get returns proper type', () async {
      final response = await adapter.get<String>(optionsGet);
      response.when(
        success: (data) {
          expect(data, 'GET');
          expect(data, isA<String>());
        },
        failure: (error, trace) {
          fail('adapter response failed');
        },
      );
    });

    test('calling put returns proper type', () async {
      final response = await adapter.put<String>(optionsPut);
      response.when(
        success: (data) {
          expect(data, 'PUT');
          expect(data, isA<String>());
        },
        failure: (error, trace) {
          fail('adapter response failed');
        },
      );
    });

    test('calling delete returns proper type', () async {
      final response = await adapter.delete<bool>(optionsDelete);
      response.when(
        success: (data) {
          expect(data, true);
          expect(data, isA<bool>());
        },
        failure: (error, trace) {
          fail('adapter response failed');
        },
      );
    });

    test('calling post returns proper type', () async {
      final response = await adapter.post<Map<String, dynamic>>(optionsPost);
      response.when(
        success: (data) {
          expect(data, {
            'success': true,
          });
          expect(data, isA<Map<String, dynamic>>());
        },
        failure: (error, trace) {
          fail('adapter response failed');
        },
      );
    });

    test('calling patch returns proper type', () async {
      final response = await adapter.patch<int>(optionsPatch);
      response.when(
        success: (data) {
          expect(data, 1000);
          expect(data, isA<int>());
        },
        failure: (error, trace) {
          fail('adapter response failed');
        },
      );
    });
  });

  group('DioAdapter failures', () {
    late final MockDioClient client;
    late final DioAdapter adapter;
    late final DioAdapterOptions optionsGet;
    late final DioAdapterOptions optionsPut;
    late final DioAdapterOptions optionsDelete;
    late final DioAdapterOptions optionsPost;
    late final DioAdapterOptions optionsPatch;

    setUpAll(() {
      client = MockDioClient();
      adapter = DioAdapter(client: client);
      optionsGet = const DioAdapterOptions(
        path: '/get',
      );
      optionsPut = const DioAdapterOptions(
        path: '/put',
      );
      optionsDelete = const DioAdapterOptions(
        path: '/delete',
      );
      optionsPost = const DioAdapterOptions(
        path: '/post',
      );
      optionsPatch = const DioAdapterOptions(
        path: '/patch',
      );

      when(() => client.get<String>(optionsGet.path)).thenAnswer(
        (_) => Future.value(
          Response(
            requestOptions: RequestOptions(path: optionsGet.path),
            statusCode: 401,
            statusMessage: TestConstants.dioAdapterFailedMessage,
          ),
        ),
      );
      when(() => client.put<String>(optionsPut.path)).thenAnswer(
        (_) => Future.value(
          Response(
            requestOptions: RequestOptions(path: optionsPut.path),
            statusCode: 401,
            statusMessage: TestConstants.dioAdapterFailedMessage,
          ),
        ),
      );
      when(() => client.delete<bool>(optionsDelete.path)).thenAnswer(
        (_) => Future.value(
          Response(
            requestOptions: RequestOptions(path: optionsDelete.path),
            statusCode: 401,
            statusMessage: TestConstants.dioAdapterFailedMessage,
          ),
        ),
      );
      when(() => client.post<Map<String, dynamic>>(optionsPost.path)).thenAnswer(
        (_) => Future.value(
          Response(
            requestOptions: RequestOptions(path: optionsPost.path),
            statusCode: 401,
            statusMessage: TestConstants.dioAdapterFailedMessage,
          ),
        ),
      );
      when(() => client.patch<int>(optionsPatch.path)).thenAnswer(
        (_) => Future.value(
          Response(
            requestOptions: RequestOptions(path: optionsPatch.path),
            statusCode: 401,
            statusMessage: TestConstants.dioAdapterFailedMessage,
          ),
        ),
      );
    });

    test('get with status code > 300 returns failure', () async {
      final response = await adapter.get<String>(optionsGet);
      response.when(
        success: (data) {
          fail('adapter response should have failed');
        },
        failure: (error, trace) {
          expect(error, TestConstants.dioAdapterFailedMessage);
        },
      );
    });

    test('put with status code > 300 returns failure', () async {
      final response = await adapter.put<String>(optionsPut);
      response.when(
        success: (data) {
          fail('adapter response should have failed');
        },
        failure: (error, trace) {
          expect(error, TestConstants.dioAdapterFailedMessage);
        },
      );
    });

    test('delete with status code > 300 returns failure', () async {
      final response = await adapter.delete<bool>(optionsDelete);
      response.when(
        success: (data) {
          fail('adapter response should have failed');
        },
        failure: (error, trace) {
          expect(error, TestConstants.dioAdapterFailedMessage);
        },
      );
    });

    test('post with status code > 300 returns failure', () async {
      final response = await adapter.post<Map<String, dynamic>>(optionsPost);
      response.when(
        success: (data) {
          fail('adapter response should have failed');
        },
        failure: (error, trace) {
          expect(error, TestConstants.dioAdapterFailedMessage);
        },
      );
    });

    test('patch with status code > 300 returns failure', () async {
      final response = await adapter.patch<int>(optionsPatch);
      response.when(
        success: (data) {
          fail('adapter response should have failed');
        },
        failure: (error, trace) {
          expect(error, TestConstants.dioAdapterFailedMessage);
        },
      );
    });
  });
}
