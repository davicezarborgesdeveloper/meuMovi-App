import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../core/exceptions/unauthorized_exception.dart';
import '../../../core/extensions/validator_extensions.dart';
import '../../../services/auth/auth_service.dart';
import '../auth_controller.dart';
import '../user_controller.dart';
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

  // @observable
  // String? cpf;

  @observable
  String? email;

  @observable
  String? password;

  @observable
  bool rememberMe = false;

  @action
  void invalidSendPressed() => _showErrors = true;

  // @action
  // void setCpf(String value) => cpf = value;

  @action
  void setEmail(String value) => email = value;

  @action
  void setPassword(String value) => password = value;

  @action
  void setRememberMe(bool value) => rememberMe = value;

  // @computed
  // bool get cpfValid => cpf != null && cpf!.isCPFValid;
  // String? get cpfError {
  //   if (!_showErrors || cpfValid) {
  //     return null;
  //   } else if (cpf != null && cpf!.isEmpty) {
  //     return 'CPF Obrigatório';
  //   } else if (!cpf!.isCPFValid) {
  //     return 'CPF inválido';
  //   } else {
  //     return 'CPF muito curto';
  //   }
  // }

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
  bool get emailValid => email != null && email!.isEmailValid;
  String? get emailError {
    if (!_showErrors || emailValid) {
      return null;
    } else if (email == null || email!.isEmpty) {
      return 'Campo obrigatório';
    } else {
      return 'E-mail inválido';
    }
  }

  @computed
  bool get isFormValid => emailValid && passwordValid;

  @computed
  dynamic get sendPressed => isFormValid ? login : null;

  @action
  Future<void> login() async {
    try {
      _status = LoginStateStatus.loading;
      final auth = await AuthService().login(email!, password!, rememberMe);
      GetIt.I<AuthController>().setAuth(auth);
      GetIt.I<UserController>().getCurrentUser(auth!.uid);
      _status = LoginStateStatus.success;
    } on UnauthorizedException {
      _errorMessage = 'Login ou senha inválidos';
      _status = LoginStateStatus.error;
    } catch (e, s) {
      log('Erro ao realizar login', error: e, stackTrace: s);
      _errorMessage = 'Tente novamente mais tarde';
      _status = LoginStateStatus.error;
    }
  }
}
