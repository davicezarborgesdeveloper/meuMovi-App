// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_taker_signup_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ServiceTakerSignupController
    on ServiceTakerSignupControllerBase, Store {
  Computed<bool>? _$companyNameValidComputed;

  @override
  bool get companyNameValid => (_$companyNameValidComputed ??= Computed<bool>(
          () => super.companyNameValid,
          name: 'ServiceTakerSignupControllerBase.companyNameValid'))
      .value;
  Computed<bool>? _$fantasyNameValidComputed;

  @override
  bool get fantasyNameValid => (_$fantasyNameValidComputed ??= Computed<bool>(
          () => super.fantasyNameValid,
          name: 'ServiceTakerSignupControllerBase.fantasyNameValid'))
      .value;
  Computed<bool>? _$cnpjValidComputed;

  @override
  bool get cnpjValid =>
      (_$cnpjValidComputed ??= Computed<bool>(() => super.cnpjValid,
              name: 'ServiceTakerSignupControllerBase.cnpjValid'))
          .value;
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: 'ServiceTakerSignupControllerBase.nameValid'))
          .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: 'ServiceTakerSignupControllerBase.emailValid'))
          .value;
  Computed<bool>? _$zipValidComputed;

  @override
  bool get zipValid =>
      (_$zipValidComputed ??= Computed<bool>(() => super.zipValid,
              name: 'ServiceTakerSignupControllerBase.zipValid'))
          .value;
  Computed<bool>? _$passwordValidComputed;

  @override
  bool get passwordValid =>
      (_$passwordValidComputed ??= Computed<bool>(() => super.passwordValid,
              name: 'ServiceTakerSignupControllerBase.passwordValid'))
          .value;
  Computed<bool>? _$retypePassValidComputed;

  @override
  bool get retypePassValid =>
      (_$retypePassValidComputed ??= Computed<bool>(() => super.retypePassValid,
              name: 'ServiceTakerSignupControllerBase.retypePassValid'))
          .value;
  Computed<bool>? _$isFormValidSignupComputed;

  @override
  bool get isFormValidSignup => (_$isFormValidSignupComputed ??= Computed<bool>(
          () => super.isFormValidSignup,
          name: 'ServiceTakerSignupControllerBase.isFormValidSignup'))
      .value;
  Computed<bool>? _$isFormValidRegisterComputed;

  @override
  bool get isFormValidRegister => (_$isFormValidRegisterComputed ??=
          Computed<bool>(() => super.isFormValidRegister,
              name: 'ServiceTakerSignupControllerBase.isFormValidRegister'))
      .value;
  Computed<dynamic>? _$sendPressedSignupComputed;

  @override
  dynamic get sendPressedSignup => (_$sendPressedSignupComputed ??=
          Computed<dynamic>(() => super.sendPressedSignup,
              name: 'ServiceTakerSignupControllerBase.sendPressedSignup'))
      .value;
  Computed<dynamic>? _$sendPressedRegisterComputed;

  @override
  dynamic get sendPressedRegister => (_$sendPressedRegisterComputed ??=
          Computed<dynamic>(() => super.sendPressedRegister,
              name: 'ServiceTakerSignupControllerBase.sendPressedRegister'))
      .value;

  late final _$_statusAtom =
      Atom(name: 'ServiceTakerSignupControllerBase._status', context: context);

  ServiceTakerSignupStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  ServiceTakerSignupStateStatus get _status => status;

  @override
  set _status(ServiceTakerSignupStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'ServiceTakerSignupControllerBase._errorMessage', context: context);

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
      name: 'ServiceTakerSignupControllerBase._showErrors', context: context);

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

  late final _$companyNameAtom = Atom(
      name: 'ServiceTakerSignupControllerBase.companyName', context: context);

  @override
  String? get companyName {
    _$companyNameAtom.reportRead();
    return super.companyName;
  }

  @override
  set companyName(String? value) {
    _$companyNameAtom.reportWrite(value, super.companyName, () {
      super.companyName = value;
    });
  }

  late final _$fantasyNameAtom = Atom(
      name: 'ServiceTakerSignupControllerBase.fantasyName', context: context);

  @override
  String? get fantasyName {
    _$fantasyNameAtom.reportRead();
    return super.fantasyName;
  }

  @override
  set fantasyName(String? value) {
    _$fantasyNameAtom.reportWrite(value, super.fantasyName, () {
      super.fantasyName = value;
    });
  }

  late final _$employeerAtom = Atom(
      name: 'ServiceTakerSignupControllerBase.employeer', context: context);

  @override
  EmployeerModel? get employeer {
    _$employeerAtom.reportRead();
    return super.employeer;
  }

  @override
  set employeer(EmployeerModel? value) {
    _$employeerAtom.reportWrite(value, super.employeer, () {
      super.employeer = value;
    });
  }

  late final _$cnpjAtom =
      Atom(name: 'ServiceTakerSignupControllerBase.cnpj', context: context);

  @override
  String? get cnpj {
    _$cnpjAtom.reportRead();
    return super.cnpj;
  }

  @override
  set cnpj(String? value) {
    _$cnpjAtom.reportWrite(value, super.cnpj, () {
      super.cnpj = value;
    });
  }

  late final _$nameAtom =
      Atom(name: 'ServiceTakerSignupControllerBase.name', context: context);

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

  late final _$phoneAtom =
      Atom(name: 'ServiceTakerSignupControllerBase.phone', context: context);

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
      Atom(name: 'ServiceTakerSignupControllerBase.email', context: context);

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

  late final _$zipAtom =
      Atom(name: 'ServiceTakerSignupControllerBase.zip', context: context);

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

  late final _$numberAtom =
      Atom(name: 'ServiceTakerSignupControllerBase.number', context: context);

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

  late final _$passwordAtom =
      Atom(name: 'ServiceTakerSignupControllerBase.password', context: context);

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
      name: 'ServiceTakerSignupControllerBase.retypePass', context: context);

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

  late final _$_cityAtom =
      Atom(name: 'ServiceTakerSignupControllerBase._city', context: context);

  String? get city {
    _$_cityAtom.reportRead();
    return super._city;
  }

  @override
  String? get _city => city;

  @override
  set _city(String? value) {
    _$_cityAtom.reportWrite(value, super._city, () {
      super._city = value;
    });
  }

  late final _$termsAcceptedAtom = Atom(
      name: 'ServiceTakerSignupControllerBase.termsAccepted', context: context);

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

  late final _$setDefaultPasswordAsyncAction = AsyncAction(
      'ServiceTakerSignupControllerBase.setDefaultPassword',
      context: context);

  @override
  Future<void> setDefaultPassword() {
    return _$setDefaultPasswordAsyncAction
        .run(() => super.setDefaultPassword());
  }

  late final _$registerAsyncAction = AsyncAction(
      'ServiceTakerSignupControllerBase.register',
      context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$searchZipAsyncAction = AsyncAction(
      'ServiceTakerSignupControllerBase.searchZip',
      context: context);

  @override
  Future<void> searchZip(String zipFilter) {
    return _$searchZipAsyncAction.run(() => super.searchZip(zipFilter));
  }

  late final _$ServiceTakerSignupControllerBaseActionController =
      ActionController(
          name: 'ServiceTakerSignupControllerBase', context: context);

  @override
  void setCompanyName(String value) {
    final _$actionInfo = _$ServiceTakerSignupControllerBaseActionController
        .startAction(name: 'ServiceTakerSignupControllerBase.setCompanyName');
    try {
      return super.setCompanyName(value);
    } finally {
      _$ServiceTakerSignupControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setFantasyName(String value) {
    final _$actionInfo = _$ServiceTakerSignupControllerBaseActionController
        .startAction(name: 'ServiceTakerSignupControllerBase.setFantasyName');
    try {
      return super.setFantasyName(value);
    } finally {
      _$ServiceTakerSignupControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$ServiceTakerSignupControllerBaseActionController
        .startAction(name: 'ServiceTakerSignupControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$ServiceTakerSignupControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCnpj(String value) {
    final _$actionInfo = _$ServiceTakerSignupControllerBaseActionController
        .startAction(name: 'ServiceTakerSignupControllerBase.setCnpj');
    try {
      return super.setCnpj(value);
    } finally {
      _$ServiceTakerSignupControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$ServiceTakerSignupControllerBaseActionController
        .startAction(name: 'ServiceTakerSignupControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$ServiceTakerSignupControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$ServiceTakerSignupControllerBaseActionController
        .startAction(name: 'ServiceTakerSignupControllerBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$ServiceTakerSignupControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setZip(String value) {
    final _$actionInfo = _$ServiceTakerSignupControllerBaseActionController
        .startAction(name: 'ServiceTakerSignupControllerBase.setZip');
    try {
      return super.setZip(value);
    } finally {
      _$ServiceTakerSignupControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setNumber(String value) {
    final _$actionInfo = _$ServiceTakerSignupControllerBaseActionController
        .startAction(name: 'ServiceTakerSignupControllerBase.setNumber');
    try {
      return super.setNumber(value);
    } finally {
      _$ServiceTakerSignupControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$ServiceTakerSignupControllerBaseActionController
        .startAction(name: 'ServiceTakerSignupControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$ServiceTakerSignupControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setRetypePass(String value) {
    final _$actionInfo = _$ServiceTakerSignupControllerBaseActionController
        .startAction(name: 'ServiceTakerSignupControllerBase.setRetypePass');
    try {
      return super.setRetypePass(value);
    } finally {
      _$ServiceTakerSignupControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setTermsAccepted(bool value) {
    final _$actionInfo = _$ServiceTakerSignupControllerBaseActionController
        .startAction(name: 'ServiceTakerSignupControllerBase.setTermsAccepted');
    try {
      return super.setTermsAccepted(value);
    } finally {
      _$ServiceTakerSignupControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setEmployeer(EmployeerModel? value) {
    final _$actionInfo = _$ServiceTakerSignupControllerBaseActionController
        .startAction(name: 'ServiceTakerSignupControllerBase.setEmployeer');
    try {
      return super.setEmployeer(value);
    } finally {
      _$ServiceTakerSignupControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo =
        _$ServiceTakerSignupControllerBaseActionController.startAction(
            name: 'ServiceTakerSignupControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$ServiceTakerSignupControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
companyName: ${companyName},
fantasyName: ${fantasyName},
employeer: ${employeer},
cnpj: ${cnpj},
name: ${name},
phone: ${phone},
email: ${email},
zip: ${zip},
number: ${number},
password: ${password},
retypePass: ${retypePass},
termsAccepted: ${termsAccepted},
companyNameValid: ${companyNameValid},
fantasyNameValid: ${fantasyNameValid},
cnpjValid: ${cnpjValid},
nameValid: ${nameValid},
emailValid: ${emailValid},
zipValid: ${zipValid},
passwordValid: ${passwordValid},
retypePassValid: ${retypePassValid},
isFormValidSignup: ${isFormValidSignup},
isFormValidRegister: ${isFormValidRegister},
sendPressedSignup: ${sendPressedSignup},
sendPressedRegister: ${sendPressedRegister}
    ''';
  }
}
