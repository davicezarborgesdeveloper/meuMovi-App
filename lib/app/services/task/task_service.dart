import '../../models/task_model.dart';
import 'task_service_impl.dart';

abstract class TaskService {
  Future<void> save(TaskModel model);
  Future<List<TaskModel>> getAllTasks();
  Future<void> delete(String id);

  factory TaskService() {
    return TaskServiceImpl();
  }
}
