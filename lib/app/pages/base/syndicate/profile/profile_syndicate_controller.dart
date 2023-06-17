import 'dart:typed_data';

import 'package:mobx/mobx.dart';

import '../../../../models/syndicate_model.dart';
import '../../../../services/user/user_service.dart';
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
    _status = ProfileSyndicateStateStatus.loading;
    final Uint8List? file = imageUint;
    image = imageUint;
    if (file != null) {
      _urlImage = await UserService().uploadImage(file, userId);
    }
    _status = ProfileSyndicateStateStatus.uploadImage;
    // _status = ProfileStateStatus.error;
  }
}
