// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_service_taker_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeServiceTakerController on HomeServiceTakerControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'HomeServiceTakerControllerBase._status', context: context);

  HomeServiceTakerStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  HomeServiceTakerStateStatus get _status => status;

  @override
  set _status(HomeServiceTakerStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'HomeServiceTakerControllerBase._errorMessage', context: context);

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
      name: 'HomeServiceTakerControllerBase.buttonSelected', context: context);

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

  late final _$_tasksAtom =
      Atom(name: 'HomeServiceTakerControllerBase._tasks', context: context);

  DashboardTaskModell? get tasks {
    _$_tasksAtom.reportRead();
    return super._tasks;
  }

  @override
  DashboardTaskModell? get _tasks => tasks;

  @override
  set _tasks(DashboardTaskModell? value) {
    _$_tasksAtom.reportWrite(value, super._tasks, () {
      super._tasks = value;
    });
  }

  late final _$selectedDashboardAtom = Atom(
      name: 'HomeServiceTakerControllerBase.selectedDashboard',
      context: context);

  @override
  DashboardList? get selectedDashboard {
    _$selectedDashboardAtom.reportRead();
    return super.selectedDashboard;
  }

  @override
  set selectedDashboard(DashboardList? value) {
    _$selectedDashboardAtom.reportWrite(value, super.selectedDashboard, () {
      super.selectedDashboard = value;
    });
  }

  late final _$_employeerCodeAtom = Atom(
      name: 'HomeServiceTakerControllerBase._employeerCode', context: context);

  String? get employeerCode {
    _$_employeerCodeAtom.reportRead();
    return super._employeerCode;
  }

  @override
  String? get _employeerCode => employeerCode;

  @override
  set _employeerCode(String? value) {
    _$_employeerCodeAtom.reportWrite(value, super._employeerCode, () {
      super._employeerCode = value;
    });
  }

  late final _$HomeServiceTakerControllerBaseActionController =
      ActionController(
          name: 'HomeServiceTakerControllerBase', context: context);

  @override
  void setButtonSelected(int value) {
    final _$actionInfo = _$HomeServiceTakerControllerBaseActionController
        .startAction(name: 'HomeServiceTakerControllerBase.setButtonSelected');
    try {
      return super.setButtonSelected(value);
    } finally {
      _$HomeServiceTakerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSelectedDashboard(DashboardList? value) {
    final _$actionInfo =
        _$HomeServiceTakerControllerBaseActionController.startAction(
            name: 'HomeServiceTakerControllerBase.setSelectedDashboard');
    try {
      return super.setSelectedDashboard(value);
    } finally {
      _$HomeServiceTakerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
buttonSelected: ${buttonSelected},
selectedDashboard: ${selectedDashboard}
    ''';
  }
}
