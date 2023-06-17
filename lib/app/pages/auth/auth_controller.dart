import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../core/global/constants.dart';
import '../../core/storage/storage.dart';
import '../../models/auth_model.dart';
import 'user_controller.dart';
part 'auth_controller.g.dart';

class AuthController = AuthControllerBase with _$AuthController;

abstract class AuthControllerBase with Store {
  AuthControllerBase() {
    _getCurrentUser();
  }

  @observable
  AuthModel? auth;

  @readonly
  bool _keepLogged = false;

  @action
  void setAuth(AuthModel? value) => auth = value;

  @action
  Future<void> _getCurrentUser() async {
    _keepLogged =
        (await Storage().getBool(SharedStoreKeys.keepLogged.key)) ?? false;

    if (_keepLogged) {
      final userShared =
          await Storage().getData(SharedStoreKeys.authAccess.key);
      if (userShared != null) {
        setAuth(AuthModel.fromJson(userShared));
        // GetIt.I<UserController>().getCurrentUser(auth!.uid);
      } else {
        setAuth(null);
      }
    } else {
      setAuth(null);
    }
  }

  @action
  Future<void> logout() async {
    setAuth(null);
    GetIt.I<UserController>().setUser(null);
  }

  // @action
  // Future<void> deleteUser() async {
  //   final UserModel? um = GetIt.I<UserController>().user;
  //   um!.copyWith(active: false);
  //   await AuthService().deleteUser();
  //   await UserService().update(um);
  //   setAuth(null);
  //   GetIt.I<UserController>().setUser(null);
  // }

  @computed
  bool get isLoggedIn => auth != null;

  @computed
  bool get isLoggedInKeep => auth != null && _keepLogged;
}
