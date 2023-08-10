import 'package:get_it/get_it.dart';
import 'package:jwt_decoder/jwt_decoder.dart';

import '../../repositories/auth/auth_repository.dart';
import '../../controllers/http_controller.dart';
import '../../core/global/constants.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../core/storage/storage.dart';
import 'login_service.dart';

class LoginServiceImpl implements LoginService {
  @override
  Future<Map<String, dynamic>> execute(
    String user,
    String password,
    bool rememberMe,
  ) async {
    final CustomDio dio = GetIt.I<HttpController>().customDio!;
    user = user.replaceAll(RegExp(r'[^0-9]'), '');
    final authModel = await AuthRepository(dio).login(user, password);
    await Storage()
        .setData(SessionStorageKeys.accessToken.key, authModel!.accessToken);
    await Storage()
        .setData(SessionStorageKeys.keepLogged.key, '${rememberMe ? 1 : 0}');
    return JwtDecoder.decode(authModel.accessToken);
  }
}
