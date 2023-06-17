import '../../models/task_model.dart';
import 'task_service_impl.dart';

abstract class TaskService {
  Future<void> save(TaskModel model);

  factory TaskService() {
    return TaskServiceImpl();
  }
}
