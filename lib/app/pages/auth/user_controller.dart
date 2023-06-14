import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../core/global/constants.dart';
import '../../core/rest_client/custom_dio.dart';
import '../../core/storage/storage.dart';
import '../../models/new/user_model.dart';
import '../../repositories/user/user_repository.dart';
part 'user_controller.g.dart';

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {
  @observable
  UserModel? user;

  @action
  void setUser(UserModel? value) => user = value;

  @action
  Future<void> getCurrentUser(String userId) async {
    try {
      final usr = await UserRepository(CustomDio()).getUserById(userId);
      await Storage().setData(
        SharedStoreKeys.authAccess.key,
        usr!.toJson(),
      );
      setUser(usr);
    } catch (e, s) {
      log('Erro ao buscar informações do usuario', error: e, stackTrace: s);
    }
  }
}
