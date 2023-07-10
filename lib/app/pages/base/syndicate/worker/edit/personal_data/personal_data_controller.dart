import 'dart:developer';

import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../core/extensions/validator_extensions.dart';
import '../../../../../../core/ui/helpers/enums.dart';
import '../../../../../../models/worker_model.dart';
import '../../../../../../services/worker/worker_service.dart';
part 'personal_data_controller.g.dart';

enum PersonalDataStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class PersonalDataController = PersonalDataControllerBase
    with _$PersonalDataController;

abstract class PersonalDataControllerBase with Store {
  @readonly
  var _status = PersonalDataStateStatus.initial;

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
      _status = PersonalDataStateStatus.loading;
      final dt = DateFormat('dd/MM/yyyy').parse(birthdate!);
      final getData = _workerModel;
      final saveData = getData!.copyWith(
        name: name,
        lastname: lastname,
        personal: PersonalModel(
          surname: surname!,
          birthdate: DateFormat('yyyy-MM-dd').format(dt),
          motherName: motherName,
          maritalStatus: maritalStatus,
          phone: phone,
          email: email!,
        ),
      );
      await WorkerService().workerUpdate(saveData);
      _workerModel = saveData.copyWith(
        personal: saveData.personal
            .copyWith(birthdate: DateFormat('dd/MM/yyyy').format(dt)),
      );

      _status = PersonalDataStateStatus.saved;
    } on Exception catch (e, s) {
      log('Erro ao atualizar usuário', error: e, stackTrace: s);
      _errorMessage = 'Erro ao atualizar usuário';
      _status = PersonalDataStateStatus.error;
    }
  }

  @action
  Future<void> getUserData(WorkerModel worker) async {
    _status = PersonalDataStateStatus.loading;
    _workerModel = worker;
    name = worker.name;
    lastname = worker.lastname;
    surname = worker.personal.surname;
    birthdate = worker.personal.birthdate;
    motherName = worker.personal.motherName;
    maritalStatus = worker.personal.maritalStatus;
    phone = worker.personal.phone;
    email = worker.personal.email;
    _status = PersonalDataStateStatus.loaded;
  }
}
