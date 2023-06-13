import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../models/user_model_mod.dart';
import '../../services/user/user_service.dart';
part 'user_controller.g.dart';

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {
  @observable
  UserModelMod? user;

  @action
  void setUser(UserModelMod? value) => user = value;

  @action
  Future<void> getCurrentUser(String userId) async {
    try {
      final usr = await UserService().getUserById(userId);
      setUser(usr);
    } catch (e, s) {
      log('Erro ao buscar informações do usuario', error: e, stackTrace: s);
    }
  }
}
