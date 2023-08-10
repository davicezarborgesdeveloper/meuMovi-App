import '../../core/rest_client/custom_dio.dart';
import 'user_repository_impl.dart';

abstract class UserRepository {
  Future<void> delete(String id);

  factory UserRepository(CustomDio dio) {
    return UserRepositoryImpl(dio);
  }
}
