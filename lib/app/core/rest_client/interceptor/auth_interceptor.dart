import 'package:dio/dio.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../global/constants.dart';
import '../../storage/storage.dart';

class AuthInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final sp = await SharedPreferences.getInstance();
    final accessToken =
        await Storage().getData(SharedStoreKeys.accessToken.key);
    options.headers['x-access-token'] = '$accessToken';

    handler.next(options);
  }

  // @override
  // void onError(DioError err, ErrorInterceptorHandler handler) async {
  //   if (err.response?.statusCode == 401) {
  //     GlobalContext.i.loginExpire();
  //   } else {
  //     handler.next(err);
  //   }
  // }
}
