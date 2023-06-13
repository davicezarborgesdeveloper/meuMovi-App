import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../../core/extensions/validator_extensions.dart';
import '../../../../core/rest_client/custom_dio.dart';
import '../../../../models/new/service_taker_model.dart';
import '../../../../repositories/auth/auth_repository.dart';
import '../../../../repositories/zip/zip_repository.dart';
part 'service_taker_register_controller.g.dart';

enum ServiceTakerRegisterStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class ServiceTakerRegisterController = ServiceTakerRegisterControllerBase
    with _$ServiceTakerRegisterController;

abstract class ServiceTakerRegisterControllerBase with Store {
  @readonly
  var _status = ServiceTakerRegisterStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  @observable
  String? cnpj;

  @observable
  String? name;

  @observable
  String? phone;

  @observable
  String? email;

  @observable
  String? zip;

  @observable
  String? number;

  @observable
  String? password;

  @observable
  String? retypePass;

  @readonly
  String? _city;

  @observable
  bool termsAccepted = false;

  @action
  void setCnpj(String value) => cnpj = value;

  @action
  void setName(String value) => name = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setZip(String value) => zip = value;

  @action
  void setNumber(String value) => number = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setRetypePass(String value) => retypePass = value;

  @action
  void setTermsAccepted(bool value) => termsAccepted = value;

  @computed
  bool get cnpjValid => cnpj != null && cnpj!.isCNPJValid;
  String? get cnpjError {
    if (!_showErrors || cnpjValid) {
      return null;
    } else if (cnpj == null || cnpj!.isEmpty) {
      return 'CNPJ Obrigatório';
    } else if (!cnpj!.isCNPJValid) {
      return 'CNPJ inválido';
    } else {
      return 'CNPJ muito curto';
    }
  }

  @computed
  bool get nameValid => name != null && name!.length > 3;
  String? get nameError {
    if (!_showErrors || nameValid) {
      return null;
    } else if (name == null || name!.isEmpty) {
      return 'Nome Obrigatório';
    } else {
      return 'Nome muito curto';
    }
  }

  @computed
  bool get emailValid => email != null && email!.isEmailValid;
  String? get emailError {
    if (!_showErrors || emailValid) {
      return null;
    } else if (email == null || email!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'E-mail inválido';
    }
  }

  @computed
  bool get zipValid => zip != null && zip!.length >= 10;
  String? get zipError {
    if (!_showErrors || zipValid) {
      return null;
    } else if (zip == null || zip!.isEmpty) {
      return 'CEP Obrigatório';
    } else {
      return 'CEP muito curto';
    }
  }

  @computed
  bool get passwordValid => password != null && password!.length >= 6;
  String? get passwordError {
    if (!_showErrors || passwordValid) {
      return null;
    } else if (password == null || password!.isNotEmpty) {
      return 'Senha Obrigatória';
    } else {
      return 'Senha muito curta';
    }
  }

  @computed
  bool get retypePassValid => retypePass != null && retypePass == password;
  String? get retypePassError {
    if (!_showErrors || retypePassValid) {
      return null;
    } else {
      return 'Senhas não coincidem';
    }
  }

  @action
  void invalidSendPressed() => _showErrors = true;

  @computed
  bool get isFormValid =>
      cnpjValid &&
      nameValid &&
      emailValid &&
      zipValid &&
      passwordValid &&
      retypePassValid &&
      termsAccepted;

  @computed
  dynamic get sendPressed => isFormValid ? register : null;

  @action
  Future<void> register() async {
    _status = ServiceTakerRegisterStateStatus.loading;
    try {
      final serviceTaker = ServiceTakerModel(
        user: cnpj!.replaceAll(RegExp(r'[^0-9]'), ''),
        password: password!,
        profileType: 1,
        active: true,
        cnpj: cnpj!.replaceAll(RegExp(r'[^0-9]'), ''),
        companyName: name!,
        phone: phone!.replaceAll(RegExp(r'[^0-9]'), ''),
        email: email!,
        zip: zip!.replaceAll(RegExp(r'[^0-9]'), ''),
        number: number!,
      );
      CustomDio dio = CustomDio();
      final userAuth =
          await AuthRepository(dio).registerServiceTaker(serviceTaker);
      final auth = await AuthRepository(dio)
          .login(serviceTaker.user!, serviceTaker.password);
      _status = ServiceTakerRegisterStateStatus.saved;
    } catch (e, s) {
      log('Erro ao registrar Tomadora', error: e, stackTrace: s);
      _errorMessage = 'Erro ao registrar Tomadora';
      _status = ServiceTakerRegisterStateStatus.error;
    }
  }

  @action
  Future<void> searchZip(String zipFilter) async {
    _status = ServiceTakerRegisterStateStatus.loading;
    try {
      final address = await ZipRepository().getAddressFromZip(zipFilter);
      _city = '${address!.cidade.nome}-${address.estado.sigla}';
      _status = ServiceTakerRegisterStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar cep', error: e, stackTrace: s);
      _status = ServiceTakerRegisterStateStatus.error;
    }
  }
}
