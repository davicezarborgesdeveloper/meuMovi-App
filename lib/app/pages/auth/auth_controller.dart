import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../core/global/constants.dart';
import '../../core/storage/storage.dart';
import '../../models/auth_model.dart';
import '../../models/service_taker_model.dart';
import '../../models/syndicate_model.dart';
import '../../models/worker_model.dart';
import '../../services/user/user_service.dart';
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
  void setAuth(AuthModel? value) {
    auth = null;
    auth = value;
  }

  @action
  Future<void> _getCurrentUser() async {
    _keepLogged =
        (await Storage().getBool(SharedStoreKeys.keepLogged.key)) ?? false;

    if (_keepLogged) {
      final userShared =
          await Storage().getData(SharedStoreKeys.authAccess.key);
      if (userShared != null) {
        setAuth(AuthModel.fromJson(userShared));
      } else {
        setAuth(null);
      }
    } else {
      setAuth(null);
    }
  }

  @action
  Future<void> logout() async {
    auth = null;
    Storage().clean();
    GetIt.I<UserController>().setUser(null);
  }

  @action
  Future<void> deleteUser() async {
    final data = GetIt.I<UserController>().user;
    late String? userId;
    if (data is WorkerModel) {
      userId = data.user;
    } else if (data is ServiceTakerModel) {
      userId = data.user;
    } else if (data is SyndicateModel) {
      userId = data.user;
    }
    await UserService().deleteDocument(userId!);
    auth = null;
    Storage().clean();
    GetIt.I<UserController>().setUser(null);
  }

  @computed
  bool get isLoggedIn => auth != null;

  @computed
  bool get isLoggedInKeep => auth != null && _keepLogged;
}
