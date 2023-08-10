// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extract_worker_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExtractWorkerController on ExtractWorkerControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'ExtractWorkerControllerBase._status', context: context);

  ExtractWorkerStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  ExtractWorkerStateStatus get _status => status;

  @override
  set _status(ExtractWorkerStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'ExtractWorkerControllerBase._errorMessage', context: context);

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

  late final _$buttonSelectedAtom = Atom(
      name: 'ExtractWorkerControllerBase.buttonSelected', context: context);

  @override
  int get buttonSelected {
    _$buttonSelectedAtom.reportRead();
    return super.buttonSelected;
  }

  @override
  set buttonSelected(int value) {
    _$buttonSelectedAtom.reportWrite(value, super.buttonSelected, () {
      super.buttonSelected = value;
    });
  }

  late final _$_amountAtom =
      Atom(name: 'ExtractWorkerControllerBase._amount', context: context);

  double? get amount {
    _$_amountAtom.reportRead();
    return super._amount;
  }

  @override
  double? get _amount => amount;

  @override
  set _amount(double? value) {
    _$_amountAtom.reportWrite(value, super._amount, () {
      super._amount = value;
    });
  }

  late final _$ExtractWorkerControllerBaseActionController =
      ActionController(name: 'ExtractWorkerControllerBase', context: context);

  @override
  void setButtonSelected(int value) {
    final _$actionInfo = _$ExtractWorkerControllerBaseActionController
        .startAction(name: 'ExtractWorkerControllerBase.setButtonSelected');
    try {
      return super.setButtonSelected(value);
    } finally {
      _$ExtractWorkerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
buttonSelected: ${buttonSelected}
    ''';
  }
}
