import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../../core/ui/helpers/enums.dart';
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
  // HomeWorkerControllerBase() {
  //   getData();
  // }
  @readonly
  var _status = HomeWorkerStateStatus.initial;

  @readonly
  String? _errorMessage;

  @observable
  int buttonSelected = 0;

  @readonly
  var _tasks = <TaskModel>[];

  @readonly
  String? _employeerCode;

  @action
  void setButtonSelected(int value) => buttonSelected = value;

  @observable
  OptionDistance optionDistance = OptionDistance.km25;

  @action
  void setOptionDistance(OptionDistance value) => optionDistance = value;

  Future<void> getTasks(String? id, {required int status}) async {
    try {
      _status = HomeWorkerStateStatus.loading;
      _tasks = await TaskService().getAllTasks(id, status);
      _status = HomeWorkerStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar listar tarefas', error: e, stackTrace: s);
      _status = HomeWorkerStateStatus.error;
      _errorMessage = 'Erro ao buscar listar tarefas';
    }
  }
}
