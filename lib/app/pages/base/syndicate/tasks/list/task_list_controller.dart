import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../../../models/task_model.dart';
import '../../../../../services/task/task_service.dart';
part 'task_list_controller.g.dart';

enum TaskListStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
  deleted,
}

class TaskListController = TaskListControllerBase with _$TaskListController;

abstract class TaskListControllerBase with Store {
  @readonly
  var _status = TaskListStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  var _tasks = <TaskModel>[];

  Future<void> findTask() async {
    try {
      _status = TaskListStateStatus.loading;
      _tasks = await TaskService().getAllTasks();
      _status = TaskListStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar listar tarefas', error: e, stackTrace: s);
      _status = TaskListStateStatus.error;
      _errorMessage = 'Erro ao buscar listar tarefas';
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      _status = TaskListStateStatus.loading;
      await TaskService().delete(id);
      _status = TaskListStateStatus.deleted;
    } catch (e, s) {
      log('Erro ao apagar tarefa', error: e, stackTrace: s);
      _status = TaskListStateStatus.error;
      _errorMessage = 'Erro ao apagar tarefa';
    }
  }
}
