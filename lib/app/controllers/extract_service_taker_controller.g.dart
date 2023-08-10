// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'extract_service_taker_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ExtractServiceTakerController
    on ExtractServiceTakerControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'ExtractServiceTakerControllerBase._status', context: context);

  ExtractServiceTakerStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  ExtractServiceTakerStateStatus get _status => status;

  @override
  set _status(ExtractServiceTakerStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'ExtractServiceTakerControllerBase._errorMessage',
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

  late final _$buttonSelectedAtom = Atom(
      name: 'ExtractServiceTakerControllerBase.buttonSelected',
      context: context);

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

  late final _$ExtractServiceTakerControllerBaseActionController =
      ActionController(
          name: 'ExtractServiceTakerControllerBase', context: context);

  @override
  void setButtonSelected(int value) {
    final _$actionInfo =
        _$ExtractServiceTakerControllerBaseActionController.startAction(
            name: 'ExtractServiceTakerControllerBase.setButtonSelected');
    try {
      return super.setButtonSelected(value);
    } finally {
      _$ExtractServiceTakerControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
buttonSelected: ${buttonSelected}
    ''';
  }
}
