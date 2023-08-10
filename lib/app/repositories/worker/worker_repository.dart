import '../../core/rest_client/custom_dio.dart';
import '../../models/worker_model.dart';
import 'worker_repository_impl.dart';

abstract class WorkerRepository {
  Future<void> save(WorkerModel worker);
  Future<WorkerModel?> getByToken(String token);
  Future<List<WorkerModel>> getWorkersBySyndicate([String? userId]);
  Future<void> update(WorkerModel worker, String updateType);
  Future<void> deleteBankData(String userId);
  Future<void> delete(String userId);

  factory WorkerRepository(CustomDio dio) {
    return WorkerRepositoryImpl(dio);
  }
}
