import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../../../models/service_taker_model.dart';
import '../../../../../services/service_taker/service_taker_service.dart';
part 'service_taker_list_controller.g.dart';

enum ServiceTakerListStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
  deleted,
}

class ServiceTakerListController = ServiceTakerListControllerBase
    with _$ServiceTakerListController;

abstract class ServiceTakerListControllerBase with Store {
  @readonly
  var _status = ServiceTakerListStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  var _serviceTaker = <ServiceTakerModel>[];

  Future<void> findServiceTaker() async {
    try {
      _status = ServiceTakerListStateStatus.loading;
      _serviceTaker = await ServiceTakerService().getAllServiceTaker();
      _status = ServiceTakerListStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar listar tomadoras', error: e, stackTrace: s);
      _status = ServiceTakerListStateStatus.error;
      _errorMessage = 'Erro ao buscar listar tomadoras';
    }
  }

  Future<void> delete(String id) async {
    try {
      _status = ServiceTakerListStateStatus.loading;
      await ServiceTakerService().delete(id);
      _status = ServiceTakerListStateStatus.deleted;
    } catch (e, s) {
      log('Erro ao apagar tomadora', error: e, stackTrace: s);
      _status = ServiceTakerListStateStatus.error;
      _errorMessage = 'Erro ao apagar tomadora';
    }
  }
}
