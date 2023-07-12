import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../../../models/dashboard/dashboard_task_model.dart';
import '../../../../../models/task_model.dart';
import '../../../../../services/task/task_service.dart';
part 'task_dashboard_controller.g.dart';

enum TaskDashboardStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class TaskDashboardController = TaskDashboardControllerBase
    with _$TaskDashboardController;

abstract class TaskDashboardControllerBase with Store {
  @readonly
  var _status = TaskDashboardStateStatus.initial;

  @readonly
  String? _errorMessage;

  @observable
  int buttonSelected = 0;

  @readonly
  DashboardTaskModell? _tasks = DashboardTaskModell(
    inAnalysis: DashboardList(list: <TaskModel>[]),
    opened: DashboardList(list: <TaskModel>[]),
    waitStart: DashboardList(list: <TaskModel>[]),
    inProgress: DashboardList(list: <TaskModel>[]),
    finished: DashboardList(list: <TaskModel>[]),
  );

  @readonly
  DashboardList? _selectedDashboard =
      DashboardList(list: <TaskModel>[], amountValue: 0.0);

  @action
  void setButtonSelected(int value) => buttonSelected = value;

  Future<void> getTasks(String? id) async {
    try {
      _status = TaskDashboardStateStatus.loading;
      _tasks = await TaskService().getTasksDashboardSyndicate(id);
      await setDashboardList();
      _status = TaskDashboardStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar listar tarefas', error: e, stackTrace: s);
      _status = TaskDashboardStateStatus.error;
      _errorMessage = 'Erro ao buscar listar tarefas';
    }
  }

  Future<void> setDashboardList() async {
    switch (buttonSelected) {
      case 0:
        _selectedDashboard = _tasks!.inAnalysis;
        break;
      case 1:
        _selectedDashboard = _tasks!.opened;
        break;
      case 2:
        _selectedDashboard = _tasks!.waitStart;
        break;
      case 3:
        _selectedDashboard = _tasks!.inProgress;
        break;
      case 4:
        _selectedDashboard = _tasks!.finished;
        break;
    }
  }

  Future<void> returnServiceTaker(String taskCode) async {
    try {
      _status = TaskDashboardStateStatus.loading;
      await TaskService().returnServiceTaker(taskCode);
      _status = TaskDashboardStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao rejeitar tarefa', error: e, stackTrace: s);
      _status = TaskDashboardStateStatus.error;
      _errorMessage = 'Erro ao rejeitar tarefa';
    }
  }

  Future<void> sendWorker(String taskCode) async {
    try {
      _status = TaskDashboardStateStatus.loading;
      await TaskService().sendWorker(taskCode);
      _status = TaskDashboardStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao enviar tarefa ao trabralhador', error: e, stackTrace: s);
      _status = TaskDashboardStateStatus.error;
      _errorMessage = 'Erro ao enviar tarefa ao trabralhador';
    }
  }
}
