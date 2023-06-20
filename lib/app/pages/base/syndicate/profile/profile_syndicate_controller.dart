import 'dart:developer';
import 'dart:typed_data';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../models/syndicate_model.dart';
import '../../../../services/user/user_service.dart';
import '../../../auth/user_controller.dart';
part 'profile_syndicate_controller.g.dart';

enum ProfileSyndicateStateStatus {
  initial,
  loading,
  loaded,
  error,
  uploadImage,
}

class ProfileSyndicateController = ProfileSyndicateControllerBase
    with _$ProfileSyndicateController;

abstract class ProfileSyndicateControllerBase with Store {
  @readonly
  var _status = ProfileSyndicateStateStatus.initial;

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
      _status = ProfileSyndicateStateStatus.loading;
      final Uint8List? file = imageUint;
      image = imageUint;
      if (file != null) {
        _urlImage = await UserService().uploadImage(file, userId);
      }
      final getData = GetIt.I<UserController>().user as SyndicateModel;
      final saveData = getData.copyWith(imageUrl: _urlImage);
      await UserService().syndicateUpdate(saveData);
      _status = ProfileSyndicateStateStatus.uploadImage;
    } on Exception catch (e, s) {
      log('Erro ao salvar foto do usuário', error: e, stackTrace: s);
      _errorMessage = 'Erro ao salvar foto do usuário';
      _status = ProfileSyndicateStateStatus.error;
    }
  }
}
