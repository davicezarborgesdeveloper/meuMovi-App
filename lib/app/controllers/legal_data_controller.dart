import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../core/extensions/formatter_extensions.dart';
import '../core/extensions/validator_extensions.dart';
import '../core/rest_client/custom_dio.dart';
import '../services/syndicate/syndicate_service.dart';
import 'http_controller.dart';
import 'user_controller.dart';
part 'legal_data_controller.g.dart';

enum LegalDataStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class LegalDataController = LegalDataControllerBase with _$LegalDataController;

abstract class LegalDataControllerBase with Store {
  LegalDataControllerBase() {
    getData();
  }
  @readonly
  var _status = LegalDataStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  @observable
  String? corporateName;

  @observable
  String? fantasyName;

  @observable
  String? cnpj;

  @observable
  String? password;

  @observable
  String? retypePass;

  @action
  void setCorporateName(String value) {
    corporateName = value;
  }

  @action
  void setFantasyName(String value) => fantasyName = value;

  @action
  void setCNPJ(String value) => cnpj = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setRetypePass(String value) => retypePass = value;

  @computed
  bool get corporateNameValid =>
      corporateName != null && corporateName!.length > 3;
  String? get corporateNameError {
    if (!_showErrors || corporateNameValid) {
      return null;
    } else if (corporateName == null || corporateName!.isEmpty) {
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
  bool get retypePassValid =>
      password != null ? (retypePass != null && retypePass == password) : true;
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
  dynamic get sendPressed => isFormValid ? register : null;

  @computed
  bool get isFormValid =>
      corporateNameValid && fantasyNameValid && cnpjValid && retypePassValid;

  @action
  Future<void> getData() async {
    _status = LegalDataStateStatus.loading;
    final data = GetIt.I<UserController>().syndicate;
    corporateName = data!.companyData.corporateName;
    fantasyName = data.companyData.fantasyName;
    cnpj = data.companyData.cnpj.formattedCNPJ;
    _status = LegalDataStateStatus.loaded;
  }

  @action
  Future<void> register() async {
    _status = LegalDataStateStatus.loading;
    try {
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      final data = GetIt.I<UserController>().syndicate;
      var user = data!.copyWith(
        companyData: data.companyData.copyWith(
          corporateName: corporateName,
          fantasyName: fantasyName,
          cnpj: cnpj!.replaceAll(RegExp(r'[^0-9]'), ''),
        ),
      );
      if (passwordValid && retypePassValid) {
        user = user.copyWith(password: password!);
      }
      await SyndicateService(dio).update(user, 'DJ');
      GetIt.I<UserController>().setSyndicate(user);
      _status = LegalDataStateStatus.saved;
    } on Exception catch (e, s) {
      log('Erro ao atualizar dados do sindicato', error: e, stackTrace: s);
      _errorMessage = 'Erro ao atualizar dados do sindicato';
      _status = LegalDataStateStatus.error;
    }
  }
}
