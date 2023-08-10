import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:jwt_decoder/jwt_decoder.dart';
import 'package:mobx/mobx.dart';

import '../models/service_taker_model.dart';
import '../models/syndicate_model.dart';
import '../models/worker_model.dart';
import '../services/serviceTaker/service_taker_service.dart';
import '../services/syndicate/syndicate_service.dart';
import '../services/user/user_service.dart';
import '../services/worker/worker_service.dart';
import '../core/global/constants.dart';
import '../core/rest_client/custom_dio.dart';
import '../core/storage/storage.dart';
import 'http_controller.dart';
import 'menu_drawer_controller.dart';
part 'user_controller.g.dart';

enum UserStateStatus {
  initial,
  loading,
  loaded,
  error,
  success,
}

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {
  @readonly
  var _status = UserStateStatus.initial;

  @readonly
  String? _errorMessage;

  @observable
  WorkerModel? worker;

  @observable
  ServiceTakerModel? serviceTaker;

  @observable
  SyndicateModel? syndicate;

  @readonly
  bool _keepLogged = false;

  @action
  void setWorker(WorkerModel? value) => worker = value;

  @action
  void setServiceTaker(ServiceTakerModel? value) => serviceTaker = value;

  @action
  void setSyndicate(SyndicateModel? value) => syndicate = value;

  Future<void> setCleanUser() async {
    setWorker(null);
    setSyndicate(null);
    setServiceTaker(null);
  }

  @action
  Future<void> loadCurrentUser() async {
    _keepLogged =
        (await Storage().getData(SessionStorageKeys.keepLogged.key)) == '1';
    setCleanUser();
    if (_keepLogged) {
      await getCurrentUser();
    }
  }

  @action
  Future<void> getCurrentUser() async {
    final CustomDio dio = GetIt.I<HttpController>().customDio!;
    setCleanUser();
    final String token =
        await Storage().getData(SessionStorageKeys.accessToken.key) ?? '';
    final Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
    GetIt.I<MenuDrawerController>().setMenuType(decodedToken['profileType']);
    switch (decodedToken['profileType']) {
      case 1:
        setServiceTaker(await ServiceTakerService(dio).getByToken(token));
        break;
      case 2:
        setSyndicate(await SyndicateService(dio).getByToken(token));
        break;
      case 3:
        setWorker(await WorkerService(dio).getByToken(token));
        break;
    }
  }

  @action
  Future<void> logout() async {
    Storage().clean();
    setCleanUser();
  }

  @action
  Future<void> deleteUser() async {
    try {
      _status = UserStateStatus.loading;
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      final String token =
          await Storage().getData(SessionStorageKeys.accessToken.key) ?? '';
      final Map<String, dynamic> decodedToken = JwtDecoder.decode(token);
      final String id = decodedToken['login'];
      await UserService(dio).delete(id);
      Storage().clean();
      _status = UserStateStatus.success;
    } catch (e, s) {
      log('Erro ao apagar usuário', error: e, stackTrace: s);
      _errorMessage = 'Erro ao apagar usuário';
      _status = UserStateStatus.error;
    }
  }

  @computed
  bool get isLoggedIn =>
      worker != null || serviceTaker != null || syndicate != null;

  @computed
  bool get isLoggedInKeep =>
      (worker != null || serviceTaker != null || syndicate != null) &&
      _keepLogged;
}
