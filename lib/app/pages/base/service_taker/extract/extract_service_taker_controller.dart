import 'package:mobx/mobx.dart';
part 'extract_service_taker_controller.g.dart';

enum ExtractServiceTakerStateStatus {
  initial,
  loading,
  loaded,
  error,
}

class ExtractServiceTakerController = ExtractServiceTakerControllerBase
    with _$ExtractServiceTakerController;

abstract class ExtractServiceTakerControllerBase with Store {
  @readonly
  var _status = ExtractServiceTakerStateStatus.initial;

  @readonly
  String? _errorMessage;

  @observable
  int buttonSelected = 7;

  @action
  void setButtonSelected(int value) => buttonSelected = value;
}
