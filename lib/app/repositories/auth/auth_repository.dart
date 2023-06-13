import '../../core/rest_client/custom_dio.dart';
import '../../models/new/service_taker_model.dart';
import '../../models/new/syndicate_model.dart';
import '../../models/new/user_model.dart';
import '../../models/new/worker_model.dart';
import 'auth_repository_impl.dart';

abstract class AuthRepository {
  Future<UserModel?> registerWorker(WorkerModel user);
  Future<UserModel?> registerServiceTaker(ServiceTakerModel user);
  Future<UserModel?> registerSyndicate(SyndicateModel user);
  Future<void> login(String user, String password);

  factory AuthRepository(CustomDio dio) {
    return AuthRepositoryImpl(dio: dio);
  }
}
