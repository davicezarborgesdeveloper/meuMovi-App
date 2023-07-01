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
  DashboardTaskModel? _tasks = DashboardTaskModel(
    opened: <TaskModel>[],
    confirmed: <TaskModel>[],
    inProgress: <TaskModel>[],
    finished: <TaskModel>[],
  );

  @readonly
  String? _employeerCode;

  @action
  void setButtonSelected(int value) => buttonSelected = value;

  Future<void> getTasks(String? id) async {
    try {
      _status = HomeServiceTakerStateStatus.loading;
      _tasks = await TaskService().getTasksDashboard(id);
      _status = HomeServiceTakerStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar listar tarefas', error: e, stackTrace: s);
      _status = HomeServiceTakerStateStatus.error;
      _errorMessage = 'Erro ao buscar listar tarefas';
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
      log('Erro ao buscar listar tarefas', error: e, stackTrace: s);
      _status = HomeServiceTakerStateStatus.error;
      _errorMessage = 'Erro ao buscar listar tarefas';
    }
  }
}
