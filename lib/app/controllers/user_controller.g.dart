// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserController on UserControllerBase, Store {
  Computed<bool>? _$isLoggedInComputed;

  @override
  bool get isLoggedIn =>
      (_$isLoggedInComputed ??= Computed<bool>(() => super.isLoggedIn,
              name: 'UserControllerBase.isLoggedIn'))
          .value;
  Computed<bool>? _$isLoggedInKeepComputed;

  @override
  bool get isLoggedInKeep =>
      (_$isLoggedInKeepComputed ??= Computed<bool>(() => super.isLoggedInKeep,
              name: 'UserControllerBase.isLoggedInKeep'))
          .value;

  late final _$_statusAtom =
      Atom(name: 'UserControllerBase._status', context: context);

  UserStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  UserStateStatus get _status => status;

  @override
  set _status(UserStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'UserControllerBase._errorMessage', context: context);

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

  late final _$workerAtom =
      Atom(name: 'UserControllerBase.worker', context: context);

  @override
  WorkerModel? get worker {
    _$workerAtom.reportRead();
    return super.worker;
  }

  @override
  set worker(WorkerModel? value) {
    _$workerAtom.reportWrite(value, super.worker, () {
      super.worker = value;
    });
  }

  late final _$serviceTakerAtom =
      Atom(name: 'UserControllerBase.serviceTaker', context: context);

  @override
  ServiceTakerModel? get serviceTaker {
    _$serviceTakerAtom.reportRead();
    return super.serviceTaker;
  }

  @override
  set serviceTaker(ServiceTakerModel? value) {
    _$serviceTakerAtom.reportWrite(value, super.serviceTaker, () {
      super.serviceTaker = value;
    });
  }

  late final _$syndicateAtom =
      Atom(name: 'UserControllerBase.syndicate', context: context);

  @override
  SyndicateModel? get syndicate {
    _$syndicateAtom.reportRead();
    return super.syndicate;
  }

  @override
  set syndicate(SyndicateModel? value) {
    _$syndicateAtom.reportWrite(value, super.syndicate, () {
      super.syndicate = value;
    });
  }

  late final _$_keepLoggedAtom =
      Atom(name: 'UserControllerBase._keepLogged', context: context);

  bool get keepLogged {
    _$_keepLoggedAtom.reportRead();
    return super._keepLogged;
  }

  @override
  bool get _keepLogged => keepLogged;

  @override
  set _keepLogged(bool value) {
    _$_keepLoggedAtom.reportWrite(value, super._keepLogged, () {
      super._keepLogged = value;
    });
  }

  late final _$loadCurrentUserAsyncAction =
      AsyncAction('UserControllerBase.loadCurrentUser', context: context);

  @override
  Future<void> loadCurrentUser() {
    return _$loadCurrentUserAsyncAction.run(() => super.loadCurrentUser());
  }

  late final _$getCurrentUserAsyncAction =
      AsyncAction('UserControllerBase.getCurrentUser', context: context);

  @override
  Future<void> getCurrentUser() {
    return _$getCurrentUserAsyncAction.run(() => super.getCurrentUser());
  }

  late final _$logoutAsyncAction =
      AsyncAction('UserControllerBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$deleteUserAsyncAction =
      AsyncAction('UserControllerBase.deleteUser', context: context);

  @override
  Future<void> deleteUser() {
    return _$deleteUserAsyncAction.run(() => super.deleteUser());
  }

  late final _$UserControllerBaseActionController =
      ActionController(name: 'UserControllerBase', context: context);

  @override
  void setWorker(WorkerModel? value) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.setWorker');
    try {
      return super.setWorker(value);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setServiceTaker(ServiceTakerModel? value) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.setServiceTaker');
    try {
      return super.setServiceTaker(value);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSyndicate(SyndicateModel? value) {
    final _$actionInfo = _$UserControllerBaseActionController.startAction(
        name: 'UserControllerBase.setSyndicate');
    try {
      return super.setSyndicate(value);
    } finally {
      _$UserControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
worker: ${worker},
serviceTaker: ${serviceTaker},
syndicate: ${syndicate},
isLoggedIn: ${isLoggedIn},
isLoggedInKeep: ${isLoggedInKeep}
    ''';
  }
}
