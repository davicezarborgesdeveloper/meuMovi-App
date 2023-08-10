import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../core/extensions/formatter_extensions.dart';
import '../core/extensions/validator_extensions.dart';
import '../core/rest_client/custom_dio.dart';
import '../core/ui/helpers/enums.dart';
import '../models/worker_model.dart';
import '../services/worker/worker_service.dart';
import 'http_controller.dart';
import 'user_controller.dart';
part 'profile_worker_personal_data_controller.g.dart';

enum ProfileWorkerPersonalStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class ProfileWorkerPersonalDataController = ProfileWorkerPersonalDataControllerBase
    with _$ProfileWorkerPersonalDataController;

abstract class ProfileWorkerPersonalDataControllerBase with Store {
  @readonly
  var _status = ProfileWorkerPersonalStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  @readonly
  WorkerModel? _workerModel;

  @observable
  String? name;

  @observable
  String? lastname;

  @observable
  String? surname;

  @observable
  String? birthdate;

  @observable
  String? motherName;

  @observable
  MaritalStatus? maritalStatus;

  @observable
  String? phone;

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
  void setSurname(String value) => surname = value;

  @action
  void setBirthdate(String value) => birthdate = value;

  @action
  void setMotherName(String value) => motherName = value;

  @action
  void setMaritalStatus(MaritalStatus? value) => maritalStatus = value;

  @action
  void setPhone(String value) => phone = value;

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
  bool get surnameValid => surname != null && surname!.length > 3;
  String? get surnameError {
    if (!_showErrors || surnameValid) {
      return null;
    } else if (surname == null || surname!.isEmpty) {
      return 'Apelido Obrigatório';
    } else {
      return 'Apelido muito curto';
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
  bool get motheNameValid => motherName != null && motherName!.length > 3;
  String? get motheNameError {
    if (!_showErrors || motheNameValid) {
      return null;
    } else if (motherName == null || motherName!.isEmpty) {
      return 'Nome da mãe Obrigatório';
    } else {
      return 'Nome da mãe muito curto';
    }
  }

  @computed
  bool get maritalStatusValid => maritalStatus != null;
  String? get maritalStatusError {
    if (!_showErrors || maritalStatusValid) {
      return null;
    } else {
      return 'Estado Civil Obrigatório';
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
  bool get emailValid => email != null && email!.length > 3;
  String? get emailError {
    if (!_showErrors || emailValid) {
      return null;
    } else if (email == null || email!.isEmpty) {
      return 'E-mail Obrigatório';
    } else {
      return 'E-mail muito curto';
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

  @computed
  bool get isFormValid =>
      nameValid &&
      lastnameValid &&
      surnameValid &&
      birthdateValid &&
      motheNameValid &&
      maritalStatusValid &&
      emailValid &&
      phoneValid;

  @action
  void invalidSendPressed() => _showErrors = true;

  @computed
  dynamic get sendPressed => isFormValid ? save : null;

  @action
  Future<void> save() async {
    try {
      _status = ProfileWorkerPersonalStateStatus.loading;
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      final data = _workerModel;
      var user = data!.copyWith(
        name: name,
        lastname: lastname,
        personal: PersonalModel(
          surname: surname!,
          birthdate: birthdate!,
          motherName: motherName,
          maritalStatus: maritalStatus,
          phone: phone!.replaceAll(RegExp(r'[^0-9]'), ''),
          email: email!,
        ),
      );
      if (passwordValid && retypePassValid) {
        user = user.copyWith(password: password!);
      }
      _workerModel = user;
      await WorkerService(dio).update(user, 'PD');
      GetIt.I<UserController>().setWorker(user);
      _status = ProfileWorkerPersonalStateStatus.saved;
    } on Exception catch (e, s) {
      log('Erro ao atualizar usuário', error: e, stackTrace: s);
      _errorMessage = 'Erro ao atualizar usuário';
      _status = ProfileWorkerPersonalStateStatus.error;
    }
  }

  @action
  Future<void> getUserData(WorkerModel worker) async {
    _status = ProfileWorkerPersonalStateStatus.loading;
    _workerModel = worker;
    name = worker.name;
    lastname = worker.lastname;
    surname = worker.personal.surname;
    birthdate = worker.personal.birthdate;
    motherName = worker.personal.motherName;
    maritalStatus = worker.personal.maritalStatus;
    phone = worker.personal.phone!.formattedPhone;
    email = worker.personal.email;
    _status = ProfileWorkerPersonalStateStatus.loaded;
  }
}
