import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../models/dashboard_task_model.dart';
import '../models/task_model.dart';
import '../services/task/task_service.dart';
import '../core/rest_client/custom_dio.dart';
import 'http_controller.dart';
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

  @observable
  DashboardList? selectedDashboard =
      DashboardList(items: <TaskModel>[], amount: 0.0);

  @action
  void setButtonSelected(int value) => buttonSelected = value;

  @readonly
  DashboardTaskModel? _tasks = DashboardTaskModel(
    opened: DashboardList(items: <TaskModel>[]),
    confirmed: DashboardList(items: <TaskModel>[]),
    inProgress: DashboardList(items: <TaskModel>[]),
    finished: DashboardList(items: <TaskModel>[]),
  );

  Future<void> getTasks(String? id) async {
    try {
      _status = HomeServiceTakerStateStatus.loading;
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      _tasks = await TaskService(dio).getTasksServiceTaker(id);
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

  Future<void> deleteTask(String taskCode) async {
    try {
      _status = HomeServiceTakerStateStatus.loading;
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      await TaskService(dio).delete(taskCode);
      _status = HomeServiceTakerStateStatus.deleted;
    } catch (e, s) {
      log('Erro ao apagar tarefa', error: e, stackTrace: s);
      _status = HomeServiceTakerStateStatus.error;
      _errorMessage = 'Erro ao apagar tarefa';
    }
  }

  Future<void> sentSyndicate(String taskCode) async {
    try {
      _status = HomeServiceTakerStateStatus.loading;
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      await TaskService(dio).sendToSyndicate(taskCode);
      _status = HomeServiceTakerStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao enviar tarefa ao sindicato', error: e, stackTrace: s);
      _status = HomeServiceTakerStateStatus.error;
      _errorMessage = 'Erro ao enviar tarefa ao sindicato';
    }
  }
}
