import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/extensions/validator_extensions.dart';
import '../../../../models/user_model.dart';
import '../../../../repositories/zip/zip_repository.dart';
import '../../../../services/auth/auth_firebase_service_impl.dart';
import '../../auth_controller.dart';
import '../../user_controller.dart';
part 'worker_register_controller.g.dart';

enum WorkerRegisterStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class WorkerRegisterController = WorkerRegisterControllerBase
    with _$WorkerRegisterController;

abstract class WorkerRegisterControllerBase with Store {
  @readonly
  var _status = WorkerRegisterStateStatus.initial;

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
  String? email;

  @observable
  String? password;

  @observable
  String? retypePass;

  @action
  void setName(String value) => name = value;

  @action
  void setLastname(String value) => lastname = value;

  @action
  void setBirthdate(String value) => birthdate = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setRetypePass(String value) => retypePass = value;

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

  //--Dados Documentos
  @observable
  String? cpf;

  @observable
  String? rg;

  @action
  void setCPF(String value) => cpf = value;

  @action
  void setRG(String value) => rg = value;

  @action
  void invalidSendPressed() => _showErrors = true;

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
    _status = WorkerRegisterStateStatus.loading;
    try {
      final address = await ZipRepository().getAddressFromZip(zipFilter);
      city = address!.cidade.nome;
      state = address.estado.sigla;
      street = address.logradouro;
      district = address.bairro;
      _status = WorkerRegisterStateStatus.loaded;
    } catch (e, s) {
      log('Erro ao buscar cep', error: e, stackTrace: s);
      _status = WorkerRegisterStateStatus.error;
    }
  }

  @computed
  bool get isFormValid1 =>
      nameValid &&
      lastnameValid &&
      birthdateValid &&
      emailValid &&
      passwordValid &&
      retypePassValid;

  @computed
  bool get isFormValid2 => cpfValid && rgValid;

  @computed
  bool get isFormValid3 => zipValid && termsAccepted;

  @action
  Future<void> register() async {
    try {
      _status = WorkerRegisterStateStatus.loading;
      final address = Address(
        zip: zip!,
        city: city!,
        state: state!,
        street: street!,
        district: district!,
        number: number ?? '',
        complement: complement ?? '',
        referencePoint: referencePoint ?? '',
      );
      final user = UserModel(
        name: name!,
        lastname: lastname!,
        birthdate: birthdate!,
        email: email!,
        cpf: cpf!,
        rg: rg!,
        address: address,
        active: true,
      );

      final auth = await AuthFirebaseServiceImpl()
          .signup(email: email!, password: password!, user: user);
      GetIt.I<AuthController>().setAuth(auth);
      GetIt.I<UserController>().getCurrentUser(auth!.uid);
      _status = WorkerRegisterStateStatus.saved;
    } catch (e, s) {
      log('Erro ao registrar usuário', error: e, stackTrace: s);
      _errorMessage = 'Erro ao registrar usuário';
      _status = WorkerRegisterStateStatus.error;
    }
  }
}
