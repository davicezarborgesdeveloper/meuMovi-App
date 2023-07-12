import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../../models/dashboard/dashboard_task_model.dart';
import '../../../../models/task_model.dart';
import '../../../../services/task/task_service.dart';
part 'home_service_taker_controller.g.dart';

enum HomeServiceTakerStateStatus {
  initial,
  loading,
  loaded,
  error,
  deleted,
}

class HomeServiceTakerController = HomeServiceTakerControllerBase
    with _$HomeServiceTakerController;

abstract class HomeServiceTakerControllerBase with Store {
  @readonly
  var _status = HomeServiceTakerStateStatus.initial;

  @readonly
  String? _errorMessage;

  @observable
  int buttonSelected = 0;

  @readonly
  DashboardTaskModell? _tasks = DashboardTaskModell(
    opened: DashboardList(list: <TaskModel>[]),
    confirmed: DashboardList(list: <TaskModel>[]),
    inProgress: DashboardList(list: <TaskModel>[]),
    finished: DashboardList(list: <TaskModel>[]),
  );

  @observable
  DashboardList? selectedDashboard =
      DashboardList(list: <TaskModel>[], amountValue: 0.0);

  @readonly
  String? _employeerCode;

  @action
  void setButtonSelected(int value) => buttonSelected = value;

  @action
  void setSelectedDashboard(DashboardList? value) => selectedDashboard = value;

  Future<void> getTasks(String? id) async {
    try {
      _status = HomeServiceTakerStateStatus.loading;
      _tasks = await TaskService().getTasksDashboardServiceTaker(id);
      await setDashboardList();
      _status = HomeServiceTakerStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar listar tarefas', error: e, stackTrace: s);
      _status = HomeServiceTakerStateStatus.error;
      _errorMessage = 'Erro ao buscar listar tarefas';
    }
  }

  Future<void> setDashboardList() async {
    switch (buttonSelected) {
      case 0:
        selectedDashboard = _tasks!.opened;
        break;
      case 1:
        selectedDashboard = _tasks!.confirmed;
        break;
      case 2:
        selectedDashboard = _tasks!.inProgress;
        break;
      case 3:
        selectedDashboard = _tasks!.finished;
        break;
    }
  }

  Future<void> deleteTask(String id) async {
    try {
      _status = HomeServiceTakerStateStatus.loading;
      await TaskService().delete(id);
      _status = HomeServiceTakerStateStatus.deleted;
    } catch (e, s) {
      log('Erro ao apagar tarefa', error: e, stackTrace: s);
      _status = HomeServiceTakerStateStatus.error;
      _errorMessage = 'Erro ao apagar tarefa';
    }
  }

  Future<void> sentSyndicate(String taskCode, String syndicateCode) async {
    try {
      _status = HomeServiceTakerStateStatus.loading;
      await TaskService().sentToSyndicate(taskCode, syndicateCode);
      _status = HomeServiceTakerStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao enviar tarefa ao sindicato', error: e, stackTrace: s);
      _status = HomeServiceTakerStateStatus.error;
      _errorMessage = 'Erro ao enviar tarefa ao sindicato';
    }
  }
}
