import 'package:dio/dio.dart';

class ApiInterceptor extends Interceptor {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    options.headers['Accept-Language'] = 'en';
    options.headers['Authorization'] =
        'Bearer eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiI4MiIsImVtYWlsIjoic2hhaGQxNjVAZ21haWwuY29tIiwianRpIjoiYzA5Zjc4MjMtN2IzMS00NTAzLTgxZDEtMzVjODU5YTA3MjYxIiwiZXhwIjoxNzQ5OTM2MzQ4LCJpc3MiOiJNYU1hQ2FyZSIsImF1ZCI6Ik1hTWFDYXJlIn0.WsgjrGHKX7yr24dCDN3xupfK7EYIMrFihGsNQuFBsgc';

    super.onRequest(options, handler);
  }
}
