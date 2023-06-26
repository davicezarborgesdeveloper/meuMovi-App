// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'employeer_picker_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$EmployeerPickerController on EmployeerPickerControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'EmployeerPickerControllerBase._status', context: context);

  EmployeerPickerStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  EmployeerPickerStateStatus get _status => status;

  @override
  set _status(EmployeerPickerStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_employeerListAtom = Atom(
      name: 'EmployeerPickerControllerBase._employeerList', context: context);

  List<SyndicateModel> get employeerList {
    _$_employeerListAtom.reportRead();
    return super._employeerList;
  }

  @override
  List<SyndicateModel> get _employeerList => employeerList;

  @override
  set _employeerList(List<SyndicateModel> value) {
    _$_employeerListAtom.reportWrite(value, super._employeerList, () {
      super._employeerList = value;
    });
  }

  late final _$employeerSelectedAtom = Atom(
      name: 'EmployeerPickerControllerBase.employeerSelected',
      context: context);

  @override
  SyndicateModel? get employeerSelected {
    _$employeerSelectedAtom.reportRead();
    return super.employeerSelected;
  }

  @override
  set employeerSelected(SyndicateModel? value) {
    _$employeerSelectedAtom.reportWrite(value, super.employeerSelected, () {
      super.employeerSelected = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'EmployeerPickerControllerBase._errorMessage', context: context);

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

  late final _$findEmployeersAsyncAction = AsyncAction(
      'EmployeerPickerControllerBase.findEmployeers',
      context: context);

  @override
  Future<void> findEmployeers() {
    return _$findEmployeersAsyncAction.run(() => super.findEmployeers());
  }

  late final _$EmployeerPickerControllerBaseActionController =
      ActionController(name: 'EmployeerPickerControllerBase', context: context);

  @override
  void setEmployeerSelected(SyndicateModel value) {
    final _$actionInfo =
        _$EmployeerPickerControllerBaseActionController.startAction(
            name: 'EmployeerPickerControllerBase.setEmployeerSelected');
    try {
      return super.setEmployeerSelected(value);
    } finally {
      _$EmployeerPickerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
employeerSelected: ${employeerSelected}
    ''';
  }
}
