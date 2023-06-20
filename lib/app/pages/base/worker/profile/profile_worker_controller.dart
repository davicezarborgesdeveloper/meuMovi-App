import 'dart:developer';
import 'dart:typed_data';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../models/syndicate_model.dart';
import '../../../../models/worker_model.dart';
import '../../../../services/user/user_service.dart';
import '../../../auth/user_controller.dart';
part 'profile_worker_controller.g.dart';

enum ProfileWorkerStateStatus {
  initial,
  loading,
  loaded,
  error,
  uploadImage,
}

class ProfileWorkerController = ProfileWorkerControllerBase
    with _$ProfileWorkerController;

abstract class ProfileWorkerControllerBase with Store {
  @readonly
  var _status = ProfileWorkerStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  String? _fantasyName;

  @readonly
  String? _cnpj;

  @observable
  Uint8List? image;

  @readonly
  String? _urlImage;

  @observable
  SyndicateModel? synModel;

  @action
  void setSynModel(SyndicateModel value) => synModel = value;

  @action
  void setImage(Uint8List value) => image = value;

  @action
  Future<void> uploadImage(Uint8List? imageUint, String userId) async {
    try {
      _status = ProfileWorkerStateStatus.loading;
      final Uint8List? file = imageUint;
      image = imageUint;
      if (file != null) {
        _urlImage = await UserService().uploadImage(file, userId);
      }
      final getData = GetIt.I<UserController>().user as WorkerModel;
      final saveData = getData.copyWith(imageUrl: _urlImage);
      await UserService().workerUpdate(saveData);
      _status = ProfileWorkerStateStatus.uploadImage;
    } on Exception catch (e, s) {
      log('Erro ao salvar foto do usuário', error: e, stackTrace: s);
      _errorMessage = 'Erro ao salvar foto do usuário';
      _status = ProfileWorkerStateStatus.error;
    }
  }
}
