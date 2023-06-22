// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_service_taker_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileServiceTakerController
    on ProfileServiceTakerControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'ProfileServiceTakerControllerBase._status', context: context);

  ProfileServiceTakerStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  ProfileServiceTakerStateStatus get _status => status;

  @override
  set _status(ProfileServiceTakerStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'ProfileServiceTakerControllerBase._errorMessage',
      context: context);

  String? get errorMessage {
    _$_errorMessageAtom.reportRead();
    return super._errorMessage;
  }

  @override
  String? get _errorMessage => errorMessage;

  @override
  set _errorMessage(String? value) {
    _$_errorMessageAtom.reportWrite(value, super._errorMessage, () {
      super._errorMessage = value;
    });
  }

  late final _$_fantasyNameAtom = Atom(
      name: 'ProfileServiceTakerControllerBase._fantasyName', context: context);

  String? get fantasyName {
    _$_fantasyNameAtom.reportRead();
    return super._fantasyName;
  }

  @override
  String? get _fantasyName => fantasyName;

  @override
  set _fantasyName(String? value) {
    _$_fantasyNameAtom.reportWrite(value, super._fantasyName, () {
      super._fantasyName = value;
    });
  }

  late final _$_cnpjAtom =
      Atom(name: 'ProfileServiceTakerControllerBase._cnpj', context: context);

  String? get cnpj {
    _$_cnpjAtom.reportRead();
    return super._cnpj;
  }

  @override
  String? get _cnpj => cnpj;

  @override
  set _cnpj(String? value) {
    _$_cnpjAtom.reportWrite(value, super._cnpj, () {
      super._cnpj = value;
    });
  }

  late final _$imageAtom =
      Atom(name: 'ProfileServiceTakerControllerBase.image', context: context);

  @override
  Uint8List? get image {
    _$imageAtom.reportRead();
    return super.image;
  }

  @override
  set image(Uint8List? value) {
    _$imageAtom.reportWrite(value, super.image, () {
      super.image = value;
    });
  }

  late final _$_urlImageAtom = Atom(
      name: 'ProfileServiceTakerControllerBase._urlImage', context: context);

  String? get urlImage {
    _$_urlImageAtom.reportRead();
    return super._urlImage;
  }

  @override
  String? get _urlImage => urlImage;

  @override
  set _urlImage(String? value) {
    _$_urlImageAtom.reportWrite(value, super._urlImage, () {
      super._urlImage = value;
    });
  }

  late final _$stModelAtom =
      Atom(name: 'ProfileServiceTakerControllerBase.stModel', context: context);

  @override
  ServiceTakerModel? get stModel {
    _$stModelAtom.reportRead();
    return super.stModel;
  }

  @override
  set stModel(ServiceTakerModel? value) {
    _$stModelAtom.reportWrite(value, super.stModel, () {
      super.stModel = value;
    });
  }

  late final _$uploadImageAsyncAction = AsyncAction(
      'ProfileServiceTakerControllerBase.uploadImage',
      context: context);

  @override
  Future<void> uploadImage(Uint8List? imageUint, String userId) {
    return _$uploadImageAsyncAction
        .run(() => super.uploadImage(imageUint, userId));
  }

  late final _$ProfileServiceTakerControllerBaseActionController =
      ActionController(
          name: 'ProfileServiceTakerControllerBase', context: context);

  @override
  void setSynModel(ServiceTakerModel value) {
    final _$actionInfo = _$ProfileServiceTakerControllerBaseActionController
        .startAction(name: 'ProfileServiceTakerControllerBase.setSynModel');
    try {
      return super.setSynModel(value);
    } finally {
      _$ProfileServiceTakerControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setImage(Uint8List value) {
    final _$actionInfo = _$ProfileServiceTakerControllerBaseActionController
        .startAction(name: 'ProfileServiceTakerControllerBase.setImage');
    try {
      return super.setImage(value);
    } finally {
      _$ProfileServiceTakerControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
image: ${image},
stModel: ${stModel}
    ''';
  }
}
