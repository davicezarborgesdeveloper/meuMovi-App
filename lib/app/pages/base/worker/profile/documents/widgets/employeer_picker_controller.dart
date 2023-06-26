import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../../../../models/syndicate_model.dart';
import '../../../../../../services/syndicate/syndicate_service.dart';
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

  @observable
  SyndicateModel? employeerSelected;

  @readonly
  String? _errorMessage;

  @action
  void setEmployeerSelected(SyndicateModel value) => employeerSelected = value;

  @action
  Future<void> findEmployeers() async {
    try {
      _status = EmployeerPickerStateStatus.loading;
      _employeerList = await SyndicateService().getSyndicates();
      _status = EmployeerPickerStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar empregadoras', error: e, stackTrace: s);
      _status = EmployeerPickerStateStatus.error;
      _errorMessage = 'Erro ao buscar empregadoras';
    }
  }
}
