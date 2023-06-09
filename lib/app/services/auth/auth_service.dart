import 'package:firebase_auth/firebase_auth.dart';

import '../../models/auth_model.dart';
import '../../models/user_model.dart';
import 'auth_firebase_service_impl.dart';

abstract class AuthService {
  User? get currentUser;
  Future<AuthModel?> login(String user, String password, bool rememberMe);
  Future<AuthModel?> signup({
    required String email,
    required String password,
    required UserModel user,
  });
  Future<void> logout();
  Future<void> deleteUser();

  factory AuthService() {
    return AuthFirebaseServiceImpl();
  }
}
