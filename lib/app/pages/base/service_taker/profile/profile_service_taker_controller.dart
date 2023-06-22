import 'dart:developer';
import 'dart:typed_data';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../models/service_taker_model.dart';
import '../../../../services/service_taker/service_taker_service.dart';
import '../../../../services/user/user_service.dart';
import '../../../auth/user_controller.dart';
part 'profile_service_taker_controller.g.dart';

enum ProfileServiceTakerStateStatus {
  initial,
  loading,
  loaded,
  error,
  uploadImage,
}

class ProfileServiceTakerController = ProfileServiceTakerControllerBase
    with _$ProfileServiceTakerController;

abstract class ProfileServiceTakerControllerBase with Store {
  @readonly
  var _status = ProfileServiceTakerStateStatus.initial;

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
  ServiceTakerModel? stModel;

  @action
  void setSynModel(ServiceTakerModel value) => stModel = value;

  @action
  void setImage(Uint8List value) => image = value;

  @action
  Future<void> uploadImage(Uint8List? imageUint, String userId) async {
    try {
      _status = ProfileServiceTakerStateStatus.loading;
      final Uint8List? file = imageUint;
      image = imageUint;
      if (file != null) {
        _urlImage = await UserService().uploadImage(file, userId);
      }
      final getData = GetIt.I<UserController>().user as ServiceTakerModel;
      final saveData = getData.copyWith(imageUrl: _urlImage);
      await ServiceTakerService().serviceTakerUpdate(saveData);
      _status = ProfileServiceTakerStateStatus.uploadImage;
    } on Exception catch (e, s) {
      log('Erro ao salvar foto do usuário', error: e, stackTrace: s);
      _errorMessage = 'Erro ao salvar foto do usuário';
      _status = ProfileServiceTakerStateStatus.error;
    }
  }
}
