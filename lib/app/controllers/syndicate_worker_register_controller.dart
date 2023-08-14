import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../core/extensions/validator_extensions.dart';
import '../core/rest_client/custom_dio.dart';
import '../models/address_model.dart';
import '../models/worker_model.dart';
import '../repositories/zip/zip_repository.dart';
import '../services/worker/worker_service.dart';
import 'http_controller.dart';
part 'syndicate_worker_register_controller.g.dart';

enum SyndicateWorkerRegisterStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class SyndicateWorkerRegisterController = SyndicateWorkerRegisterControllerBase
    with _$SyndicateWorkerRegisterController;

abstract class SyndicateWorkerRegisterControllerBase with Store {
  @readonly
  var _status = SyndicateWorkerRegisterStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  //--Dados Pessoais

  @observable
  String? name;

  @observable
  String? lastname;

  @observable
  String? birthdate;

  @observable
  String? phone;

  @observable
  String? email;

  @action
  void setName(String value) => name = value;

  @action
  void setLastname(String value) => lastname = value;

  @action
  void setBirthdate(String value) => birthdate = value;

  @action
  void setPhone(String value) => phone = value;

  @action
  void setEmail(String value) => email = value;

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
  bool get lastnameValid => lastname != null && lastname!.length > 3;
  String? get lastnameError {
    if (!_showErrors || lastnameValid) {
      return null;
    } else if (lastname == null || lastname!.isEmpty) {
      return 'Sobrenome Obrigatório';
    } else {
      return 'Sobrenome muito curto';
    }
  }

  @computed
  bool get birthdateValid => birthdate != null && birthdate!.isNotEmpty;
  String? get birthdateError {
    if (!_showErrors || birthdateValid) {
      return null;
    } else {
      return 'Data de nascimento obrigatória';
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

  //--Dados Documentos
  @observable
  String? cpf;

  @observable
  String? rg;

  @observable
  EmployeerModel? employeer;

  @action
  void setCPF(String value) => cpf = value;

  @action
  void setRG(String value) => rg = value;

  @action
  void setEmployeer(EmployeerModel? value) => employeer = value;

  @action
  void invalidSendPressed() => _showErrors = true;

  @action
  void sendPressedNewPage() => _showErrors = false;

  @computed
  bool get cpfValid => cpf != null && cpf!.isCPFValid;
  String? get cpfError {
    if (!_showErrors || cpfValid) {
      return null;
    } else if (cpf == null || cpf!.isEmpty) {
      return 'CPF Obrigatório';
    } else if (!cpf!.isCPFValid) {
      return 'CPF inválido';
    } else {
      return 'CPF muito curto';
    }
  }

  @computed
  bool get rgValid => rg != null && rg!.length > 3;
  String? get rgError {
    if (!_showErrors || rgValid) {
      return null;
    } else if (rg == null || rg!.trim().isEmpty) {
      return 'RG Obrigatório';
    } else {
      return 'RG muito curto ';
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

  //--Dados Endereço
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
  String? referencePoint;

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
  void setReferencePoint(String value) => referencePoint = value;

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

  @action
  Future<void> searchZip(String zipFilter) async {
    _status = SyndicateWorkerRegisterStateStatus.loading;
    try {
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      final address = await ZipRepository(dio).getAddressFromZip(zipFilter);
      city = address!.cidade;
      state = address.estado;
      street = address.logradouro;
      district = address.bairro;
      _status = SyndicateWorkerRegisterStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar cep', error: e, stackTrace: s);
      _status = SyndicateWorkerRegisterStateStatus.error;
    }
  }

  @computed
  bool get isFormValidPersonal =>
      nameValid && lastnameValid && birthdateValid && phoneValid && emailValid;

  @computed
  bool get isFormValidDocuments => cpfValid && rgValid;

  @computed
  bool get isFormValidAddress => zipValid && termsAccepted;

  @action
  Future<void> register() async {
    try {
      _status = SyndicateWorkerRegisterStateStatus.loading;
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      final dt = DateFormat('dd/MM/yyyy').parse(birthdate!);
      final worker = WorkerModel(
        user: cpf!.replaceAll(RegExp(r'[^0-9]'), ''),
        password: 'meumovi1234',
        profileType: 3,
        active: true,
        name: name!,
        lastname: lastname!,
        documents: DocumentsModel(
          cpf: cpf!.replaceAll(RegExp(r'[^0-9]'), ''),
          rg: rg!.replaceAll(RegExp(r'[^0-9]'), ''),
          employeer: employeer,
        ),
        personal: PersonalModel(
          birthdate: DateFormat('yyyy-MM-dd').format(dt),
          email: email!,
          phone: phone!.replaceAll(RegExp(r'[^0-9]'), ''),
        ),
        address: AddressModel(
          zip: zip!.replaceAll(RegExp(r'[^0-9]'), ''),
          city: city!,
          state: state!,
          street: street!,
          district: district!,
          number: number ?? '',
          complement: complement ?? '',
          referencePoint: referencePoint ?? '',
        ),
      );
      await WorkerService(dio).save(worker);
      _status = SyndicateWorkerRegisterStateStatus.saved;
    } catch (e, s) {
      log('Erro ao registrar usuário', error: e, stackTrace: s);
      _errorMessage = 'Erro ao registrar usuário';
      _status = SyndicateWorkerRegisterStateStatus.error;
    }
  }
}