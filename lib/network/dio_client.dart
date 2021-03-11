import 'package:dio/dio.dart';
import 'package:flutter_new_starter_pack/utils/alice_service.dart';
import 'package:flutter_new_starter_pack/utils/logging_interceptor.dart';

Dio dioClient() {
  final options = BaseOptions(
    // baseUrl: _baseUrl,
    connectTimeout: 120000,
    receiveTimeout: 120000,
    contentType: 'application/json',
  );

  var dio = Dio(options);
  dio.interceptors.add(LogginInterceptors());
  dio.interceptors.add(alice.getDioInterceptor());

  return dio;
}
