// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'worker_list_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$WorkerListController on WorkerListControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'WorkerListControllerBase._status', context: context);

  WorkerListStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  WorkerListStateStatus get _status => status;

  @override
  set _status(WorkerListStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'WorkerListControllerBase._errorMessage', context: context);

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

  late final _$_workersAtom =
      Atom(name: 'WorkerListControllerBase._workers', context: context);

  List<WorkerModel> get workers {
    _$_workersAtom.reportRead();
    return super._workers;
  }

  @override
  List<WorkerModel> get _workers => workers;

  @override
  set _workers(List<WorkerModel> value) {
    _$_workersAtom.reportWrite(value, super._workers, () {
      super._workers = value;
    });
  }

  @override
  String toString() {
    return '''

    ''';
  }
}
