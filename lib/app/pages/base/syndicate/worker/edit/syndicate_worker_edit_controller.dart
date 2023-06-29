import 'dart:typed_data';

import 'package:mobx/mobx.dart';

part 'syndicate_worker_edit_controller.g.dart';

enum ProfileWorkerStateStatus {
  initial,
  loading,
  loaded,
  error,
  uploadImage,
}

class SyndicateWorkerEditController = SyndicateWorkerEditControllerBase
    with _$SyndicateWorkerEditController;

abstract class SyndicateWorkerEditControllerBase with Store {
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

  @action
  void setImage(Uint8List value) => image = value;

  // @action
  // Future<void> uploadImage(Uint8List? imageUint, String userId) async {
  //   try {
  //     _status = ProfileWorkerStateStatus.loading;
  //     final Uint8List? file = imageUint;
  //     image = imageUint;
  //     if (file != null) {
  //       _urlImage = await UserService().uploadImage(file, userId);
  //     }
  //     final getData = GetIt.I<UserController>().user as WorkerModel;
  //     final saveData = getData.copyWith(imageUrl: _urlImage);
  //     await WorkerService().workerUpdate(saveData);
  //     _status = ProfileWorkerStateStatus.uploadImage;
  //   } on Exception catch (e, s) {
  //     log('Erro ao salvar foto do usuário', error: e, stackTrace: s);
  //     _errorMessage = 'Erro ao salvar foto do usuário';
  //     _status = ProfileWorkerStateStatus.error;
  //   }
  // }
}
