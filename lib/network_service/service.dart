import 'package:dio/dio.dart' show BaseOptions, Dio, LogInterceptor;
import 'package:flutter/foundation.dart';

/// 网络请求
abstract class Service {
  /// 进行网络请求
  Dio _dio;

  BaseOptions options = BaseOptions();

  /// 网络请求
  Service({Dio? dio}) : this._dio = dio ?? Dio() {
    if (kDebugMode) {
      _dio.interceptors.add(LogInterceptor());
    }
  }
}
