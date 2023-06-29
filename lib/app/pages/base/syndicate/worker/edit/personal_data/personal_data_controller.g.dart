// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personal_data_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$PersonalDataController on PersonalDataControllerBase, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: 'PersonalDataControllerBase.nameValid'))
          .value;
  Computed<bool>? _$lastnameValidComputed;

  @override
  bool get lastnameValid =>
      (_$lastnameValidComputed ??= Computed<bool>(() => super.lastnameValid,
              name: 'PersonalDataControllerBase.lastnameValid'))
          .value;
  Computed<bool>? _$surnameValidComputed;

  @override
  bool get surnameValid =>
      (_$surnameValidComputed ??= Computed<bool>(() => super.surnameValid,
              name: 'PersonalDataControllerBase.surnameValid'))
          .value;
  Computed<bool>? _$birthdateValidComputed;

  @override
  bool get birthdateValid =>
      (_$birthdateValidComputed ??= Computed<bool>(() => super.birthdateValid,
              name: 'PersonalDataControllerBase.birthdateValid'))
          .value;
  Computed<bool>? _$motheNameValidComputed;

  @override
  bool get motheNameValid =>
      (_$motheNameValidComputed ??= Computed<bool>(() => super.motheNameValid,
              name: 'PersonalDataControllerBase.motheNameValid'))
          .value;
  Computed<bool>? _$maritalStatusValidComputed;

  @override
  bool get maritalStatusValid => (_$maritalStatusValidComputed ??=
          Computed<bool>(() => super.maritalStatusValid,
              name: 'PersonalDataControllerBase.maritalStatusValid'))
      .value;
  Computed<bool>? _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: 'PersonalDataControllerBase.phoneValid'))
          .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: 'PersonalDataControllerBase.emailValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'PersonalDataControllerBase.isFormValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: 'PersonalDataControllerBase.sendPressed'))
          .value;

  late final _$_statusAtom =
      Atom(name: 'PersonalDataControllerBase._status', context: context);

  PersonalDataStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  PersonalDataStateStatus get _status => status;

  @override
  set _status(PersonalDataStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'PersonalDataControllerBase._errorMessage', context: context);

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

  late final _$_showErrorsAtom =
      Atom(name: 'PersonalDataControllerBase._showErrors', context: context);

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

  late final _$_workerModelAtom =
      Atom(name: 'PersonalDataControllerBase._workerModel', context: context);

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

  late final _$nameAtom =
      Atom(name: 'PersonalDataControllerBase.name', context: context);

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

  late final _$lastnameAtom =
      Atom(name: 'PersonalDataControllerBase.lastname', context: context);

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

  late final _$surnameAtom =
      Atom(name: 'PersonalDataControllerBase.surname', context: context);

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

  late final _$birthdateAtom =
      Atom(name: 'PersonalDataControllerBase.birthdate', context: context);

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

  late final _$motherNameAtom =
      Atom(name: 'PersonalDataControllerBase.motherName', context: context);

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

  late final _$maritalStatusAtom =
      Atom(name: 'PersonalDataControllerBase.maritalStatus', context: context);

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

  late final _$phoneAtom =
      Atom(name: 'PersonalDataControllerBase.phone', context: context);

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

  late final _$emailAtom =
      Atom(name: 'PersonalDataControllerBase.email', context: context);

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

  late final _$saveAsyncAction =
      AsyncAction('PersonalDataControllerBase.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$getUserDataAsyncAction =
      AsyncAction('PersonalDataControllerBase.getUserData', context: context);

  @override
  Future<void> getUserData(WorkerModel worker) {
    return _$getUserDataAsyncAction.run(() => super.getUserData(worker));
  }

  late final _$PersonalDataControllerBaseActionController =
      ActionController(name: 'PersonalDataControllerBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$PersonalDataControllerBaseActionController
        .startAction(name: 'PersonalDataControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$PersonalDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLastname(String value) {
    final _$actionInfo = _$PersonalDataControllerBaseActionController
        .startAction(name: 'PersonalDataControllerBase.setLastname');
    try {
      return super.setLastname(value);
    } finally {
      _$PersonalDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSurname(String value) {
    final _$actionInfo = _$PersonalDataControllerBaseActionController
        .startAction(name: 'PersonalDataControllerBase.setSurname');
    try {
      return super.setSurname(value);
    } finally {
      _$PersonalDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBirthdate(String value) {
    final _$actionInfo = _$PersonalDataControllerBaseActionController
        .startAction(name: 'PersonalDataControllerBase.setBirthdate');
    try {
      return super.setBirthdate(value);
    } finally {
      _$PersonalDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMotherName(String value) {
    final _$actionInfo = _$PersonalDataControllerBaseActionController
        .startAction(name: 'PersonalDataControllerBase.setMotherName');
    try {
      return super.setMotherName(value);
    } finally {
      _$PersonalDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMaritalStatus(MaritalStatus? value) {
    final _$actionInfo = _$PersonalDataControllerBaseActionController
        .startAction(name: 'PersonalDataControllerBase.setMaritalStatus');
    try {
      return super.setMaritalStatus(value);
    } finally {
      _$PersonalDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$PersonalDataControllerBaseActionController
        .startAction(name: 'PersonalDataControllerBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$PersonalDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$PersonalDataControllerBaseActionController
        .startAction(name: 'PersonalDataControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$PersonalDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$PersonalDataControllerBaseActionController
        .startAction(name: 'PersonalDataControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$PersonalDataControllerBaseActionController.endAction(_$actionInfo);
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
nameValid: ${nameValid},
lastnameValid: ${lastnameValid},
surnameValid: ${surnameValid},
birthdateValid: ${birthdateValid},
motheNameValid: ${motheNameValid},
maritalStatusValid: ${maritalStatusValid},
phoneValid: ${phoneValid},
emailValid: ${emailValid},
isFormValid: ${isFormValid},
sendPressed: ${sendPressed}
    ''';
  }
}
