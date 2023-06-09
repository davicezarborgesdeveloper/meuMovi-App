// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WorkerRegisterController on WorkerRegisterControllerBase, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: 'WorkerRegisterControllerBase.nameValid'))
          .value;
  Computed<bool>? _$lastnameValidComputed;

  @override
  bool get lastnameValid =>
      (_$lastnameValidComputed ??= Computed<bool>(() => super.lastnameValid,
              name: 'WorkerRegisterControllerBase.lastnameValid'))
          .value;
  Computed<bool>? _$birthdateValidComputed;

  @override
  bool get birthdateValid =>
      (_$birthdateValidComputed ??= Computed<bool>(() => super.birthdateValid,
              name: 'WorkerRegisterControllerBase.birthdateValid'))
          .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: 'WorkerRegisterControllerBase.emailValid'))
          .value;
  Computed<bool>? _$passwordValidComputed;

  @override
  bool get passwordValid =>
      (_$passwordValidComputed ??= Computed<bool>(() => super.passwordValid,
              name: 'WorkerRegisterControllerBase.passwordValid'))
          .value;
  Computed<bool>? _$retypePassValidComputed;

  @override
  bool get retypePassValid =>
      (_$retypePassValidComputed ??= Computed<bool>(() => super.retypePassValid,
              name: 'WorkerRegisterControllerBase.retypePassValid'))
          .value;
  Computed<bool>? _$cpfValidComputed;

  @override
  bool get cpfValid =>
      (_$cpfValidComputed ??= Computed<bool>(() => super.cpfValid,
              name: 'WorkerRegisterControllerBase.cpfValid'))
          .value;
  Computed<bool>? _$rgValidComputed;

  @override
  bool get rgValid => (_$rgValidComputed ??= Computed<bool>(() => super.rgValid,
          name: 'WorkerRegisterControllerBase.rgValid'))
      .value;
  Computed<bool>? _$zipValidComputed;

  @override
  bool get zipValid =>
      (_$zipValidComputed ??= Computed<bool>(() => super.zipValid,
              name: 'WorkerRegisterControllerBase.zipValid'))
          .value;
  Computed<bool>? _$isFormValid1Computed;

  @override
  bool get isFormValid1 =>
      (_$isFormValid1Computed ??= Computed<bool>(() => super.isFormValid1,
              name: 'WorkerRegisterControllerBase.isFormValid1'))
          .value;
  Computed<bool>? _$isFormValid2Computed;

  @override
  bool get isFormValid2 =>
      (_$isFormValid2Computed ??= Computed<bool>(() => super.isFormValid2,
              name: 'WorkerRegisterControllerBase.isFormValid2'))
          .value;
  Computed<bool>? _$isFormValid3Computed;

  @override
  bool get isFormValid3 =>
      (_$isFormValid3Computed ??= Computed<bool>(() => super.isFormValid3,
              name: 'WorkerRegisterControllerBase.isFormValid3'))
          .value;

  late final _$_statusAtom =
      Atom(name: 'WorkerRegisterControllerBase._status', context: context);

  WorkerRegisterStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  WorkerRegisterStateStatus get _status => status;

  @override
  set _status(WorkerRegisterStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'WorkerRegisterControllerBase._errorMessage', context: context);

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
      Atom(name: 'WorkerRegisterControllerBase._showErrors', context: context);

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

  late final _$nameAtom =
      Atom(name: 'WorkerRegisterControllerBase.name', context: context);

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
      Atom(name: 'WorkerRegisterControllerBase.lastname', context: context);

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

  late final _$birthdateAtom =
      Atom(name: 'WorkerRegisterControllerBase.birthdate', context: context);

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

  late final _$emailAtom =
      Atom(name: 'WorkerRegisterControllerBase.email', context: context);

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

  late final _$passwordAtom =
      Atom(name: 'WorkerRegisterControllerBase.password', context: context);

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

  late final _$retypePassAtom =
      Atom(name: 'WorkerRegisterControllerBase.retypePass', context: context);

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

  late final _$cpfAtom =
      Atom(name: 'WorkerRegisterControllerBase.cpf', context: context);

  @override
  String? get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String? value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  late final _$rgAtom =
      Atom(name: 'WorkerRegisterControllerBase.rg', context: context);

  @override
  String? get rg {
    _$rgAtom.reportRead();
    return super.rg;
  }

  @override
  set rg(String? value) {
    _$rgAtom.reportWrite(value, super.rg, () {
      super.rg = value;
    });
  }

  late final _$zipAtom =
      Atom(name: 'WorkerRegisterControllerBase.zip', context: context);

  @override
  String? get zip {
    _$zipAtom.reportRead();
    return super.zip;
  }

  @override
  set zip(String? value) {
    _$zipAtom.reportWrite(value, super.zip, () {
      super.zip = value;
    });
  }

  late final _$cityAtom =
      Atom(name: 'WorkerRegisterControllerBase.city', context: context);

  @override
  String? get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String? value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  late final _$stateAtom =
      Atom(name: 'WorkerRegisterControllerBase.state', context: context);

  @override
  String? get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(String? value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$streetAtom =
      Atom(name: 'WorkerRegisterControllerBase.street', context: context);

  @override
  String? get street {
    _$streetAtom.reportRead();
    return super.street;
  }

  @override
  set street(String? value) {
    _$streetAtom.reportWrite(value, super.street, () {
      super.street = value;
    });
  }

  late final _$districtAtom =
      Atom(name: 'WorkerRegisterControllerBase.district', context: context);

  @override
  String? get district {
    _$districtAtom.reportRead();
    return super.district;
  }

  @override
  set district(String? value) {
    _$districtAtom.reportWrite(value, super.district, () {
      super.district = value;
    });
  }

  late final _$numberAtom =
      Atom(name: 'WorkerRegisterControllerBase.number', context: context);

  @override
  String? get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(String? value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  late final _$complementAtom =
      Atom(name: 'WorkerRegisterControllerBase.complement', context: context);

  @override
  String? get complement {
    _$complementAtom.reportRead();
    return super.complement;
  }

  @override
  set complement(String? value) {
    _$complementAtom.reportWrite(value, super.complement, () {
      super.complement = value;
    });
  }

  late final _$referencePointAtom = Atom(
      name: 'WorkerRegisterControllerBase.referencePoint', context: context);

  @override
  String? get referencePoint {
    _$referencePointAtom.reportRead();
    return super.referencePoint;
  }

  @override
  set referencePoint(String? value) {
    _$referencePointAtom.reportWrite(value, super.referencePoint, () {
      super.referencePoint = value;
    });
  }

  late final _$termsAcceptedAtom = Atom(
      name: 'WorkerRegisterControllerBase.termsAccepted', context: context);

  @override
  bool get termsAccepted {
    _$termsAcceptedAtom.reportRead();
    return super.termsAccepted;
  }

  @override
  set termsAccepted(bool value) {
    _$termsAcceptedAtom.reportWrite(value, super.termsAccepted, () {
      super.termsAccepted = value;
    });
  }

  late final _$searchZipAsyncAction =
      AsyncAction('WorkerRegisterControllerBase.searchZip', context: context);

  @override
  Future<void> searchZip(String zipFilter) {
    return _$searchZipAsyncAction.run(() => super.searchZip(zipFilter));
  }

  late final _$registerAsyncAction =
      AsyncAction('WorkerRegisterControllerBase.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$WorkerRegisterControllerBaseActionController =
      ActionController(name: 'WorkerRegisterControllerBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$WorkerRegisterControllerBaseActionController
        .startAction(name: 'WorkerRegisterControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$WorkerRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setLastname(String value) {
    final _$actionInfo = _$WorkerRegisterControllerBaseActionController
        .startAction(name: 'WorkerRegisterControllerBase.setLastname');
    try {
      return super.setLastname(value);
    } finally {
      _$WorkerRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBirthdate(String value) {
    final _$actionInfo = _$WorkerRegisterControllerBaseActionController
        .startAction(name: 'WorkerRegisterControllerBase.setBirthdate');
    try {
      return super.setBirthdate(value);
    } finally {
      _$WorkerRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$WorkerRegisterControllerBaseActionController
        .startAction(name: 'WorkerRegisterControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$WorkerRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$WorkerRegisterControllerBaseActionController
        .startAction(name: 'WorkerRegisterControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$WorkerRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRetypePass(String value) {
    final _$actionInfo = _$WorkerRegisterControllerBaseActionController
        .startAction(name: 'WorkerRegisterControllerBase.setRetypePass');
    try {
      return super.setRetypePass(value);
    } finally {
      _$WorkerRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCPF(String value) {
    final _$actionInfo = _$WorkerRegisterControllerBaseActionController
        .startAction(name: 'WorkerRegisterControllerBase.setCPF');
    try {
      return super.setCPF(value);
    } finally {
      _$WorkerRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRG(String value) {
    final _$actionInfo = _$WorkerRegisterControllerBaseActionController
        .startAction(name: 'WorkerRegisterControllerBase.setRG');
    try {
      return super.setRG(value);
    } finally {
      _$WorkerRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$WorkerRegisterControllerBaseActionController
        .startAction(name: 'WorkerRegisterControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$WorkerRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setZip(String value) {
    final _$actionInfo = _$WorkerRegisterControllerBaseActionController
        .startAction(name: 'WorkerRegisterControllerBase.setZip');
    try {
      return super.setZip(value);
    } finally {
      _$WorkerRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCity(String value) {
    final _$actionInfo = _$WorkerRegisterControllerBaseActionController
        .startAction(name: 'WorkerRegisterControllerBase.setCity');
    try {
      return super.setCity(value);
    } finally {
      _$WorkerRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setState(String value) {
    final _$actionInfo = _$WorkerRegisterControllerBaseActionController
        .startAction(name: 'WorkerRegisterControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$WorkerRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStreet(String value) {
    final _$actionInfo = _$WorkerRegisterControllerBaseActionController
        .startAction(name: 'WorkerRegisterControllerBase.setStreet');
    try {
      return super.setStreet(value);
    } finally {
      _$WorkerRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDistrict(String value) {
    final _$actionInfo = _$WorkerRegisterControllerBaseActionController
        .startAction(name: 'WorkerRegisterControllerBase.setDistrict');
    try {
      return super.setDistrict(value);
    } finally {
      _$WorkerRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumber(String value) {
    final _$actionInfo = _$WorkerRegisterControllerBaseActionController
        .startAction(name: 'WorkerRegisterControllerBase.setNumber');
    try {
      return super.setNumber(value);
    } finally {
      _$WorkerRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComplement(String value) {
    final _$actionInfo = _$WorkerRegisterControllerBaseActionController
        .startAction(name: 'WorkerRegisterControllerBase.setComplement');
    try {
      return super.setComplement(value);
    } finally {
      _$WorkerRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReferencePoint(String value) {
    final _$actionInfo = _$WorkerRegisterControllerBaseActionController
        .startAction(name: 'WorkerRegisterControllerBase.setReferencePoint');
    try {
      return super.setReferencePoint(value);
    } finally {
      _$WorkerRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTermsAccepted(bool value) {
    final _$actionInfo = _$WorkerRegisterControllerBaseActionController
        .startAction(name: 'WorkerRegisterControllerBase.setTermsAccepted');
    try {
      return super.setTermsAccepted(value);
    } finally {
      _$WorkerRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
lastname: ${lastname},
birthdate: ${birthdate},
email: ${email},
password: ${password},
retypePass: ${retypePass},
cpf: ${cpf},
rg: ${rg},
zip: ${zip},
city: ${city},
state: ${state},
street: ${street},
district: ${district},
number: ${number},
complement: ${complement},
referencePoint: ${referencePoint},
termsAccepted: ${termsAccepted},
nameValid: ${nameValid},
lastnameValid: ${lastnameValid},
birthdateValid: ${birthdateValid},
emailValid: ${emailValid},
passwordValid: ${passwordValid},
retypePassValid: ${retypePassValid},
cpfValid: ${cpfValid},
rgValid: ${rgValid},
zipValid: ${zipValid},
isFormValid1: ${isFormValid1},
isFormValid2: ${isFormValid2},
isFormValid3: ${isFormValid3}
    ''';
  }
}
