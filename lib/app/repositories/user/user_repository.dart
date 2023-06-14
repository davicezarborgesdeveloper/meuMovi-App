import '../../core/rest_client/custom_dio.dart';
import '../../models/new/user_model.dart';
import 'user_repository_impl.dart';

abstract class UserRepository {
  Future<UserModel?> getUserById(String id);

  factory UserRepository(CustomDio dio) {
    return UserRepositoryImpl(dio: dio);
  }
}
