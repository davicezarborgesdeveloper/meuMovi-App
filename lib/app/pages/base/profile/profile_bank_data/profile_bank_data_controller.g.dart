// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_bank_data_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileBankDataController on ProfileBankDataControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'ProfileBankDataControllerBase._status', context: context);

  ProfileBankDataStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  ProfileBankDataStateStatus get _status => status;

  @override
  set _status(ProfileBankDataStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'ProfileBankDataControllerBase._errorMessage', context: context);

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

  late final _$bankReceiptAtom =
      Atom(name: 'ProfileBankDataControllerBase.bankReceipt', context: context);

  @override
  BankReceipt? get bankReceipt {
    _$bankReceiptAtom.reportRead();
    return super.bankReceipt;
  }

  @override
  set bankReceipt(BankReceipt? value) {
    _$bankReceiptAtom.reportWrite(value, super.bankReceipt, () {
      super.bankReceipt = value;
    });
  }

  late final _$findBankReceiptAsyncAction = AsyncAction(
      'ProfileBankDataControllerBase.findBankReceipt',
      context: context);

  @override
  Future<void> findBankReceipt() {
    return _$findBankReceiptAsyncAction.run(() => super.findBankReceipt());
  }

  late final _$clearBankReceiptAsyncAction = AsyncAction(
      'ProfileBankDataControllerBase.clearBankReceipt',
      context: context);

  @override
  Future<void> clearBankReceipt() {
    return _$clearBankReceiptAsyncAction.run(() => super.clearBankReceipt());
  }

  @override
  String toString() {
    return '''
bankReceipt: ${bankReceipt}
    ''';
  }
}
