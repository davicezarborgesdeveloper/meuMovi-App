import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../core/extensions/validator_extensions.dart';
import '../../../../../../core/ui/helpers/enums.dart';
import '../../../../../../models/worker_model.dart';
import '../../../../../../services/worker/worker_service.dart';
import '../../../../../auth/user_controller.dart';
part 'pix_controller.g.dart';

enum PixStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class PixController = PixControllerBase with _$PixController;

abstract class PixControllerBase with Store {
  @readonly
  var _status = PixStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  @observable
  PixKeyType? pixKeyType;

  @observable
  String? pixKey;

  @action
  void setPixKeyType(PixKeyType? value) => pixKeyType = value;

  @action
  void setPixKey(String value) => pixKey = value;

  @computed
  bool get pixKeyTypeValid => pixKeyType != null;
  String? get pixKeyTypeError {
    if (!_showErrors || pixKeyTypeValid) {
      return null;
    } else {
      return 'Campo Obrigatório';
    }
  }

  @computed
  bool get pixKeyValid => pixKey != null && pixKeyValidation;
  String? get pixKeyError {
    if (!_showErrors || pixKeyValid) {
      return null;
    } else {
      return 'Campo Obrigatório';
    }
  }

  bool get pixKeyValidation {
    if (pixKey != null) {
      if (pixKeyType!.acronym == 'CPF') {
        return pixKey!.isCPFValid;
      } else if (pixKeyType!.acronym == 'CNPJ') {
        return pixKey!.isCNPJValid;
      } else if (pixKeyType!.acronym == 'PHN') {
        return pixKey!.isPhoneValid;
      } else if (pixKeyType!.acronym == 'EMl') {
        return pixKey!.isEmailValid;
      }
    }
    return false;
  }

  @computed
  bool get isFormValid => pixKeyTypeValid && pixKeyValid;

  @action
  void invalidSendPressed() => _showErrors = true;

  @computed
  dynamic get sendPressed => isFormValid ? save : null;

  @action
  Future<void> save() async {
    try {
      _status = PixStateStatus.loading;
      final getData = GetIt.I<UserController>().worker;
      final saveData = getData!.copyWith(
        bankData: BankDataModel(
          pixKey: pixKey!.replaceAll(RegExp(r'[^0-9]'), ''),
          pixKeyType: pixKeyType,
          bankReceiptType: BankReceiptType.pix,
        ),
      );
      await WorkerService().workerUpdate(saveData);
      GetIt.I<UserController>().setUser(saveData);
      _status = PixStateStatus.saved;
    } on Exception catch (e, s) {
      log('Erro ao atualizar dados cancários', error: e, stackTrace: s);
      _errorMessage = 'Erro ao atualizar usuário';
      _status = PixStateStatus.error;
    }
  }
}
