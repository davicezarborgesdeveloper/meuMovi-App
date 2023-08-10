import '../../core/rest_client/custom_dio.dart';
import '../../models/dashboard_task_model.dart';
import '../../models/task_model.dart';
import 'task_repository_impl.dart';

abstract class TaskRepository {
  Future<DashboardTaskModel?> getTasksServiceTaker(String? serviceTakerId);
  Future<DashboardTaskModel?> getTasksSyndicate(String? serviceTakerId);
  Future<DashboardTaskModel?> getTasksWorker(String? serviceTakerId);
  Future<void> sendToSyndicate(String taskCode);
  Future<void> sendToWorker(String taskCode);
  Future<void> delete(String taskCode);
  Future<void> save(TaskModel model);
  Future<void> update(TaskModel model);

  factory TaskRepository(CustomDio dio) {
    return TaskRepositoryImpl(dio);
  }
}
