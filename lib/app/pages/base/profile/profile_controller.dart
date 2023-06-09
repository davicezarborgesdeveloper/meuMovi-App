import 'dart:typed_data';

import 'package:mobx/mobx.dart';

import '../../../services/user/user_service.dart';
part 'profile_controller.g.dart';

enum ProfileStateStatus {
  initial,
  loading,
  loaded,
  error,
  uploadImage,
}

class ProfileController = ProfileControllerBase with _$ProfileController;

abstract class ProfileControllerBase with Store {
  @readonly
  var _status = ProfileStateStatus.initial;

  @readonly
  String? _errorMessage;

  @observable
  Uint8List? image;

  @readonly
  String? _urlImage;

  @action
  void setImage(Uint8List value) => image = value;

  @action
  Future<void> uploadImage(Uint8List? imageUint, String userId) async {
    _status = ProfileStateStatus.loading;
    final Uint8List? file = imageUint;
    image = imageUint;
    if (file != null) {
      _urlImage = await UserService().uploadImage(file, userId);
    }
    _status = ProfileStateStatus.uploadImage;
    // _status = ProfileStateStatus.error;
  }
}
