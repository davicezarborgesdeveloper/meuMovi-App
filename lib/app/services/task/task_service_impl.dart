// ignore_for_file: public_member_api_docs, sort_constructors_first
import '../../core/rest_client/custom_dio.dart';
import '../../models/dashboard_task_model.dart';
import '../../models/task_model.dart';
import '../../repositories/task/task_repository.dart';
import 'task_service.dart';

class TaskServiceImpl implements TaskService {
  final CustomDio _dio;
  TaskServiceImpl(this._dio);

  @override
  Future<DashboardTaskModel?> getTasksServiceTaker(String? serviceTakerId) {
    return TaskRepository(_dio).getTasksServiceTaker(serviceTakerId);
  }

  @override
  Future<DashboardTaskModel?> getTasksWorker(String? serviceTakerId) {
    return TaskRepository(_dio).getTasksWorker(serviceTakerId);
  }

  @override
  Future<DashboardTaskModel?> getTasksSyndicate(String? serviceTakerId) {
    return TaskRepository(_dio).getTasksSyndicate(serviceTakerId);
  }

  @override
  Future<void> sendToSyndicate(String taskCode) async {
    await TaskRepository(_dio).sendToSyndicate(taskCode);
  }

  @override
  Future<void> sendToWorker(String taskCode) async {
    await TaskRepository(_dio).sendToWorker(taskCode);
  }

  @override
  Future<void> delete(String taskCode) async {
    await TaskRepository(_dio).delete(taskCode);
  }

  @override
  Future<void> save(TaskModel model) async {
    await TaskRepository(_dio).save(model);
  }

  @override
  Future<void> update(TaskModel model) async {
    await TaskRepository(_dio).update(model);
  }
}
