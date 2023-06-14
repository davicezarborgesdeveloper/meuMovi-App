import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../core/exceptions/unauthorized_exception.dart';
import '../../../core/extensions/validator_extensions.dart';
import '../../../core/global/constants.dart';
import '../../../core/rest_client/custom_dio.dart';
import '../../../core/storage/storage.dart';
import '../../../repositories/auth/auth_repository.dart';
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

  @observable
  String? userLogin;

  // @observable
  // String? email;

  @observable
  String? password;

  @observable
  bool rememberMe = false;

  @action
  void invalidSendPressed() => _showErrors = true;

  @action
  void setUserLogin(String value) => userLogin = value;

  // @action
  // void setEmail(String value) => email = value;

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
    } else if (userLogin != null && userLogin!.isEmpty) {
      return 'CPF Obrigatório';
    } else if (!userLogin!.isCPFValid) {
      return 'CPF inválido';
    } else {
      return 'CPF muito curto';
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

  // @computed
  // bool get emailValid => email != null && email!.isEmailValid;
  // String? get emailError {
  //   if (!_showErrors || emailValid) {
  //     return null;
  //   } else if (email == null || email!.isEmpty) {
  //     return 'Campo obrigatório';
  //   } else {
  //     return 'E-mail inválido';
  //   }
  // }

  @computed
  bool get isFormValid => userLoginValid && passwordValid;

  @computed
  dynamic get sendPressed => isFormValid ? login : null;

  @action
  Future<void> login() async {
    try {
      _status = LoginStateStatus.loading;
      final CustomDio dio = CustomDio();
      final auth = await AuthRepository(dio).login(
        userLogin!.replaceAll(RegExp(r'[^0-9]'), ''),
        password!,
      );
      await Storage()
          .setData(SharedStoreKeys.accessToken.key, auth!.accessToken);

      await Storage().setData(SharedStoreKeys.keepLogged.key, rememberMe);
      GetIt.I<AuthController>().setAuth(auth);
      GetIt.I<UserController>().getCurrentUser(auth.userId);
      _status = LoginStateStatus.success;
    } on UnauthorizedException {
      _errorMessage = 'Login ou senha inválidos';
      _status = LoginStateStatus.error;
    } catch (e, s) {
      log('$e', error: e, stackTrace: s);
      _errorMessage = '$e';
      _status = LoginStateStatus.error;
    }
  }
}
