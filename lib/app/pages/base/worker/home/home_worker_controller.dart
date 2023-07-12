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
  DashboardTaskModell? _tasks = DashboardTaskModell(
    available: DashboardList(list: <TaskModel>[]),
    confirmed: DashboardList(list: <TaskModel>[]),
    inProgress: DashboardList(list: <TaskModel>[]),
    finished: DashboardList(list: <TaskModel>[]),
  );

  @readonly
  String? _employeerCode;

  @readonly
  DashboardList? _selectedDashboard =
      DashboardList(list: <TaskModel>[], amountValue: 0.0);

  @action
  void setButtonSelected(int value) => buttonSelected = value;

  Future<void> getTasks(String? synId, String orderId) async {
    try {
      _status = HomeWorkerStateStatus.loading;
      _tasks = await TaskService().getTasksDashboardWorker(synId, orderId);
      await setDashboardList();
      _status = HomeWorkerStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar listar tarefas', error: e, stackTrace: s);
      _status = HomeWorkerStateStatus.error;
      _errorMessage = 'Erro ao buscar listar tarefas';
    }
  }

  Future<void> setDashboardList() async {
    switch (buttonSelected) {
      case 0:
        _selectedDashboard = _tasks!.available;
        break;
      case 1:
        _selectedDashboard = _tasks!.confirmed;
        break;
      case 2:
        _selectedDashboard = _tasks!.inProgress;
        break;
      case 3:
        _selectedDashboard = _tasks!.finished;
        break;
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
