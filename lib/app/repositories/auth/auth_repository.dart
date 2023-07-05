import '../../core/rest_client/custom_dio.dart';
import '../../models/auth_model.dart';
import '../../models/new/service_taker_model.dart';
import '../../models/new/syndicate_model.dart';
import '../../models/new/worker_model.dart';
import 'auth_repository_impl.dart';

abstract class AuthRepository {
  Future<AuthModel?> registerWorker(WorkerModel user);
  Future<AuthModel?> registerServiceTaker(ServiceTakerModel user);
  Future<AuthModel?> registerSyndicate(SyndicateModel user);
  Future<AuthModel?> login(String user, String password);

  factory AuthRepository(CustomDio dio) {
    return AuthRepositoryImpl(dio: dio);
  }

  //   Future<AuthModel?> signup({
//     required String email,
//     required String password,
//     required UserModelMod user,
//   });
}
