import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../../models/dashboard/dashboard_task_model.dart';
import '../../../../models/task_model.dart';
import '../../../../services/task/task_service.dart';
part 'home_worker_controller.g.dart';

enum HomeWorkerStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class HomeWorkerController = HomeWorkerControllerBase
    with _$HomeWorkerController;

abstract class HomeWorkerControllerBase with Store {
  @readonly
  var _status = HomeWorkerStateStatus.initial;

  @readonly
  String? _errorMessage;

  @observable
  int buttonSelected = 0;

  @readonly
  DashboardTaskModel? _tasks = DashboardTaskModel(
    available: <TaskModel>[],
    confirmed: <TaskModel>[],
    inProgress: <TaskModel>[],
    finished: <TaskModel>[],
  );

  @readonly
  String? _employeerCode;

  @action
  void setButtonSelected(int value) => buttonSelected = value;

  Future<void> getTasks(String? synId, String orderId) async {
    try {
      _status = HomeWorkerStateStatus.loading;
      _tasks = await TaskService().getTasksDashboardWorker(synId, orderId);
      _status = HomeWorkerStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar listar tarefas', error: e, stackTrace: s);
      _status = HomeWorkerStateStatus.error;
      _errorMessage = 'Erro ao buscar listar tarefas';
    }
  }

  Future<void> acceptTask(TaskModel task, String idUser) async {
    try {
      _status = HomeWorkerStateStatus.loading;
      await TaskService().acceptTask(task, idUser);
      _status = HomeWorkerStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao aceitar a tarefa', error: e, stackTrace: s);
      _status = HomeWorkerStateStatus.error;
      _errorMessage = 'Erro ao aceitar a tarefa';
    }
  }
}
