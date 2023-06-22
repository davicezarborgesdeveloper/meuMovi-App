import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../../../models/worker_model.dart';
import '../../../../../services/worker/worker_service.dart';

part 'worker_list_controller.g.dart';

enum WorkerListStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
  deleted,
}

class WorkerListController = WorkerListControllerBase
    with _$WorkerListController;

abstract class WorkerListControllerBase with Store {
  @readonly
  var _status = WorkerListStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  var _workers = <WorkerModel>[];

  Future<void> findWorkers() async {
    try {
      _status = WorkerListStateStatus.loading;
      _workers = await WorkerService().getAllWorkers();
      _status = WorkerListStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar listar trabalhadores', error: e, stackTrace: s);
      _status = WorkerListStateStatus.error;
      _errorMessage = 'Erro ao buscar listar trabalhadores';
    }
  }

  Future<void> delete(String id) async {
    try {
      _status = WorkerListStateStatus.loading;
      await WorkerService().delete(id);
      _status = WorkerListStateStatus.deleted;
    } catch (e, s) {
      log('Erro ao apagar trabalhador', error: e, stackTrace: s);
      _status = WorkerListStateStatus.error;
      _errorMessage = 'Erro ao apagar trabalhador';
    }
  }
}
