import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../core/rest_client/custom_dio.dart';
import '../models/worker_model.dart';
import '../services/worker/worker_service.dart';
import 'http_controller.dart';
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

  Future<void> findWorkers(String? userId) async {
    try {
      _status = WorkerListStateStatus.loading;
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      _workers = await WorkerService(dio).getWorkersBySyndicate(userId);
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
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      await WorkerService(dio).delete(id);
      _status = WorkerListStateStatus.deleted;
    } catch (e, s) {
      log('Erro ao apagar trabalhador', error: e, stackTrace: s);
      _status = WorkerListStateStatus.error;
      _errorMessage = 'Erro ao apagar trabalhador';
    }
  }
}
