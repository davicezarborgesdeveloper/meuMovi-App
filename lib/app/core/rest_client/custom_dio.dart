import 'package:dio/dio.dart';
import 'package:dio/io.dart';

import '../env.dart';
import 'interceptor/auth_interceptor.dart';

class CustomDio extends DioForNative {
  late AuthInterceptor _authInterceptor;
  CustomDio()
      : super(
          BaseOptions(
            baseUrl: 'https://meumovi.fgsistem.com.br/movi/',
            connectTimeout: const Duration(seconds: 5),
            receiveTimeout: const Duration(seconds: 60),
          ),
        ) {
    interceptors.add(
      LogInterceptor(
        requestBody: true,
        responseBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
    _authInterceptor = AuthInterceptor();
  }

  CustomDio auth() {
    if (!interceptors.contains(_authInterceptor)) {
      interceptors.add(_authInterceptor);
    }
    return this;
  }

  CustomDio unauth() {
    interceptors.remove(_authInterceptor);
    return this;
  }
}
