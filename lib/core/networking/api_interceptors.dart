import 'package:dio/dio.dart';
import 'package:fake_currency/core/di/injection.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept-Language'] = 'en';
    options.headers['Authorization'] =
        'Bearer ${injector<SharedPreferences>().getString('token')}';

    super.onRequest(options, handler);
  }
}
