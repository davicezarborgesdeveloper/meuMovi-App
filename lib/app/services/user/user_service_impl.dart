import '../../core/rest_client/custom_dio.dart';
import '../../repositories/user/user_repository.dart';
import 'user_service.dart';

class UserServiceImpl implements UserService {
  final CustomDio _dio;
  UserServiceImpl(this._dio);
  @override
  Future<void> delete(String id) async {
    await UserRepository(_dio).delete(id);
  }
}
