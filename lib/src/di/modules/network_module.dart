import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../data/network/api_service.dart';
import '../../data/network/interceptors/api_service_header_interceptor.dart';

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(ApiServiceHeaderInterceptor headerInterceptor) {
    final Dio dio = Dio(BaseOptions(
      contentType: 'application/json',
      connectTimeout: 5000,
      sendTimeout: 5000,
    ));
    dio.interceptors.add(headerInterceptor);
    dio.interceptors.add(LogInterceptor(responseBody: true));

    return dio;
  }

  @lazySingleton
  ApiService apiService(Dio dio) => ApiService(dio);
}
