// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'service_taker_register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ServiceTakerRegisterController
    on ServiceTakerRegisterControllerBase, Store {
  Computed<bool>? _$cnpjValidComputed;

  @override
  bool get cnpjValid =>
      (_$cnpjValidComputed ??= Computed<bool>(() => super.cnpjValid,
              name: 'ServiceTakerRegisterControllerBase.cnpjValid'))
          .value;
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: 'ServiceTakerRegisterControllerBase.nameValid'))
          .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: 'ServiceTakerRegisterControllerBase.emailValid'))
          .value;
  Computed<bool>? _$zipValidComputed;

  @override
  bool get zipValid =>
      (_$zipValidComputed ??= Computed<bool>(() => super.zipValid,
              name: 'ServiceTakerRegisterControllerBase.zipValid'))
          .value;
  Computed<bool>? _$passwordValidComputed;

  @override
  bool get passwordValid =>
      (_$passwordValidComputed ??= Computed<bool>(() => super.passwordValid,
              name: 'ServiceTakerRegisterControllerBase.passwordValid'))
          .value;
  Computed<bool>? _$retypePassValidComputed;

  @override
  bool get retypePassValid =>
      (_$retypePassValidComputed ??= Computed<bool>(() => super.retypePassValid,
              name: 'ServiceTakerRegisterControllerBase.retypePassValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'ServiceTakerRegisterControllerBase.isFormValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: 'ServiceTakerRegisterControllerBase.sendPressed'))
          .value;

  late final _$_statusAtom = Atom(
      name: 'ServiceTakerRegisterControllerBase._status', context: context);

  ServiceTakerRegisterStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  ServiceTakerRegisterStateStatus get _status => status;

  @override
  set _status(ServiceTakerRegisterStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'ServiceTakerRegisterControllerBase._errorMessage',
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
      name: 'ServiceTakerRegisterControllerBase._showErrors', context: context);

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

  late final _$cnpjAtom =
      Atom(name: 'ServiceTakerRegisterControllerBase.cnpj', context: context);

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
      Atom(name: 'ServiceTakerRegisterControllerBase.name', context: context);

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
      Atom(name: 'ServiceTakerRegisterControllerBase.phone', context: context);

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
      Atom(name: 'ServiceTakerRegisterControllerBase.email', context: context);

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
      Atom(name: 'ServiceTakerRegisterControllerBase.zip', context: context);

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
      Atom(name: 'ServiceTakerRegisterControllerBase.number', context: context);

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

  late final _$passwordAtom = Atom(
      name: 'ServiceTakerRegisterControllerBase.password', context: context);

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
      name: 'ServiceTakerRegisterControllerBase.retypePass', context: context);

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
      Atom(name: 'ServiceTakerRegisterControllerBase._city', context: context);

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
      name: 'ServiceTakerRegisterControllerBase.termsAccepted',
      context: context);

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

  late final _$registerAsyncAction = AsyncAction(
      'ServiceTakerRegisterControllerBase.register',
      context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$searchZipAsyncAction = AsyncAction(
      'ServiceTakerRegisterControllerBase.searchZip',
      context: context);

  @override
  Future<void> searchZip(String zipFilter) {
    return _$searchZipAsyncAction.run(() => super.searchZip(zipFilter));
  }

  late final _$ServiceTakerRegisterControllerBaseActionController =
      ActionController(
          name: 'ServiceTakerRegisterControllerBase', context: context);

  @override
  void setCnpj(String value) {
    final _$actionInfo = _$ServiceTakerRegisterControllerBaseActionController
        .startAction(name: 'ServiceTakerRegisterControllerBase.setCnpj');
    try {
      return super.setCnpj(value);
    } finally {
      _$ServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$ServiceTakerRegisterControllerBaseActionController
        .startAction(name: 'ServiceTakerRegisterControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$ServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$ServiceTakerRegisterControllerBaseActionController
        .startAction(name: 'ServiceTakerRegisterControllerBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$ServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$ServiceTakerRegisterControllerBaseActionController
        .startAction(name: 'ServiceTakerRegisterControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$ServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setZip(String value) {
    final _$actionInfo = _$ServiceTakerRegisterControllerBaseActionController
        .startAction(name: 'ServiceTakerRegisterControllerBase.setZip');
    try {
      return super.setZip(value);
    } finally {
      _$ServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setNumber(String value) {
    final _$actionInfo = _$ServiceTakerRegisterControllerBaseActionController
        .startAction(name: 'ServiceTakerRegisterControllerBase.setNumber');
    try {
      return super.setNumber(value);
    } finally {
      _$ServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$ServiceTakerRegisterControllerBaseActionController
        .startAction(name: 'ServiceTakerRegisterControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$ServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setRetypePass(String value) {
    final _$actionInfo = _$ServiceTakerRegisterControllerBaseActionController
        .startAction(name: 'ServiceTakerRegisterControllerBase.setRetypePass');
    try {
      return super.setRetypePass(value);
    } finally {
      _$ServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setTermsAccepted(bool value) {
    final _$actionInfo =
        _$ServiceTakerRegisterControllerBaseActionController.startAction(
            name: 'ServiceTakerRegisterControllerBase.setTermsAccepted');
    try {
      return super.setTermsAccepted(value);
    } finally {
      _$ServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo =
        _$ServiceTakerRegisterControllerBaseActionController.startAction(
            name: 'ServiceTakerRegisterControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$ServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cnpj: ${cnpj},
name: ${name},
phone: ${phone},
email: ${email},
zip: ${zip},
number: ${number},
password: ${password},
retypePass: ${retypePass},
termsAccepted: ${termsAccepted},
cnpjValid: ${cnpjValid},
nameValid: ${nameValid},
emailValid: ${emailValid},
zipValid: ${zipValid},
passwordValid: ${passwordValid},
retypePassValid: ${retypePassValid},
isFormValid: ${isFormValid},
sendPressed: ${sendPressed}
    ''';
  }
}
