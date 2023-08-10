import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../models/service_taker_model.dart';
import '../models/syndicate_model.dart';
import '../services/serviceTaker/service_taker_service.dart';
import '../services/syndicate/syndicate_service.dart';
import '../core/rest_client/custom_dio.dart';
import 'http_controller.dart';
part 'employeer_picker_controller.g.dart';

enum EmployeerPickerStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class EmployeerPickerController = EmployeerPickerControllerBase
    with _$EmployeerPickerController;

abstract class EmployeerPickerControllerBase with Store {
  @readonly
  var _status = EmployeerPickerStateStatus.initial;

  @readonly
  var _employeerList = <SyndicateModel>[];

  @readonly
  var _serviceTakerList = <ServiceTakerModel>[];

  @observable
  SyndicateModel? employeerSelected;

  @readonly
  String? _errorMessage;

  @action
  void setEmployeerSelected(SyndicateModel value) => employeerSelected = value;

  @action
  Future<void> findEmployeers() async {
    try {
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      _status = EmployeerPickerStateStatus.loading;
      _employeerList = await SyndicateService(dio).findAll();
      _status = EmployeerPickerStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar empregadoras', error: e, stackTrace: s);
      _status = EmployeerPickerStateStatus.error;
      _errorMessage = 'Erro ao buscar empregadoras';
    }
  }

  @action
  Future<void> findServiceTaker(String id) async {
    try {
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      _status = EmployeerPickerStateStatus.loading;
      _serviceTakerList =
          await ServiceTakerService(dio).getServiceTakerBySyndicate(id);
      _status = EmployeerPickerStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar empregadoras', error: e, stackTrace: s);
      _status = EmployeerPickerStateStatus.error;
      _errorMessage = 'Erro ao buscar empregadoras';
    }
  }
}
