import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../core/rest_client/custom_dio.dart';
import '../models/dashboard_task_model.dart';
import '../models/task_model.dart';
import '../services/task/task_service.dart';
import 'http_controller.dart';
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

  @observable
  DashboardList? selectedDashboard =
      DashboardList(items: <TaskModel>[], amount: 0.0);

  @action
  void setButtonSelected(int value) => buttonSelected = value;

  @readonly
  DashboardTaskModel? _tasks = DashboardTaskModel(
    available: DashboardList(items: <TaskModel>[]),
    confirmed: DashboardList(items: <TaskModel>[]),
    inProgress: DashboardList(items: <TaskModel>[]),
    finished: DashboardList(items: <TaskModel>[]),
  );

  Future<void> getTasks(String? id) async {
    try {
      _status = HomeWorkerStateStatus.loading;
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      _tasks = await TaskService(dio).getTasksWorker(id);
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
        selectedDashboard = _tasks!.available;
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

  Future<void> acceptTask(TaskModel task, String idUser) async {
    try {
      _status = HomeWorkerStateStatus.loading;
      // await TaskService().acceptTask(task, idUser);
      _status = HomeWorkerStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao aceitar a tarefa', error: e, stackTrace: s);
      _status = HomeWorkerStateStatus.error;
      _errorMessage = 'Erro ao aceitar a tarefa';
    }
  }
}
