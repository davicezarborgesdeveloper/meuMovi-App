// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syndicate_worker_bank_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SyndicateWorkerBankController
    on SyndicateWorkerBankControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'SyndicateWorkerBankControllerBase._status', context: context);

  SyndicateWorkerBankStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  SyndicateWorkerBankStateStatus get _status => status;

  @override
  set _status(SyndicateWorkerBankStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'SyndicateWorkerBankControllerBase._errorMessage',
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
      name: 'SyndicateWorkerBankControllerBase.bankData', context: context);

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

  late final _$_workerModelAtom = Atom(
      name: 'SyndicateWorkerBankControllerBase._workerModel', context: context);

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

  late final _$getBankReceiptAsyncAction = AsyncAction(
      'SyndicateWorkerBankControllerBase.getBankReceipt',
      context: context);

  @override
  Future<void> getBankReceipt(WorkerModel worker) {
    return _$getBankReceiptAsyncAction.run(() => super.getBankReceipt(worker));
  }

  late final _$clearBankReceiptAsyncAction = AsyncAction(
      'SyndicateWorkerBankControllerBase.clearBankReceipt',
      context: context);

  @override
  Future<void> clearBankReceipt() {
    return _$clearBankReceiptAsyncAction.run(() => super.clearBankReceipt());
  }

  late final _$SyndicateWorkerBankControllerBaseActionController =
      ActionController(
          name: 'SyndicateWorkerBankControllerBase', context: context);

  @override
  void setBankData(BankDataModel value) {
    final _$actionInfo = _$SyndicateWorkerBankControllerBaseActionController
        .startAction(name: 'SyndicateWorkerBankControllerBase.setBankData');
    try {
      return super.setBankData(value);
    } finally {
      _$SyndicateWorkerBankControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
bankData: ${bankData}
    ''';
  }
}
