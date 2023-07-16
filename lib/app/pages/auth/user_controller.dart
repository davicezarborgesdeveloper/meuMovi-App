import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../core/storage/storage.dart';
import '../../models/service_taker_model.dart';
import '../../models/syndicate_model.dart';
import '../../models/user_model.dart';
import '../../models/worker_model.dart';
import '../../services/user/user_service.dart';
part 'user_controller.g.dart';

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {
  UserControllerBase() {
    getCurrentUser();
  }

  @observable
  UserModel? user;

  @observable
  WorkerModel? worker;

  @observable
  ServiceTakerModel? serviceTaker;

  @observable
  SyndicateModel? syndicate;

  @readonly
  bool _keepLogged = false;

  @action
  void setUser(UserModel? value) => user = value;

  @action
  void setWorker(WorkerModel? value) => worker = value;

  @action
  void setServiceTaker(ServiceTakerModel? value) => serviceTaker = value;

  @action
  void setSyndicate(SyndicateModel? value) => syndicate = value;

  Future<void> setCleanUser() async {
    setUser(null);
    setWorker(null);
    setSyndicate(null);
    setServiceTaker(null);
  }

  @action
  Future<void> getCurrentUser([String? userId]) async {
    setCleanUser();
//     if (userId != null) {
//       final user = await UserService().getUserById(userId);
//       if (user is WorkerModel) {
//         setWorker(user);
//       } else if (user is ServiceTakerModel) {
//         setServiceTaker(user);
//       } else {
//         setSyndicate(user as SyndicateModel);
//       }
//     } else {
//       _keepLogged =
//           (await Storage().getBool(SharedStoreKeys.keepLogged.key)) ?? false;
//       setCleanUser();
//       final userShared =
//           await Storage().getData(SharedStoreKeys.authAccess.key);
//       if (userShared != null) {
//       //   try {
//       //     final user =
//       //         await UserService().getUserById(jsonDecode(userShared)['user']);
//       //     if (jsonDecode(userShared)['profileType'] == 0) {
//       //       setServiceTaker(user as ServiceTakerModel);
//       //     } else if (jsonDecode(userShared)['profileType'] == 1) {
//       //       setSyndicate(user as SyndicateModel);
//       //     } else {
//       //       setWorker(user as WorkerModel);
//       //     }
//       //   } catch (e, s) {
//       //     log(
//       //       'Erro ao buscar informações do usuario',
//       //       error: e,
//       //       stackTrace: s,
//       //     );
//       //   }
//       // } else {
//       //   setUser(null);
//       // }
//     }
  }

  @action
  Future<void> logout() async {
    Storage().clean();
    setCleanUser();
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
    Storage().clean();
    setUser(null);
  }

  @computed
  bool get isLoggedIn =>
      worker != null || serviceTaker != null || syndicate != null;

  @computed
  bool get isLoggedInKeep =>
      (worker != null || serviceTaker != null || syndicate != null) &&
      _keepLogged;
}
