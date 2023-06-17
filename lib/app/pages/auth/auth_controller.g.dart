// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$AuthController on AuthControllerBase, Store {
  Computed<bool>? _$isLoggedInComputed;

  @override
  bool get isLoggedIn =>
      (_$isLoggedInComputed ??= Computed<bool>(() => super.isLoggedIn,
              name: 'AuthControllerBase.isLoggedIn'))
          .value;
  Computed<bool>? _$isLoggedInKeepComputed;

  @override
  bool get isLoggedInKeep =>
      (_$isLoggedInKeepComputed ??= Computed<bool>(() => super.isLoggedInKeep,
              name: 'AuthControllerBase.isLoggedInKeep'))
          .value;

  late final _$authAtom =
      Atom(name: 'AuthControllerBase.auth', context: context);

  @override
  AuthModel? get auth {
    _$authAtom.reportRead();
    return super.auth;
  }

  @override
  set auth(AuthModel? value) {
    _$authAtom.reportWrite(value, super.auth, () {
      super.auth = value;
    });
  }

  late final _$_keepLoggedAtom =
      Atom(name: 'AuthControllerBase._keepLogged', context: context);

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

  late final _$_getCurrentUserAsyncAction =
      AsyncAction('AuthControllerBase._getCurrentUser', context: context);

  @override
  Future<void> _getCurrentUser() {
    return _$_getCurrentUserAsyncAction.run(() => super._getCurrentUser());
  }

  late final _$logoutAsyncAction =
      AsyncAction('AuthControllerBase.logout', context: context);

  @override
  Future<void> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  late final _$AuthControllerBaseActionController =
      ActionController(name: 'AuthControllerBase', context: context);

  @override
  void setAuth(AuthModel? value) {
    final _$actionInfo = _$AuthControllerBaseActionController.startAction(
        name: 'AuthControllerBase.setAuth');
    try {
      return super.setAuth(value);
    } finally {
      _$AuthControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
auth: ${auth},
isLoggedIn: ${isLoggedIn},
isLoggedInKeep: ${isLoggedInKeep}
    ''';
  }
}
