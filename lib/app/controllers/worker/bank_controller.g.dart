// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BankController on BankControllerBase, Store {
  Computed<bool>? _$cardholderNameValidComputed;

  @override
  bool get cardholderNameValid => (_$cardholderNameValidComputed ??=
          Computed<bool>(() => super.cardholderNameValid,
              name: 'BankControllerBase.cardholderNameValid'))
      .value;
  Computed<bool>? _$holdersCPFValidComputed;

  @override
  bool get holdersCPFValid =>
      (_$holdersCPFValidComputed ??= Computed<bool>(() => super.holdersCPFValid,
              name: 'BankControllerBase.holdersCPFValid'))
          .value;
  Computed<bool>? _$bankValidComputed;

  @override
  bool get bankValid =>
      (_$bankValidComputed ??= Computed<bool>(() => super.bankValid,
              name: 'BankControllerBase.bankValid'))
          .value;
  Computed<bool>? _$agencyValidComputed;

  @override
  bool get agencyValid =>
      (_$agencyValidComputed ??= Computed<bool>(() => super.agencyValid,
              name: 'BankControllerBase.agencyValid'))
          .value;
  Computed<bool>? _$accountValidComputed;

  @override
  bool get accountValid =>
      (_$accountValidComputed ??= Computed<bool>(() => super.accountValid,
              name: 'BankControllerBase.accountValid'))
          .value;
  Computed<bool>? _$verifyingDigitValidComputed;

  @override
  bool get verifyingDigitValid => (_$verifyingDigitValidComputed ??=
          Computed<bool>(() => super.verifyingDigitValid,
              name: 'BankControllerBase.verifyingDigitValid'))
      .value;
  Computed<bool>? _$accountTypeValidComputed;

  @override
  bool get accountTypeValid => (_$accountTypeValidComputed ??= Computed<bool>(
          () => super.accountTypeValid,
          name: 'BankControllerBase.accountTypeValid'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'BankControllerBase.isFormValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: 'BankControllerBase.sendPressed'))
          .value;

  late final _$_statusAtom =
      Atom(name: 'BankControllerBase._status', context: context);

  BankStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  BankStateStatus get _status => status;

  @override
  set _status(BankStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_bankListAtom =
      Atom(name: 'BankControllerBase._bankList', context: context);

  List<BankModel> get bankList {
    _$_bankListAtom.reportRead();
    return super._bankList;
  }

  @override
  List<BankModel> get _bankList => bankList;

  @override
  set _bankList(List<BankModel> value) {
    _$_bankListAtom.reportWrite(value, super._bankList, () {
      super._bankList = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'BankControllerBase._errorMessage', context: context);

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
      Atom(name: 'BankControllerBase._showErrors', context: context);

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

  late final _$cardholderNameAtom =
      Atom(name: 'BankControllerBase.cardholderName', context: context);

  @override
  String? get cardholderName {
    _$cardholderNameAtom.reportRead();
    return super.cardholderName;
  }

  @override
  set cardholderName(String? value) {
    _$cardholderNameAtom.reportWrite(value, super.cardholderName, () {
      super.cardholderName = value;
    });
  }

  late final _$holdersCPFAtom =
      Atom(name: 'BankControllerBase.holdersCPF', context: context);

  @override
  String? get holdersCPF {
    _$holdersCPFAtom.reportRead();
    return super.holdersCPF;
  }

  @override
  set holdersCPF(String? value) {
    _$holdersCPFAtom.reportWrite(value, super.holdersCPF, () {
      super.holdersCPF = value;
    });
  }

  late final _$bankAtom =
      Atom(name: 'BankControllerBase.bank', context: context);

  @override
  BankModel? get bank {
    _$bankAtom.reportRead();
    return super.bank;
  }

  @override
  set bank(BankModel? value) {
    _$bankAtom.reportWrite(value, super.bank, () {
      super.bank = value;
    });
  }

  late final _$agencyAtom =
      Atom(name: 'BankControllerBase.agency', context: context);

  @override
  String? get agency {
    _$agencyAtom.reportRead();
    return super.agency;
  }

  @override
  set agency(String? value) {
    _$agencyAtom.reportWrite(value, super.agency, () {
      super.agency = value;
    });
  }

  late final _$accountAtom =
      Atom(name: 'BankControllerBase.account', context: context);

  @override
  String? get account {
    _$accountAtom.reportRead();
    return super.account;
  }

  @override
  set account(String? value) {
    _$accountAtom.reportWrite(value, super.account, () {
      super.account = value;
    });
  }

  late final _$verifyingDigitAtom =
      Atom(name: 'BankControllerBase.verifyingDigit', context: context);

  @override
  String? get verifyingDigit {
    _$verifyingDigitAtom.reportRead();
    return super.verifyingDigit;
  }

  @override
  set verifyingDigit(String? value) {
    _$verifyingDigitAtom.reportWrite(value, super.verifyingDigit, () {
      super.verifyingDigit = value;
    });
  }

  late final _$accountTypeAtom =
      Atom(name: 'BankControllerBase.accountType', context: context);

  @override
  AccountType? get accountType {
    _$accountTypeAtom.reportRead();
    return super.accountType;
  }

  @override
  set accountType(AccountType? value) {
    _$accountTypeAtom.reportWrite(value, super.accountType, () {
      super.accountType = value;
    });
  }

  late final _$saveAsyncAction =
      AsyncAction('BankControllerBase.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$findBanksAsyncAction =
      AsyncAction('BankControllerBase.findBanks', context: context);

  @override
  Future<void> findBanks() {
    return _$findBanksAsyncAction.run(() => super.findBanks());
  }

  late final _$BankControllerBaseActionController =
      ActionController(name: 'BankControllerBase', context: context);

  @override
  void setCardholderName(String value) {
    final _$actionInfo = _$BankControllerBaseActionController.startAction(
        name: 'BankControllerBase.setCardholderName');
    try {
      return super.setCardholderName(value);
    } finally {
      _$BankControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHoldersCPF(String value) {
    final _$actionInfo = _$BankControllerBaseActionController.startAction(
        name: 'BankControllerBase.setHoldersCPF');
    try {
      return super.setHoldersCPF(value);
    } finally {
      _$BankControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBank(BankModel? value) {
    final _$actionInfo = _$BankControllerBaseActionController.startAction(
        name: 'BankControllerBase.setBank');
    try {
      return super.setBank(value);
    } finally {
      _$BankControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAgency(String value) {
    final _$actionInfo = _$BankControllerBaseActionController.startAction(
        name: 'BankControllerBase.setAgency');
    try {
      return super.setAgency(value);
    } finally {
      _$BankControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAccount(String value) {
    final _$actionInfo = _$BankControllerBaseActionController.startAction(
        name: 'BankControllerBase.setAccount');
    try {
      return super.setAccount(value);
    } finally {
      _$BankControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVerifyingDigit(String value) {
    final _$actionInfo = _$BankControllerBaseActionController.startAction(
        name: 'BankControllerBase.setVerifyingDigit');
    try {
      return super.setVerifyingDigit(value);
    } finally {
      _$BankControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAccountType(AccountType? value) {
    final _$actionInfo = _$BankControllerBaseActionController.startAction(
        name: 'BankControllerBase.setAccountType');
    try {
      return super.setAccountType(value);
    } finally {
      _$BankControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$BankControllerBaseActionController.startAction(
        name: 'BankControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$BankControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
cardholderName: ${cardholderName},
holdersCPF: ${holdersCPF},
bank: ${bank},
agency: ${agency},
account: ${account},
verifyingDigit: ${verifyingDigit},
accountType: ${accountType},
cardholderNameValid: ${cardholderNameValid},
holdersCPFValid: ${holdersCPFValid},
bankValid: ${bankValid},
agencyValid: ${agencyValid},
accountValid: ${accountValid},
verifyingDigitValid: ${verifyingDigitValid},
accountTypeValid: ${accountTypeValid},
isFormValid: ${isFormValid},
sendPressed: ${sendPressed}
    ''';
  }
}
