import '../../core/rest_client/custom_dio.dart';
import '../../models/worker_model.dart';
import '../../repositories/worker/worker_repository.dart';
import 'worker_service.dart';

class WorkerServiceImpl implements WorkerService {
  final CustomDio _dio;
  WorkerServiceImpl(this._dio);
  @override
  Future<void> save(WorkerModel worker) async {
    await WorkerRepository(_dio).save(worker);
  }

  @override
  Future<WorkerModel?> getByToken(String token) {
    return WorkerRepository(_dio).getByToken(token);
  }

  @override
  Future<List<WorkerModel>> getWorkersBySyndicate([String? userId]) async {
    return WorkerRepository(_dio).getWorkersBySyndicate(userId);
  }

  @override
  Future<void> update(WorkerModel worker, String updateType) async {
    await WorkerRepository(_dio).update(worker, updateType);
  }

  @override
  Future<void> deleteBankData(String userId) async {
    await WorkerRepository(_dio).deleteBankData(userId);
  }

  @override
  Future<void> delete(String userId) async {
    await WorkerRepository(_dio).delete(userId);
  }
}
