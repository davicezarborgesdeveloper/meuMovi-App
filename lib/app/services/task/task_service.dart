import '../../models/dashboard/dashboard_task_model.dart';
import '../../models/task_model.dart';
import 'task_service_impl.dart';

abstract class TaskService {
  Future<void> save(TaskModel model);
  Future<List<TaskModel>> getAllTasks([String? userId, int? status]);
  Future<List<TaskModel>> getTasksbyServiceTaker(String? userId);
  Future<DashboardTaskModel> getTasksDashboard(String? userId);
  Future<void> delete(String id);
  Future<void> sentToSyndicate(String taskCode, String syndicateCode);

  factory TaskService() {
    return TaskServiceImpl();
  }
}
