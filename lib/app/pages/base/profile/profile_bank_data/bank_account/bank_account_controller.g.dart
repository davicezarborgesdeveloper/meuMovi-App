// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bank_account_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$BankAccountController on BankAccountControllerBase, Store {
  Computed<bool>? _$cardholderNameValidComputed;

  @override
  bool get cardholderNameValid => (_$cardholderNameValidComputed ??=
          Computed<bool>(() => super.cardholderNameValid,
              name: 'BankAccountControllerBase.cardholderNameValid'))
      .value;
  Computed<bool>? _$holdersCPFValidComputed;

  @override
  bool get holdersCPFValid =>
      (_$holdersCPFValidComputed ??= Computed<bool>(() => super.holdersCPFValid,
              name: 'BankAccountControllerBase.holdersCPFValid'))
          .value;
  Computed<bool>? _$bankValidComputed;

  @override
  bool get bankValid =>
      (_$bankValidComputed ??= Computed<bool>(() => super.bankValid,
              name: 'BankAccountControllerBase.bankValid'))
          .value;
  Computed<bool>? _$agencyValidComputed;

  @override
  bool get agencyValid =>
      (_$agencyValidComputed ??= Computed<bool>(() => super.agencyValid,
              name: 'BankAccountControllerBase.agencyValid'))
          .value;
  Computed<bool>? _$accountValidComputed;

  @override
  bool get accountValid =>
      (_$accountValidComputed ??= Computed<bool>(() => super.accountValid,
              name: 'BankAccountControllerBase.accountValid'))
          .value;
  Computed<bool>? _$verifyingDigitValidComputed;

  @override
  bool get verifyingDigitValid => (_$verifyingDigitValidComputed ??=
          Computed<bool>(() => super.verifyingDigitValid,
              name: 'BankAccountControllerBase.verifyingDigitValid'))
      .value;
  Computed<bool>? _$accountTypeValidComputed;

  @override
  bool get accountTypeValid => (_$accountTypeValidComputed ??= Computed<bool>(
          () => super.accountTypeValid,
          name: 'BankAccountControllerBase.accountTypeValid'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'BankAccountControllerBase.isFormValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: 'BankAccountControllerBase.sendPressed'))
          .value;

  late final _$_statusAtom =
      Atom(name: 'BankAccountControllerBase._status', context: context);

  BankAccountStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  BankAccountStateStatus get _status => status;

  @override
  set _status(BankAccountStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_bankListAtom =
      Atom(name: 'BankAccountControllerBase._bankList', context: context);

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
      Atom(name: 'BankAccountControllerBase._errorMessage', context: context);

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
      Atom(name: 'BankAccountControllerBase._showErrors', context: context);

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
      Atom(name: 'BankAccountControllerBase.cardholderName', context: context);

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
      Atom(name: 'BankAccountControllerBase.holdersCPF', context: context);

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
      Atom(name: 'BankAccountControllerBase.bank', context: context);

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
      Atom(name: 'BankAccountControllerBase.agency', context: context);

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
      Atom(name: 'BankAccountControllerBase.account', context: context);

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
      Atom(name: 'BankAccountControllerBase.verifyingDigit', context: context);

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
      Atom(name: 'BankAccountControllerBase.accountType', context: context);

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
      AsyncAction('BankAccountControllerBase.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$findBanksAsyncAction =
      AsyncAction('BankAccountControllerBase.findBanks', context: context);

  @override
  Future<void> findBanks() {
    return _$findBanksAsyncAction.run(() => super.findBanks());
  }

  late final _$BankAccountControllerBaseActionController =
      ActionController(name: 'BankAccountControllerBase', context: context);

  @override
  void setCardholderName(String value) {
    final _$actionInfo = _$BankAccountControllerBaseActionController
        .startAction(name: 'BankAccountControllerBase.setCardholderName');
    try {
      return super.setCardholderName(value);
    } finally {
      _$BankAccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHoldersCPF(String value) {
    final _$actionInfo = _$BankAccountControllerBaseActionController
        .startAction(name: 'BankAccountControllerBase.setHoldersCPF');
    try {
      return super.setHoldersCPF(value);
    } finally {
      _$BankAccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setBank(BankModel? value) {
    final _$actionInfo = _$BankAccountControllerBaseActionController
        .startAction(name: 'BankAccountControllerBase.setBank');
    try {
      return super.setBank(value);
    } finally {
      _$BankAccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAgency(String value) {
    final _$actionInfo = _$BankAccountControllerBaseActionController
        .startAction(name: 'BankAccountControllerBase.setAgency');
    try {
      return super.setAgency(value);
    } finally {
      _$BankAccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAccount(String value) {
    final _$actionInfo = _$BankAccountControllerBaseActionController
        .startAction(name: 'BankAccountControllerBase.setAccount');
    try {
      return super.setAccount(value);
    } finally {
      _$BankAccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setVerifyingDigit(String value) {
    final _$actionInfo = _$BankAccountControllerBaseActionController
        .startAction(name: 'BankAccountControllerBase.setVerifyingDigit');
    try {
      return super.setVerifyingDigit(value);
    } finally {
      _$BankAccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setAccountType(AccountType? value) {
    final _$actionInfo = _$BankAccountControllerBaseActionController
        .startAction(name: 'BankAccountControllerBase.setAccountType');
    try {
      return super.setAccountType(value);
    } finally {
      _$BankAccountControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$BankAccountControllerBaseActionController
        .startAction(name: 'BankAccountControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$BankAccountControllerBaseActionController.endAction(_$actionInfo);
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
