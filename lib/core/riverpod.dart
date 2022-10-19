import 'package:dio/dio.dart';
import 'package:riverpod/riverpod.dart';

extension CancelTokenX on Ref {
  CancelToken cancelToken() {
    final cancelToken = CancelToken();
    onDispose(cancelToken.cancel);
    return cancelToken;
  }
}
