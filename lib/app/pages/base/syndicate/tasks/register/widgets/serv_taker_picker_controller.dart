import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../../../../models/service_taker_model.dart';
import '../../../../../../services/service_taker/service_taker_service.dart';
part 'serv_taker_picker_controller.g.dart';

enum ServTakerPickerStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class ServTakerPickerController = ServTakerPickerControllerBase
    with _$ServTakerPickerController;

abstract class ServTakerPickerControllerBase with Store {
  @readonly
  var _status = ServTakerPickerStateStatus.initial;

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
      _status = ServTakerPickerStateStatus.loading;
      _serviceTakerList =
          await ServiceTakerService().getAllServiceTaker(userId);
      _status = ServTakerPickerStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar empregadoras', error: e, stackTrace: s);
      _status = ServTakerPickerStateStatus.error;
      _errorMessage = 'Erro ao buscar empregadoras';
    }
  }
}
