import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

import '../services/authorization_service.dart';

@injectable
class AuthorizationInterceptor extends Interceptor {
  AuthorizationInterceptor(this._authorizationService);

  final AuthorizationService _authorizationService;

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final bool isAuthorized = await _authorizationService.isAuthorized(useCache: true);
    if (isAuthorized) {
      handler.next(options);
    } else {
      handler.reject(DioError(requestOptions: options));
    }
  }
}
