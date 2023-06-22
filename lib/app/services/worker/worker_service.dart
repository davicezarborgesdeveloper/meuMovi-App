import '../../models/worker_model.dart';
import 'worker_service_impl.dart';

abstract class WorkerService {
  Future<void> saveWorker(WorkerModel user);
  Future<void> workerUpdate(WorkerModel user);
  Future<List<WorkerModel>> getAllWorkers();
  Future<void> delete(String id);

  factory WorkerService() {
    return WorkerServiceImpl();
  }
}
