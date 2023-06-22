import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/extensions/formatter_extensions.dart';
import '../../../../../core/extensions/validator_extensions.dart';
import '../../../../../models/service_taker_model.dart';
import '../../../../../repositories/zip/zip_repository.dart';
import '../../../../../services/auth/auth_service.dart';
import '../../../../../services/service_taker/service_taker_service.dart';
import '../../../../auth/auth_controller.dart';
import '../../../../auth/user_controller.dart';
part 'service_taker_edit_data_controller.g.dart';

enum ServiceTakerEditDataStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class ServiceTakerEditDataController = ServiceTakerEditDataControllerBase
    with _$ServiceTakerEditDataController;

abstract class ServiceTakerEditDataControllerBase with Store {
  ServiceTakerEditDataControllerBase() {
    getData();
  }
  @readonly
  var _status = ServiceTakerEditDataStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  @observable
  String? companyName;

  @observable
  String? fantasyName;

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

  @action
  void setCompanyName(String value) => companyName = value;

  @action
  void setFantasyName(String value) => fantasyName = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setCnpj(String value) => cnpj = value;

  @action
  void setName(String value) => name = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setZip(String value) => zip = value;

  @action
  void setNumber(String value) => number = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setRetypePass(String value) => retypePass = value;

  @computed
  bool get companyNameValid => companyName != null && companyName!.length > 3;
  String? get companyNameError {
    if (!_showErrors || companyNameValid) {
      return null;
    } else if (companyName == null || companyName!.isEmpty) {
      return 'Razão Social Obrigatória';
    } else {
      return 'Razão Social muito curta';
    }
  }

  @computed
  bool get fantasyNameValid => fantasyName != null && fantasyName!.length > 3;
  String? get fantasyNameError {
    if (!_showErrors || fantasyNameValid) {
      return null;
    } else if (fantasyName == null || fantasyName!.isEmpty) {
      return 'Nome fantasia Obrigatório';
    } else {
      return 'Nome fantasia muito curto';
    }
  }

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
      retypePassValid;

  @computed
  dynamic get sendPressedSignup => isFormValid ? register : null;

  @action
  Future<void> register() async {
    _status = ServiceTakerEditDataStateStatus.loading;
    try {
      final user = ServiceTakerModel(
        user: cnpj!.replaceAll(RegExp(r'[^0-9]'), ''),
        password: password!,
        profileType: 1,
        active: true,
        fantasyName: fantasyName!,
        companyName: companyName!,
        cnpj: cnpj!.replaceAll(RegExp(r'[^0-9]'), ''),
        name: name!,
        phone: phone!.replaceAll(RegExp(r'[^0-9]'), ''),
        email: email!,
        zip: zip!.replaceAll(RegExp(r'[^0-9]'), ''),
        number: number!,
      );
      await ServiceTakerService().saveServiceTaker(user);
      final auth = await AuthService().login(user.user, user.password, false);
      GetIt.I<AuthController>().setAuth(auth);
      GetIt.I<UserController>().getCurrentUser(user.user);
      _status = ServiceTakerEditDataStateStatus.saved;
    } catch (e, s) {
      log('Erro ao registrar Tomadora', error: e, stackTrace: s);
      _errorMessage = 'Erro ao registrar Tomadora';
      _status = ServiceTakerEditDataStateStatus.error;
    }
  }

  @action
  Future<void> searchZip(String zipFilter) async {
    _status = ServiceTakerEditDataStateStatus.loading;
    try {
      final address = await ZipRepository().getAddressFromZip(zipFilter);
      _city = '${address!.cidade.nome}-${address.estado.sigla}';
      _status = ServiceTakerEditDataStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar cep', error: e, stackTrace: s);
      _status = ServiceTakerEditDataStateStatus.error;
    }
  }

  @action
  Future<void> getData() async {
    _status = ServiceTakerEditDataStateStatus.loading;
    final data = GetIt.I<UserController>().user as ServiceTakerModel;
    companyName = data.companyName;
    fantasyName = data.fantasyName;
    cnpj = data.cnpj.formattedCNPJ;
    name = data.name;
    phone = data.phone.formattedPhone;
    email = data.email;
    zip = data.zip.formattedZip;
    number = data.number;
    password = data.password;
    retypePass = data.password;
    await searchZip(data.zip);
  }
}
