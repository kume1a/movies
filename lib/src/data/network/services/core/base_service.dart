import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
import 'package:meta/meta.dart';

import '../../../model/core/either.dart';
import '../../../model/core/fetch_failure.dart';

abstract class BaseService {
  @protected
  Future<Either<F, T>> safeCall<F, T>({
    required Future<T> Function() call,
    required F Function() onNetworkError,
    required F Function(Object? e) onUnknownError,
    F Function(Response<dynamic>? response)? onResponseError,
  }) async {
    try {
      final T result = await call();
      return right(result);
    } on DioError catch (e) {
      log('BaseService.safeCall: ', error: e);
      try {
        switch (e.type) {
          case DioErrorType.connectionTimeout:
          case DioErrorType.sendTimeout:
          case DioErrorType.receiveTimeout:
          case DioErrorType.connectionError:
          case DioErrorType.cancel:
            return left(onNetworkError());
          case DioErrorType.badResponse:
            return left(onResponseError != null ? onResponseError(e.response) : onUnknownError(e));
          default:
            if (e.error is SocketException) {
              return left(onNetworkError());
            }
            return left(onUnknownError(e));
        }
      } catch (err) {
        log('BaseService.safeCall: ', error: e);
        return left(onUnknownError(e));
      }
    } catch (e) {
      log('BaseService.safeCall: ', error: e);
      return left(onUnknownError(e));
    }
  }

  @protected
  Future<Either<FetchFailure, T>> safeFetch<T>(
    Future<T> Function() call,
  ) async {
    return safeCall(
      call: call,
      onNetworkError: () => const FetchFailure.networkError(),
      onResponseError: (Response<dynamic>? response) {
        if (response != null && response.statusCode != null) {
          final int statusCode = response.statusCode!;
          if (statusCode >= 500 && statusCode < 600) {
            return const FetchFailure.serverError();
          }
        }
        return const FetchFailure.unknownError();
      },
      onUnknownError: (Object? e) => const FetchFailure.unknownError(),
    );
  }
}
