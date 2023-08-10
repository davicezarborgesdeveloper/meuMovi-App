import 'login_service_impl.dart';

abstract class LoginService {
  Future<Map<String, dynamic>> execute(
    String user,
    String password,
    bool rememberMe,
  );

  factory LoginService() {
    return LoginServiceImpl();
  }
}
