import '../../core/rest_client/custom_dio.dart';
import 'user_service_impl.dart';

abstract class UserService {
  Future<void> delete(String id);

  factory UserService(CustomDio dio) {
    return UserServiceImpl(dio);
  }
}
