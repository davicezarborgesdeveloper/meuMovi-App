// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_pix_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BankPixController on BankPixControllerBase, Store {
  Computed<bool>? _$pixKeyTypeValidComputed;

  @override
  bool get pixKeyTypeValid =>
      (_$pixKeyTypeValidComputed ??= Computed<bool>(() => super.pixKeyTypeValid,
              name: 'BankPixControllerBase.pixKeyTypeValid'))
          .value;
  Computed<bool>? _$pixKeyValidComputed;

  @override
  bool get pixKeyValid =>
      (_$pixKeyValidComputed ??= Computed<bool>(() => super.pixKeyValid,
              name: 'BankPixControllerBase.pixKeyValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'BankPixControllerBase.isFormValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: 'BankPixControllerBase.sendPressed'))
          .value;

  late final _$_statusAtom =
      Atom(name: 'BankPixControllerBase._status', context: context);

  BankPixStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  BankPixStateStatus get _status => status;

  @override
  set _status(BankPixStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'BankPixControllerBase._errorMessage', context: context);

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
      Atom(name: 'BankPixControllerBase._showErrors', context: context);

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

  late final _$pixKeyTypeAtom =
      Atom(name: 'BankPixControllerBase.pixKeyType', context: context);

  @override
  PixKeyType? get pixKeyType {
    _$pixKeyTypeAtom.reportRead();
    return super.pixKeyType;
  }

  @override
  set pixKeyType(PixKeyType? value) {
    _$pixKeyTypeAtom.reportWrite(value, super.pixKeyType, () {
      super.pixKeyType = value;
    });
  }

  late final _$pixKeyAtom =
      Atom(name: 'BankPixControllerBase.pixKey', context: context);

  @override
  String? get pixKey {
    _$pixKeyAtom.reportRead();
    return super.pixKey;
  }

  @override
  set pixKey(String? value) {
    _$pixKeyAtom.reportWrite(value, super.pixKey, () {
      super.pixKey = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('BankPixControllerBase.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$BankPixControllerBaseActionController =
      ActionController(name: 'BankPixControllerBase', context: context);

  @override
  void setPixKeyType(PixKeyType? value) {
    final _$actionInfo = _$BankPixControllerBaseActionController.startAction(
        name: 'BankPixControllerBase.setPixKeyType');
    try {
      return super.setPixKeyType(value);
    } finally {
      _$BankPixControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPixKey(String value) {
    final _$actionInfo = _$BankPixControllerBaseActionController.startAction(
        name: 'BankPixControllerBase.setPixKey');
    try {
      return super.setPixKey(value);
    } finally {
      _$BankPixControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$BankPixControllerBaseActionController.startAction(
        name: 'BankPixControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$BankPixControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
pixKeyType: ${pixKeyType},
pixKey: ${pixKey},
pixKeyTypeValid: ${pixKeyTypeValid},
pixKeyValid: ${pixKeyValid},
isFormValid: ${isFormValid},
sendPressed: ${sendPressed}
    ''';
  }
}
