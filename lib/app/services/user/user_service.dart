import 'dart:typed_data';

import '../../models/user_model_mod.dart';
import 'user_service_impl.dart';

abstract class UserService {
  Future<UserModelMod?> getUserById(String id);
  Future<void> save(UserModelMod user);
  Future<String> uploadImage(Uint8List image, String userId);
  Future<void> update(UserModelMod user);
  Future<void> deleteField(String userId, String field);

  factory UserService() {
    return UserServiceImpl();
  }
}
