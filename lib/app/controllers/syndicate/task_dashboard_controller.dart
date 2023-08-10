import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../models/dashboard_task_model.dart';
import '../../models/task_model.dart';
import '../../services/task/task_service.dart';
import '../http_controller.dart';
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

  @observable
  DashboardList? selectedDashboard =
      DashboardList(items: <TaskModel>[], amount: 0.0);

  @action
  void setButtonSelected(int value) => buttonSelected = value;

  @readonly
  DashboardTaskModel? _tasks = DashboardTaskModel(
    inAnalysis: DashboardList(items: <TaskModel>[]),
    opened: DashboardList(items: <TaskModel>[]),
    waitStart: DashboardList(items: <TaskModel>[]),
    inProgress: DashboardList(items: <TaskModel>[]),
    finished: DashboardList(items: <TaskModel>[]),
  );

  Future<void> getTasks(String? id) async {
    try {
      _status = TaskDashboardStateStatus.loading;
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      _tasks = await TaskService(dio).getTasksSyndicate(id);
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
        selectedDashboard = _tasks!.inAnalysis;
        break;
      case 1:
        selectedDashboard = _tasks!.opened;
        break;
      case 2:
        selectedDashboard = _tasks!.waitStart;
        break;
      case 3:
        selectedDashboard = _tasks!.inProgress;
        break;
      case 4:
        selectedDashboard = _tasks!.finished;
        break;
    }
  }

  Future<void> deleteTask(String taskCode) async {
    // try {
    //   _status = TaskDashboardStateStatus.loading;
    //   final CustomDio dio = GetIt.I<HttpController>().customDio!;
    //   await TaskService(dio).delete(taskCode);
    //   _status = TaskDashboardStateStatus.deleted;
    // } catch (e, s) {
    //   log('Erro ao apagar tarefa', error: e, stackTrace: s);
    //   _status = TaskDashboardStateStatus.error;
    //   _errorMessage = 'Erro ao apagar tarefa';
    // }
  }

  Future<void> sendWorker(String taskCode) async {
    try {
      _status = TaskDashboardStateStatus.loading;
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      await TaskService(dio).sendToWorker(taskCode);
      _status = TaskDashboardStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao enviar tarefa ao sindicato', error: e, stackTrace: s);
      _status = TaskDashboardStateStatus.error;
      _errorMessage = 'Erro ao enviar tarefa ao sindicato';
    }
  }

  Future<void> returnServiceTaker(String taskCode) async {
    try {
      _status = TaskDashboardStateStatus.loading;
      // await TaskService().returnServiceTaker(taskCode);
      _status = TaskDashboardStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao rejeitar tarefa', error: e, stackTrace: s);
      _status = TaskDashboardStateStatus.error;
      _errorMessage = 'Erro ao rejeitar tarefa';
    }
  }
}
