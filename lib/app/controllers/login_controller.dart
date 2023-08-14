import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../core/exceptions/repository_exception.dart';
import '../services/auth/login_service.dart';
import '../core/exceptions/unauthorized_exception.dart';
import '../core/extensions/validator_extensions.dart';
import 'user_controller.dart';
part 'login_controller.g.dart';

enum LoginStateStatus {
  initial,
  loading,
  success,
  error,
}

class LoginController = LoginControllerBase with _$LoginController;

abstract class LoginControllerBase with Store {
  @readonly
  var _status = LoginStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  @observable
  String? userLogin;

  @observable
  String? password;

  @observable
  bool rememberMe = false;

  @readonly
  int? _loginType;

  @action
  void invalidSendPressed() => _showErrors = true;

  @action
  void setUserLogin(String value) => userLogin = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setRememberMe(bool value) => rememberMe = value;

  @computed
  bool get userLoginValid {
    if (userLogin != null) {
      if (userLogin!.length > 14) {
        return userLogin!.isCNPJValid;
      } else {
        return userLogin!.isCPFValid;
      }
    } else {
      return false;
    }
  }

  String? get userLoginError {
    if (!_showErrors || userLoginValid) {
      return null;
    } else if (userLogin != null) {
      if (userLogin!.isEmpty) {
        return 'login Obrigatório';
      } else if (userLogin!.length == 14 && !userLogin!.isCPFValid) {
        return 'CPF inválido';
      } else if (userLogin!.length == 18 && !userLogin!.isCNPJValid) {
        return 'CNPJ inválido';
      } else {
        return 'login muito curto';
      }
    } else {
      return 'login Obrigatório';
    }
  }

  @computed
  bool get passwordValid => password != null && password!.length >= 4;
  String? get passwordError {
    if (!_showErrors || passwordValid) {
      return null;
    } else if (password != null && password!.isNotEmpty) {
      return 'Senha Obrigatória';
    } else {
      return 'Senha muito curta';
    }
  }

  @computed
  bool get isFormValid => userLoginValid && passwordValid;

  @computed
  dynamic get sendPressed => isFormValid ? login : null;

  @action
  Future<void> login() async {
    try {
      _status = LoginStateStatus.loading;
      final tokenDecoded =
          await LoginService().execute(userLogin!, password!, rememberMe);
      _loginType = tokenDecoded['profileType'];
      await GetIt.I<UserController>().getCurrentUser();
      _status = LoginStateStatus.success;
    } on UnauthorizedException {
      _errorMessage = 'Login ou senha inválidos';
      _status = LoginStateStatus.error;
    } on RepositoryException {
      _errorMessage = 'Tente novamente mais tarde';
      _status = LoginStateStatus.error;
    } catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      _errorMessage = 'Tente novamente mais tarde';
      _status = LoginStateStatus.error;
    }
  }
}
