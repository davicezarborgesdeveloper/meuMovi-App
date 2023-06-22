import 'dart:typed_data';

import '../../models/syndicate_model.dart';
import '../../models/user_model.dart';
import 'user_service_impl.dart';

abstract class UserService {
  Future<UserModel?> getUserById(String id);
  Future<String> uploadImage(Uint8List image, String userId);

  Future<void> deleteField(String userId, String field);
  Future<void> deleteDocument(String userId);

  Future<void> saveSyndicate(SyndicateModel user);
  Future<void> syndicateUpdate(SyndicateModel user);

  factory UserService() {
    return UserServiceImpl();
  }
}
