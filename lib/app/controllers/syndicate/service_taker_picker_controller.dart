import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../models/service_taker_model.dart';
import '../../services/serviceTaker/service_taker_service.dart';
import '../http_controller.dart';
part 'service_taker_picker_controller.g.dart';

enum ServiceTakerPickerStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class ServiceTakerPickerController = ServiceTakerPickerControllerBase
    with _$ServiceTakerPickerController;

abstract class ServiceTakerPickerControllerBase with Store {
  @readonly
  var _status = ServiceTakerPickerStateStatus.initial;

  @readonly
  var _serviceTakerList = <ServiceTakerModel>[];

  @observable
  ServiceTakerModel? serviceTakerSelected;

  @readonly
  String? _errorMessage;

  @action
  void setServiceTakerSelected(ServiceTakerModel value) =>
      serviceTakerSelected = value;

  @action
  Future<void> findServiceTaker(String? userId) async {
    try {
      _status = ServiceTakerPickerStateStatus.loading;
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      _serviceTakerList =
          await ServiceTakerService(dio).getServiceTakerBySyndicate(userId);
      _status = ServiceTakerPickerStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar empregadoras', error: e, stackTrace: s);
      _status = ServiceTakerPickerStateStatus.error;
      _errorMessage = 'Erro ao buscar empregadoras';
    }
  }
}
