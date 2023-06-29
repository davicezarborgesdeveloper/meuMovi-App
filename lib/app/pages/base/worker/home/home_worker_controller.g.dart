// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_worker_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$HomeWorkerController on HomeWorkerControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'HomeWorkerControllerBase._status', context: context);

  HomeWorkerStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  HomeWorkerStateStatus get _status => status;

  @override
  set _status(HomeWorkerStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'HomeWorkerControllerBase._errorMessage', context: context);

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

  late final _$buttonSelectedAtom =
      Atom(name: 'HomeWorkerControllerBase.buttonSelected', context: context);

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
      Atom(name: 'HomeWorkerControllerBase._tasks', context: context);

  List<TaskModel> get tasks {
    _$_tasksAtom.reportRead();
    return super._tasks;
  }

  @override
  List<TaskModel> get _tasks => tasks;

  @override
  set _tasks(List<TaskModel> value) {
    _$_tasksAtom.reportWrite(value, super._tasks, () {
      super._tasks = value;
    });
  }

  late final _$_employeerCodeAtom =
      Atom(name: 'HomeWorkerControllerBase._employeerCode', context: context);

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

  late final _$optionDistanceAtom =
      Atom(name: 'HomeWorkerControllerBase.optionDistance', context: context);

  @override
  OptionDistance get optionDistance {
    _$optionDistanceAtom.reportRead();
    return super.optionDistance;
  }

  @override
  set optionDistance(OptionDistance value) {
    _$optionDistanceAtom.reportWrite(value, super.optionDistance, () {
      super.optionDistance = value;
    });
  }

  late final _$HomeWorkerControllerBaseActionController =
      ActionController(name: 'HomeWorkerControllerBase', context: context);

  @override
  void setButtonSelected(int value) {
    final _$actionInfo = _$HomeWorkerControllerBaseActionController.startAction(
        name: 'HomeWorkerControllerBase.setButtonSelected');
    try {
      return super.setButtonSelected(value);
    } finally {
      _$HomeWorkerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setOptionDistance(OptionDistance value) {
    final _$actionInfo = _$HomeWorkerControllerBaseActionController.startAction(
        name: 'HomeWorkerControllerBase.setOptionDistance');
    try {
      return super.setOptionDistance(value);
    } finally {
      _$HomeWorkerControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
buttonSelected: ${buttonSelected},
optionDistance: ${optionDistance}
    ''';
  }
}
