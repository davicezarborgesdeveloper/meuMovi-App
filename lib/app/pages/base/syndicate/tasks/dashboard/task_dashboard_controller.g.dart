// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_dashboard_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskDashboardController on TaskDashboardControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'TaskDashboardControllerBase._status', context: context);

  TaskDashboardStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  TaskDashboardStateStatus get _status => status;

  @override
  set _status(TaskDashboardStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'TaskDashboardControllerBase._errorMessage', context: context);

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
      name: 'TaskDashboardControllerBase.buttonSelected', context: context);

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
      Atom(name: 'TaskDashboardControllerBase._tasks', context: context);

  DashboardTaskModel? get tasks {
    _$_tasksAtom.reportRead();
    return super._tasks;
  }

  @override
  DashboardTaskModel? get _tasks => tasks;

  @override
  set _tasks(DashboardTaskModel? value) {
    _$_tasksAtom.reportWrite(value, super._tasks, () {
      super._tasks = value;
    });
  }

  late final _$TaskDashboardControllerBaseActionController =
      ActionController(name: 'TaskDashboardControllerBase', context: context);

  @override
  void setButtonSelected(int value) {
    final _$actionInfo = _$TaskDashboardControllerBaseActionController
        .startAction(name: 'TaskDashboardControllerBase.setButtonSelected');
    try {
      return super.setButtonSelected(value);
    } finally {
      _$TaskDashboardControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
buttonSelected: ${buttonSelected}
    ''';
  }
}
