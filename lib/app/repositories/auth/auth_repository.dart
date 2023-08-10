import '../../core/rest_client/custom_dio.dart';
import '../../models/auth_model.dart';
import 'auth_repository_impl.dart';

abstract class AuthRepository {
  Future<AuthModel?> login(String email, String password);

  factory AuthRepository(CustomDio dio) {
    return AuthRepositoryImpl(dio);
  }
}
