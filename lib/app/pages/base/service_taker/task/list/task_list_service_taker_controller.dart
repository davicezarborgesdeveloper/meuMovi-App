import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../../../models/task_model.dart';
import '../../../../../services/task/task_service.dart';

part 'task_list_service_taker_controller.g.dart';

enum TaskListServiceTakerStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
  deleted,
}

class TaskListServiceTakerController = TaskListServiceTakerControllerBase
    with _$TaskListServiceTakerController;

abstract class TaskListServiceTakerControllerBase with Store {
  @readonly
  var _status = TaskListServiceTakerStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  var _tasks = <TaskModel>[];

  Future<void> findTask(String? userId) async {
    try {
      _status = TaskListServiceTakerStateStatus.loading;
      _tasks = await TaskService().getTasksbyServiceTaker(userId);
      _status = TaskListServiceTakerStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar listar tarefas', error: e, stackTrace: s);
      _status = TaskListServiceTakerStateStatus.error;
      _errorMessage = 'Erro ao buscar listar tarefas';
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      _status = TaskListServiceTakerStateStatus.loading;
      await TaskService().delete(id);
      _status = TaskListServiceTakerStateStatus.deleted;
    } catch (e, s) {
      log('Erro ao apagar tarefa', error: e, stackTrace: s);
      _status = TaskListServiceTakerStateStatus.error;
      _errorMessage = 'Erro ao apagar tarefa';
    }
  }

  Future<void> sentSyndicate(String taskCode, String syndicateCode) async {
    try {
      _status = TaskListServiceTakerStateStatus.loading;
      await TaskService().sentToSyndicate(taskCode, syndicateCode);
      _status = TaskListServiceTakerStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar listar tarefas', error: e, stackTrace: s);
      _status = TaskListServiceTakerStateStatus.error;
      _errorMessage = 'Erro ao buscar listar tarefas';
    }
  }
}
