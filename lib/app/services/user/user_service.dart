import 'dart:typed_data';

import '../../models/user_model.dart';
import 'user_service_impl.dart';

abstract class UserService {
  Future<UserModel?> getUserById(String id);
  Future<String> uploadImage(Uint8List image, String userId);

  Future<void> deleteField(String userId, String field);
  Future<void> deleteDocument(String userId);

  factory UserService() {
    return UserServiceImpl();
  }
}
