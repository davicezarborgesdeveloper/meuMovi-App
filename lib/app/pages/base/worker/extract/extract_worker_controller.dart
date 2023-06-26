import 'package:mobx/mobx.dart';
part 'extract_worker_controller.g.dart';

enum ExtractWorkerStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class ExtractWorkerController = ExtractWorkerControllerBase
    with _$ExtractWorkerController;

abstract class ExtractWorkerControllerBase with Store {
  @readonly
  var _status = ExtractWorkerStateStatus.initial;

  @readonly
  String? _errorMessage;

  @observable
  int buttonSelected = 7;

  @action
  void setButtonSelected(int value) => buttonSelected = value;
}
