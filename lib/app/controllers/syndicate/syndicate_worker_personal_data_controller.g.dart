// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syndicate_worker_personal_data_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SyndicateWorkerPersonalDataController
    on SyndicateWorkerPersonalDataControllerBase, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: 'SyndicateWorkerPersonalDataControllerBase.nameValid'))
          .value;
  Computed<bool>? _$lastnameValidComputed;

  @override
  bool get lastnameValid =>
      (_$lastnameValidComputed ??= Computed<bool>(() => super.lastnameValid,
              name: 'SyndicateWorkerPersonalDataControllerBase.lastnameValid'))
          .value;
  Computed<bool>? _$surnameValidComputed;

  @override
  bool get surnameValid =>
      (_$surnameValidComputed ??= Computed<bool>(() => super.surnameValid,
              name: 'SyndicateWorkerPersonalDataControllerBase.surnameValid'))
          .value;
  Computed<bool>? _$birthdateValidComputed;

  @override
  bool get birthdateValid =>
      (_$birthdateValidComputed ??= Computed<bool>(() => super.birthdateValid,
              name: 'SyndicateWorkerPersonalDataControllerBase.birthdateValid'))
          .value;
  Computed<bool>? _$motheNameValidComputed;

  @override
  bool get motheNameValid =>
      (_$motheNameValidComputed ??= Computed<bool>(() => super.motheNameValid,
              name: 'SyndicateWorkerPersonalDataControllerBase.motheNameValid'))
          .value;
  Computed<bool>? _$maritalStatusValidComputed;

  @override
  bool get maritalStatusValid => (_$maritalStatusValidComputed ??= Computed<
              bool>(() => super.maritalStatusValid,
          name: 'SyndicateWorkerPersonalDataControllerBase.maritalStatusValid'))
      .value;
  Computed<bool>? _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: 'SyndicateWorkerPersonalDataControllerBase.phoneValid'))
          .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: 'SyndicateWorkerPersonalDataControllerBase.emailValid'))
          .value;
  Computed<bool>? _$passwordValidComputed;

  @override
  bool get passwordValid =>
      (_$passwordValidComputed ??= Computed<bool>(() => super.passwordValid,
              name: 'SyndicateWorkerPersonalDataControllerBase.passwordValid'))
          .value;
  Computed<bool>? _$retypePassValidComputed;

  @override
  bool get retypePassValid => (_$retypePassValidComputed ??= Computed<bool>(
          () => super.retypePassValid,
          name: 'SyndicateWorkerPersonalDataControllerBase.retypePassValid'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'SyndicateWorkerPersonalDataControllerBase.isFormValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: 'SyndicateWorkerPersonalDataControllerBase.sendPressed'))
          .value;

  late final _$_statusAtom = Atom(
      name: 'SyndicateWorkerPersonalDataControllerBase._status',
      context: context);

  SyndicateWorkerPersonalDataStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  SyndicateWorkerPersonalDataStateStatus get _status => status;

  @override
  set _status(SyndicateWorkerPersonalDataStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'SyndicateWorkerPersonalDataControllerBase._errorMessage',
      context: context);

  String? get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String? get _errorMessage => errorMessage;

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$_showErrorsAtom = Atom(
      name: 'SyndicateWorkerPersonalDataControllerBase._showErrors',
      context: context);

  bool get showErrors {
    _$_showErrorsAtom.reportRead();
    return super._showErrors;
  }

  @override
  bool get _showErrors => showErrors;

  @override
  set _showErrors(bool value) {
    _$_showErrorsAtom.reportWrite(value, super._showErrors, () {
      super._showErrors = value;
    });
  }

  late final _$_workerModelAtom = Atom(
      name: 'SyndicateWorkerPersonalDataControllerBase._workerModel',
      context: context);

  WorkerModel? get workerModel {
    _$_workerModelAtom.reportRead();
    return super._workerModel;
  }

  @override
  WorkerModel? get _workerModel => workerModel;

  @override
  set _workerModel(WorkerModel? value) {
    _$_workerModelAtom.reportWrite(value, super._workerModel, () {
      super._workerModel = value;
    });
  }

  late final _$nameAtom = Atom(
      name: 'SyndicateWorkerPersonalDataControllerBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$lastnameAtom = Atom(
      name: 'SyndicateWorkerPersonalDataControllerBase.lastname',
      context: context);

  @override
  String? get lastname {
    _$lastnameAtom.reportRead();
    return super.lastname;
  }

  @override
  set lastname(String? value) {
    _$lastnameAtom.reportWrite(value, super.lastname, () {
      super.lastname = value;
    });
  }

  late final _$surnameAtom = Atom(
      name: 'SyndicateWorkerPersonalDataControllerBase.surname',
      context: context);

  @override
  String? get surname {
    _$surnameAtom.reportRead();
    return super.surname;
  }

  @override
  set surname(String? value) {
    _$surnameAtom.reportWrite(value, super.surname, () {
      super.surname = value;
    });
  }

  late final _$birthdateAtom = Atom(
      name: 'SyndicateWorkerPersonalDataControllerBase.birthdate',
      context: context);

  @override
  String? get birthdate {
    _$birthdateAtom.reportRead();
    return super.birthdate;
  }

  @override
  set birthdate(String? value) {
    _$birthdateAtom.reportWrite(value, super.birthdate, () {
      super.birthdate = value;
    });
  }

  late final _$motherNameAtom = Atom(
      name: 'SyndicateWorkerPersonalDataControllerBase.motherName',
      context: context);

  @override
  String? get motherName {
    _$motherNameAtom.reportRead();
    return super.motherName;
  }

  @override
  set motherName(String? value) {
    _$motherNameAtom.reportWrite(value, super.motherName, () {
      super.motherName = value;
    });
  }

  late final _$maritalStatusAtom = Atom(
      name: 'SyndicateWorkerPersonalDataControllerBase.maritalStatus',
      context: context);

  @override
  MaritalStatus? get maritalStatus {
    _$maritalStatusAtom.reportRead();
    return super.maritalStatus;
  }

  @override
  set maritalStatus(MaritalStatus? value) {
    _$maritalStatusAtom.reportWrite(value, super.maritalStatus, () {
      super.maritalStatus = value;
    });
  }

  late final _$phoneAtom = Atom(
      name: 'SyndicateWorkerPersonalDataControllerBase.phone',
      context: context);

  @override
  String? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$emailAtom = Atom(
      name: 'SyndicateWorkerPersonalDataControllerBase.email',
      context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$passwordAtom = Atom(
      name: 'SyndicateWorkerPersonalDataControllerBase.password',
      context: context);

  @override
  String? get password {
    _$passwordAtom.reportRead();
    return super.password;
  }

  @override
  set password(String? value) {
    _$passwordAtom.reportWrite(value, super.password, () {
      super.password = value;
    });
  }

  late final _$retypePassAtom = Atom(
      name: 'SyndicateWorkerPersonalDataControllerBase.retypePass',
      context: context);

  @override
  String? get retypePass {
    _$retypePassAtom.reportRead();
    return super.retypePass;
  }

  @override
  set retypePass(String? value) {
    _$retypePassAtom.reportWrite(value, super.retypePass, () {
      super.retypePass = value;
    });
  }

  late final _$saveAsyncAction = AsyncAction(
      'SyndicateWorkerPersonalDataControllerBase.save',
      context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$getUserDataAsyncAction = AsyncAction(
      'SyndicateWorkerPersonalDataControllerBase.getUserData',
      context: context);

  @override
  Future<void> getUserData(WorkerModel worker) {
    return _$getUserDataAsyncAction.run(() => super.getUserData(worker));
  }

  late final _$SyndicateWorkerPersonalDataControllerBaseActionController =
      ActionController(
          name: 'SyndicateWorkerPersonalDataControllerBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo =
        _$SyndicateWorkerPersonalDataControllerBaseActionController.startAction(
            name: 'SyndicateWorkerPersonalDataControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$SyndicateWorkerPersonalDataControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setLastname(String value) {
    final _$actionInfo =
        _$SyndicateWorkerPersonalDataControllerBaseActionController.startAction(
            name: 'SyndicateWorkerPersonalDataControllerBase.setLastname');
    try {
      return super.setLastname(value);
    } finally {
      _$SyndicateWorkerPersonalDataControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setSurname(String value) {
    final _$actionInfo =
        _$SyndicateWorkerPersonalDataControllerBaseActionController.startAction(
            name: 'SyndicateWorkerPersonalDataControllerBase.setSurname');
    try {
      return super.setSurname(value);
    } finally {
      _$SyndicateWorkerPersonalDataControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setBirthdate(String value) {
    final _$actionInfo =
        _$SyndicateWorkerPersonalDataControllerBaseActionController.startAction(
            name: 'SyndicateWorkerPersonalDataControllerBase.setBirthdate');
    try {
      return super.setBirthdate(value);
    } finally {
      _$SyndicateWorkerPersonalDataControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setMotherName(String value) {
    final _$actionInfo =
        _$SyndicateWorkerPersonalDataControllerBaseActionController.startAction(
            name: 'SyndicateWorkerPersonalDataControllerBase.setMotherName');
    try {
      return super.setMotherName(value);
    } finally {
      _$SyndicateWorkerPersonalDataControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setMaritalStatus(MaritalStatus? value) {
    final _$actionInfo =
        _$SyndicateWorkerPersonalDataControllerBaseActionController.startAction(
            name: 'SyndicateWorkerPersonalDataControllerBase.setMaritalStatus');
    try {
      return super.setMaritalStatus(value);
    } finally {
      _$SyndicateWorkerPersonalDataControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo =
        _$SyndicateWorkerPersonalDataControllerBaseActionController.startAction(
            name: 'SyndicateWorkerPersonalDataControllerBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$SyndicateWorkerPersonalDataControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo =
        _$SyndicateWorkerPersonalDataControllerBaseActionController.startAction(
            name: 'SyndicateWorkerPersonalDataControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$SyndicateWorkerPersonalDataControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo =
        _$SyndicateWorkerPersonalDataControllerBaseActionController.startAction(
            name: 'SyndicateWorkerPersonalDataControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$SyndicateWorkerPersonalDataControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setRetypePass(String value) {
    final _$actionInfo =
        _$SyndicateWorkerPersonalDataControllerBaseActionController.startAction(
            name: 'SyndicateWorkerPersonalDataControllerBase.setRetypePass');
    try {
      return super.setRetypePass(value);
    } finally {
      _$SyndicateWorkerPersonalDataControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo =
        _$SyndicateWorkerPersonalDataControllerBaseActionController.startAction(
            name:
                'SyndicateWorkerPersonalDataControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$SyndicateWorkerPersonalDataControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
lastname: ${lastname},
surname: ${surname},
birthdate: ${birthdate},
motherName: ${motherName},
maritalStatus: ${maritalStatus},
phone: ${phone},
email: ${email},
password: ${password},
retypePass: ${retypePass},
nameValid: ${nameValid},
lastnameValid: ${lastnameValid},
surnameValid: ${surnameValid},
birthdateValid: ${birthdateValid},
motheNameValid: ${motheNameValid},
maritalStatusValid: ${maritalStatusValid},
phoneValid: ${phoneValid},
emailValid: ${emailValid},
passwordValid: ${passwordValid},
retypePassValid: ${retypePassValid},
isFormValid: ${isFormValid},
sendPressed: ${sendPressed}
    ''';
  }
}
