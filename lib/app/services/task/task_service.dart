import '../../models/dashboard/dashboard_task_model.dart';
import '../../models/task_model.dart';
import 'task_service_impl.dart';

abstract class TaskService {
  Future<void> save(TaskModel model);
  Future<List<TaskModel>> getAllTasks([String? userId, int? status]);
  Future<List<TaskModel>> getTasksbyServiceTaker(String? userId);
  Future<DashboardTaskModel> getTasksDashboardServiceTaker(String? userId);
  Future<DashboardTaskModel> getTasksDashboardSyndicate(String? userId);
  Future<DashboardTaskModel> getTasksDashboardWorker(
    String? synId,
    String orderId,
  );
  Future<void> delete(String id);
  Future<void> sentToSyndicate(String taskCode, String syndicateCode);
  Future<void> returnServiceTaker(String taskCode);
  Future<void> sendWorker(String taskCode);
  Future<void> acceptTask(TaskModel task, String idUser);

  factory TaskService() {
    return TaskServiceImpl();
  }
}
