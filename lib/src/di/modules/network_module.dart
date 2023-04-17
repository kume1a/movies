import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../../../main.dart';
import '../../data/network/api_service.dart';
import '../../data/network/interceptors/api_service_header_interceptor.dart';
import '../../data/network/interceptors/authorization_interceptor.dart';
import '../../data/network/interceptors/log.dart';

const Duration _kTimeoutDuration = Duration(seconds: 15);

@module
abstract class NetworkModule {
  @lazySingleton
  Dio dio(
    ApiServiceHeaderInterceptor headerInterceptor,
    AuthorizationInterceptor authorizationInterceptor,
  ) {
    final Dio dio = Dio(
      BaseOptions(
        contentType: 'application/json',
        connectTimeout: _kTimeoutDuration,
        sendTimeout: _kTimeoutDuration,
        receiveTimeout: _kTimeoutDuration,
      ),
    );
    dio.interceptors.add(authorizationInterceptor);
    dio.interceptors.add(headerInterceptor);
    dio.interceptors.add(PrettyLogInterceptor(logPrint: logger.d));

    return dio;
  }

  @lazySingleton
  ApiService apiService(Dio dio) => ApiService(dio);

  @lazySingleton
  FirebaseFirestore get firestore => FirebaseFirestore.instance;
}
