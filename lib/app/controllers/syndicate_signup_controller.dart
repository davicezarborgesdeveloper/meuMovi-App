import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../models/address_model.dart';
import '../models/syndicate_model.dart';
import '../repositories/zip/zip_repository.dart';
import '../services/auth/login_service.dart';
import '../services/syndicate/syndicate_service.dart';
import '../core/extensions/validator_extensions.dart';
import '../core/rest_client/custom_dio.dart';
import '../core/ui/helpers/enums.dart';
import 'http_controller.dart';
import 'user_controller.dart';
part 'syndicate_signup_controller.g.dart';

enum SyndicateRegisterStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class SyndicateSignupController = SyndicateSignupControllerBase
    with _$SyndicateSignupController;

abstract class SyndicateSignupControllerBase with Store {
  @readonly
  var _status = SyndicateRegisterStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  // --Dados Iniciais
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
  void setCorporateName(String value) => corporateName = value;

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
  bool get retypePassValid => retypePass != null && retypePass == password;
  String? get retypePassError {
    if (!_showErrors || retypePassValid) {
      return null;
    } else {
      return 'Senhas não coincidem';
    }
  }

  // --Contato Responsavel
  @observable
  String? name;

  @observable
  String? email;

  @observable
  String? phone;

  @observable
  String? mobilePhone;

  @observable
  CompanySector? companySector;

  @action
  void setName(String value) => name = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setMobilePhone(String value) => mobilePhone = value;

  @action
  void setCompanySector(CompanySector? value) => companySector = value;

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

  @computed
  bool get mobilePhoneValid => mobilePhone != null && mobilePhone!.isPhoneValid;
  String? get mobilePhoneError {
    if (!_showErrors || phoneValid) {
      return null;
    } else if (mobilePhone == null || mobilePhone!.isEmpty) {
      return 'Celular Obrigatório';
    } else {
      return 'Celular muito curto';
    }
  }

  // --Endereço
  @observable
  String? zip;

  @observable
  String? city;

  @observable
  String? state;

  @observable
  String? street;

  @observable
  String? district;

  @observable
  String? number;

  @observable
  String? complement;

  @observable
  bool termsAccepted = false;

  @action
  void setZip(String value) => zip = value;

  @action
  void setCity(String value) => city = value;

  @action
  void setState(String value) => state = value;

  @action
  void setStreet(String value) => street = value;

  @action
  void setDistrict(String value) => district = value;

  @action
  void setNumber(String value) => number = value;

  @action
  void setComplement(String value) => complement = value;

  @action
  void setTermsAccepted(bool value) => termsAccepted = value;

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
  bool get isFormValidInicialData =>
      corporateNameValid &&
      fantasyNameValid &&
      cnpjValid &&
      passwordValid &&
      retypePassValid;

  @computed
  bool get isFormValidResponsibleContact =>
      nameValid && (phoneValid || mobilePhoneValid);

  @computed
  bool get isFormValidAddress => zipValid && termsAccepted;
  @action
  void invalidSendPressed() => _showErrors = true;

  @action
  void sendPressedNewPage() => _showErrors = false;

  @action
  Future<void> register() async {
    _status = SyndicateRegisterStateStatus.loading;
    try {
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      final syndicate = SyndicateModel(
        user: cnpj!.replaceAll(RegExp(r'[^0-9]'), ''),
        password: password!,
        profileType: 2,
        active: true,
        companyData: CompanyDataModel(
          corporateName: corporateName!,
          fantasyName: fantasyName!,
          cnpj: cnpj!.replaceAll(RegExp(r'[^0-9]'), ''),
        ),
        responsibleContact: ResponsibleContact(
          name: name!,
          email: email!,
          phone: phone != null ? phone!.replaceAll(RegExp(r'[^0-9]'), '') : '',
          mobile: mobilePhone != null
              ? mobilePhone!.replaceAll(RegExp(r'[^0-9]'), '')
              : '',
          sector: companySector!.acronym,
        ),
        address: AddressModel(
          zip: zip!.replaceAll(RegExp(r'[^0-9]'), ''),
          city: city!,
          state: state!,
          street: street!,
          district: district!,
          number: number ?? '',
          complement: complement ?? '',
        ),
      );
      await SyndicateService(dio).save(syndicate);
      await LoginService().execute(syndicate.user, syndicate.password, false);
      await GetIt.I<UserController>().getCurrentUser();
      _status = SyndicateRegisterStateStatus.saved;
    } catch (e, s) {
      log('Erro ao registrar usuário', error: e, stackTrace: s);
      _errorMessage = 'Erro ao registrar usuário';
      _status = SyndicateRegisterStateStatus.error;
    }
  }

  @action
  Future<void> searchZip(String zipFilter) async {
    _status = SyndicateRegisterStateStatus.loading;
    try {
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      final address = await ZipRepository(dio).getAddressFromZip(zipFilter);
      city = address!.cidade;
      state = address.estado;
      street = address.logradouro;
      district = address.bairro;
      _status = SyndicateRegisterStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar cep', error: e, stackTrace: s);
      _status = SyndicateRegisterStateStatus.error;
    }
  }
}
