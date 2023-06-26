import 'package:mobx/mobx.dart';

import '../../../../core/ui/helpers/enums.dart';
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
  @readonly
  var _status = HomeWorkerStateStatus.initial;

  @readonly
  String? _errorMessage;

  @observable
  int buttonSelected = 0;

  @action
  void setButtonSelected(int value) => buttonSelected = value;

  @observable
  OptionDistance optionDistance = OptionDistance.km25;

  @action
  void setOptionDistance(OptionDistance value) => optionDistance = value;
}
