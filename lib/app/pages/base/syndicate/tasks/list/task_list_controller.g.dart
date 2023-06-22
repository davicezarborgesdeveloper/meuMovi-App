// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskListController on TaskListControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'TaskListControllerBase._status', context: context);

  TaskListStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  TaskListStateStatus get _status => status;

  @override
  set _status(TaskListStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'TaskListControllerBase._errorMessage', context: context);

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

  late final _$_tasksAtom =
      Atom(name: 'TaskListControllerBase._tasks', context: context);

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

  @override
  String toString() {
    return '''

    ''';
  }
}
