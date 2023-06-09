import 'dart:typed_data';

import '../../models/user_model.dart';
import 'user_service_impl.dart';

abstract class UserService {
  Future<UserModel?> getUserById(String id);
  Future<void> save(UserModel user);
  Future<String> uploadImage(Uint8List image, String userId);
  Future<void> update(UserModel user);
  Future<void> deleteField(String userId, String field);

  factory UserService() {
    return UserServiceImpl();
  }
}
