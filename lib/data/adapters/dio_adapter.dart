import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import 'package:freegamesexample/core/adapters.dart';

final dioAdapterProvider = Provider.autoDispose.family<DioAdapter, BaseOptions>((ref, options) {
  final client = Dio(options);
  return DioAdapter(client: client);
});

class DioAdapterOptions extends AdapterOptions {
  const DioAdapterOptions({
    required String path,
    Map<String, dynamic>? query,
    Map<String, dynamic>? body,
    Map<String, dynamic>? headers,
    this.cancelToken,
  }) : super(
          path: path,
          query: query,
          body: body,
          headers: headers,
        );

  final CancelToken? cancelToken;

  @override
  List<Object?> get props => [...super.props, cancelToken];
}

class DioAdapter extends AsyncAdapter<AdapterResponse, DioAdapterOptions> {
  const DioAdapter({required this.client});

  final Dio client;

  @override
  Future<AdapterResponse<T>> get<T>(DioAdapterOptions options) async {
    final response = await client.get<T>(
      options.path,
      queryParameters: options.query,
      cancelToken: options.cancelToken,
    );
    final statusCode = response.statusCode ?? 500;
    final data = response.data;
    if ((statusCode >= 200 && statusCode < 300) && data != null) {
      return AdapterResponse.success(data);
    } else {
      return AdapterResponse.failure(response.statusMessage, StackTrace.current);
    }
  }

  @override
  Future<AdapterResponse<T>> post<T>(DioAdapterOptions options) async {
    final response = await client.post<T>(
      options.path,
      data: options.body,
      queryParameters: options.query,
      cancelToken: options.cancelToken,
    );
    final statusCode = response.statusCode ?? 500;
    final data = response.data;
    if ((statusCode >= 200 && statusCode < 300) && data != null) {
      return AdapterResponse.success(data);
    } else {
      return AdapterResponse.failure(response.statusMessage, StackTrace.current);
    }
  }

  @override
  Future<AdapterResponse<T>> put<T>(DioAdapterOptions options) async {
    final response = await client.put<T>(
      options.path,
      data: options.body,
      queryParameters: options.query,
      cancelToken: options.cancelToken,
    );
    final statusCode = response.statusCode ?? 500;
    final data = response.data;
    if ((statusCode >= 200 && statusCode < 300) && data != null) {
      return AdapterResponse.success(data);
    } else {
      return AdapterResponse.failure(response.statusMessage, StackTrace.current);
    }
  }

  @override
  Future<AdapterResponse<T>> patch<T>(DioAdapterOptions options) async {
    final response = await client.patch<T>(
      options.path,
      data: options.body,
      queryParameters: options.query,
      cancelToken: options.cancelToken,
    );
    final statusCode = response.statusCode ?? 500;
    final data = response.data;
    if ((statusCode >= 200 && statusCode < 300) && data != null) {
      return AdapterResponse.success(data);
    } else {
      return AdapterResponse.failure(response.statusMessage, StackTrace.current);
    }
  }

  @override
  Future<AdapterResponse<T>> delete<T>(DioAdapterOptions options) async {
    final response = await client.delete<T>(
      options.path,
      queryParameters: options.query,
      cancelToken: options.cancelToken,
    );
    final statusCode = response.statusCode ?? 500;
    final data = response.data;
    if ((statusCode >= 200 && statusCode < 300) && data != null) {
      return AdapterResponse.success(data);
    } else {
      return AdapterResponse.failure(response.statusMessage, StackTrace.current);
    }
  }
}
