// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'legal_data_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$LegalDataController on LegalDataControllerBase, Store {
  Computed<bool>? _$corporateNameValidComputed;

  @override
  bool get corporateNameValid => (_$corporateNameValidComputed ??=
          Computed<bool>(() => super.corporateNameValid,
              name: 'LegalDataControllerBase.corporateNameValid'))
      .value;
  Computed<bool>? _$fantasyNameValidComputed;

  @override
  bool get fantasyNameValid => (_$fantasyNameValidComputed ??= Computed<bool>(
          () => super.fantasyNameValid,
          name: 'LegalDataControllerBase.fantasyNameValid'))
      .value;
  Computed<bool>? _$cnpjValidComputed;

  @override
  bool get cnpjValid =>
      (_$cnpjValidComputed ??= Computed<bool>(() => super.cnpjValid,
              name: 'LegalDataControllerBase.cnpjValid'))
          .value;
  Computed<bool>? _$passwordValidComputed;

  @override
  bool get passwordValid =>
      (_$passwordValidComputed ??= Computed<bool>(() => super.passwordValid,
              name: 'LegalDataControllerBase.passwordValid'))
          .value;
  Computed<bool>? _$retypePassValidComputed;

  @override
  bool get retypePassValid =>
      (_$retypePassValidComputed ??= Computed<bool>(() => super.retypePassValid,
              name: 'LegalDataControllerBase.retypePassValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: 'LegalDataControllerBase.sendPressed'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'LegalDataControllerBase.isFormValid'))
          .value;

  late final _$_statusAtom =
      Atom(name: 'LegalDataControllerBase._status', context: context);

  LegalDataStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  LegalDataStateStatus get _status => status;

  @override
  set _status(LegalDataStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'LegalDataControllerBase._errorMessage', context: context);

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
      Atom(name: 'LegalDataControllerBase._showErrors', context: context);

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

  late final _$corporateNameAtom =
      Atom(name: 'LegalDataControllerBase.corporateName', context: context);

  @override
  String? get corporateName {
    _$corporateNameAtom.reportRead();
    return super.corporateName;
  }

  @override
  set corporateName(String? value) {
    _$corporateNameAtom.reportWrite(value, super.corporateName, () {
      super.corporateName = value;
    });
  }

  late final _$fantasyNameAtom =
      Atom(name: 'LegalDataControllerBase.fantasyName', context: context);

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

  late final _$cnpjAtom =
      Atom(name: 'LegalDataControllerBase.cnpj', context: context);

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

  late final _$passwordAtom =
      Atom(name: 'LegalDataControllerBase.password', context: context);

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
      Atom(name: 'LegalDataControllerBase.retypePass', context: context);

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

  late final _$getDataAsyncAction =
      AsyncAction('LegalDataControllerBase.getData', context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$registerAsyncAction =
      AsyncAction('LegalDataControllerBase.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$LegalDataControllerBaseActionController =
      ActionController(name: 'LegalDataControllerBase', context: context);

  @override
  void setCorporateName(String value) {
    final _$actionInfo = _$LegalDataControllerBaseActionController.startAction(
        name: 'LegalDataControllerBase.setCorporateName');
    try {
      return super.setCorporateName(value);
    } finally {
      _$LegalDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFantasyName(String value) {
    final _$actionInfo = _$LegalDataControllerBaseActionController.startAction(
        name: 'LegalDataControllerBase.setFantasyName');
    try {
      return super.setFantasyName(value);
    } finally {
      _$LegalDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCNPJ(String value) {
    final _$actionInfo = _$LegalDataControllerBaseActionController.startAction(
        name: 'LegalDataControllerBase.setCNPJ');
    try {
      return super.setCNPJ(value);
    } finally {
      _$LegalDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPassword(String value) {
    final _$actionInfo = _$LegalDataControllerBaseActionController.startAction(
        name: 'LegalDataControllerBase.setPassword');
    try {
      return super.setPassword(value);
    } finally {
      _$LegalDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setRetypePass(String value) {
    final _$actionInfo = _$LegalDataControllerBaseActionController.startAction(
        name: 'LegalDataControllerBase.setRetypePass');
    try {
      return super.setRetypePass(value);
    } finally {
      _$LegalDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$LegalDataControllerBaseActionController.startAction(
        name: 'LegalDataControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$LegalDataControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
corporateName: ${corporateName},
fantasyName: ${fantasyName},
cnpj: ${cnpj},
password: ${password},
retypePass: ${retypePass},
corporateNameValid: ${corporateNameValid},
fantasyNameValid: ${fantasyNameValid},
cnpjValid: ${cnpjValid},
passwordValid: ${passwordValid},
retypePassValid: ${retypePassValid},
sendPressed: ${sendPressed},
isFormValid: ${isFormValid}
    ''';
  }
}
