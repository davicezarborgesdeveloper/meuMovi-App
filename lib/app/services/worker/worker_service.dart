import '../../core/rest_client/custom_dio.dart';
import '../../models/worker_model.dart';
import 'worker_service_impl.dart';

abstract class WorkerService {
  Future<void> save(WorkerModel worker);
  Future<WorkerModel?> getByToken(String token);
  Future<List<WorkerModel>> getWorkersBySyndicate([String? userId]);
  Future<void> update(WorkerModel worker, String updateType);
  Future<void> deleteBankData(String userId);
  Future<void> delete(String userId);

  factory WorkerService(CustomDio dio) {
    return WorkerServiceImpl(dio);
  }
}
