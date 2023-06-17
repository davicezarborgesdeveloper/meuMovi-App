import 'dart:typed_data';

import '../../models/service_taker_model.dart';
import '../../models/syndicate_model.dart';
import '../../models/user_model.dart';
import '../../models/worker_model.dart';
import 'user_service_impl.dart';

abstract class UserService {
  Future<UserModel?> getUserById(String id);
  Future<void> saveWorker(WorkerModel user);
  Future<void> saveServiceTaker(ServiceTakerModel user);
  Future<void> saveSyndicate(SyndicateModel user);
  Future<String> uploadImage(Uint8List image, String userId);
  // Future<void> update(UserModel user);
  Future<void> deleteField(String userId, String field);

  factory UserService() {
    return UserServiceImpl();
  }
}
