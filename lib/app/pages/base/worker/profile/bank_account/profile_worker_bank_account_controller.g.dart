// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_worker_bank_account_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileWorkerBankAccountController
    on ProfileWorkerBankAccountControllerBase, Store {
  late final _$_statusAtom = Atom(
      name: 'ProfileWorkerBankAccountControllerBase._status', context: context);

  ProfileWorkerBankAccountStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  ProfileWorkerBankAccountStateStatus get _status => status;

  @override
  set _status(ProfileWorkerBankAccountStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'ProfileWorkerBankAccountControllerBase._errorMessage',
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

  late final _$bankDataAtom = Atom(
      name: 'ProfileWorkerBankAccountControllerBase.bankData',
      context: context);

  @override
  BankDataModel? get bankData {
    _$bankDataAtom.reportRead();
    return super.bankData;
  }

  @override
  set bankData(BankDataModel? value) {
    _$bankDataAtom.reportWrite(value, super.bankData, () {
      super.bankData = value;
    });
  }

  late final _$getBankReceiptAsyncAction = AsyncAction(
      'ProfileWorkerBankAccountControllerBase.getBankReceipt',
      context: context);

  @override
  Future<void> getBankReceipt() {
    return _$getBankReceiptAsyncAction.run(() => super.getBankReceipt());
  }

  late final _$clearBankReceiptAsyncAction = AsyncAction(
      'ProfileWorkerBankAccountControllerBase.clearBankReceipt',
      context: context);

  @override
  Future<void> clearBankReceipt() {
    return _$clearBankReceiptAsyncAction.run(() => super.clearBankReceipt());
  }

  @override
  String toString() {
    return '''
bankData: ${bankData}
    ''';
  }
}
