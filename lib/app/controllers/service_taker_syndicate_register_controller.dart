import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../core/extensions/formatter_extensions.dart';
import '../core/extensions/validator_extensions.dart';
import '../core/rest_client/custom_dio.dart';
import '../models/service_taker_model.dart';
import '../models/worker_model.dart';
import '../repositories/zip/zip_repository.dart';
import '../services/serviceTaker/service_taker_service.dart';
import 'http_controller.dart';
part 'service_taker_syndicate_register_controller.g.dart';

enum ServiceTakerRegisterStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class ServiceTakerSyndicateRegisterController = ServiceTakerSyndicateRegisterControllerBase
    with _$ServiceTakerSyndicateRegisterController;

abstract class ServiceTakerSyndicateRegisterControllerBase with Store {
  @readonly
  var _status = ServiceTakerRegisterStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  @observable
  int? mode;

  @readonly
  String? _code;

  @observable
  String? companyName;

  @observable
  String? fantasyName;

  @observable
  EmployeerModel? employeer;

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

  @action
  void setTermsAccepted(bool value) => termsAccepted = value;

  @action
  void setEmployeer(EmployeerModel? value) => employeer = value;

  @action
  void setMode(int value) => mode = value;

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

  @computed
  bool get employeerValid => employeer != null;
  String? get employeerError {
    if (!_showErrors || employeerValid) {
      return null;
    } else {
      return 'Empregadora Obrigatória';
    }
  }

  @computed
  bool get phoneValid => phone != null && phone!.isPhoneValid;
  String? get phoneError {
    if (!_showErrors || phoneValid) {
      return null;
    } else if (phone == null || phone!.isEmpty) {
      return 'Telefone Obrigatório';
    } else {
      return 'Telefone muito curto';
    }
  }

  @action
  void invalidSendPressed() => _showErrors = true;

  @computed
  bool get isFormValidRegister =>
      fantasyNameValid &&
      companyNameValid &&
      emailValid &&
      cnpjValid &&
      phoneValid &&
      nameValid &&
      zipValid & employeerValid;

  @computed
  dynamic get sendPressedRegister => isFormValidRegister ? register : null;

  @action
  Future<void> register() async {
    _status = ServiceTakerRegisterStateStatus.loading;
    try {
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      final user = ServiceTakerModel(
        id: _code != null ? int.tryParse(_code!) : null,
        user: cnpj!.replaceAll(RegExp(r'[^0-9]'), ''),
        password: 'meumovi2023',
        profileType: 1,
        active: true,
        fantasyName: fantasyName!,
        companyName: companyName!,
        employeer: EmployeerModel(
          code: employeer!.code,
          name: employeer!.name,
        ),
        cnpj: cnpj!.replaceAll(RegExp(r'[^0-9]'), ''),
        name: name!,
        phone: phone == null ? null : phone!.replaceAll(RegExp(r'[^0-9]'), ''),
        email: email!,
        zip: zip!.replaceAll(RegExp(r'[^0-9]'), ''),
        number: number,
      );
      if (mode == 0) {
        await ServiceTakerService(dio).save(user);
      } else {
        await ServiceTakerService(dio).update(user);
      }
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
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      final address = await ZipRepository(dio).getAddressFromZip(zipFilter);
      _city = '${address!.cidade}-${address.estado}';
      _status = ServiceTakerRegisterStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar cep', error: e, stackTrace: s);
      _status = ServiceTakerRegisterStateStatus.error;
    }
  }

  Future<void> loadData(ServiceTakerModel? model) async {
    _status = ServiceTakerRegisterStateStatus.loading;
    _code = (model!.id).toString();
    companyName = model.companyName;
    fantasyName = model.fantasyName;
    cnpj = model.cnpj.formattedCNPJ;
    name = model.name;
    phone = model.phone?.formattedPhone;
    email = model.email;
    zip = model.zip.formattedZip;
    number = model.number;
    employeer = model.employeer != null
        ? EmployeerModel(
            code: model.employeer!.code,
            name: model.employeer!.name,
          )
        : EmployeerModel(code: '', name: '');
    await searchZip(model.zip);
  }
}