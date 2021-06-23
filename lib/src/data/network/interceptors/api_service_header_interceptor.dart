import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';

@injectable
class ApiServiceHeaderInterceptor extends Interceptor {

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers.addAll(<String, String>{
      'User-Agent':
          'Mozilla/5.0 (X11; Linux x86_64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/91.0.4472.114 Safari/537.36',
      'x-source': 'adjaranet',
      'origin': 'https://api.adjaranet.com',
      'referer': 'https://api.adjaranet.com'
    });
    super.onRequest(options, handler);
  }
}
