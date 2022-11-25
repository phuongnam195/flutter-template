import 'package:dio/dio.dart';
import 'package:flutter_template/data/local/shared_preference_helper.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

abstract class NetworkModule {
  static Dio provideDio(SharedPreferenceHelper sharedPrefHelper) {
    final dio = Dio();

    dio
      ..options.connectTimeout = 30000
      ..options.receiveTimeout = 15000
      ..options.headers = _headers
      ..interceptors.add(_dioLogger)
      ..interceptors.add(
        InterceptorsWrapper(
          onRequest: (options, handler) async {
            final accessToken = '';
            if (accessToken == null) {
              print('NetworkModule -> provideDio(): Auth token is null');
            } else {
              options.headers
                  .putIfAbsent('accessToken', () => 'Bearer $accessToken');
            }

            return handler.next(options);
          },
        ),
      );

    return dio;
  }

  static Dio provideAuthDio(SharedPreferenceHelper sharedPrefHelper) {
    final authDio = Dio();

    authDio
      ..options.connectTimeout = 30000
      ..options.receiveTimeout = 15000
      ..options.headers = _headers
      ..interceptors.add(_dioLogger);

    return authDio;
  }

  static final _headers = {'Content-Type': 'application/json; charset=utf-8'};

  static final _dioLogger = PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
      responseBody: true,
      responseHeader: false,
      error: true,
      compact: true,
      maxWidth: 120);
}
