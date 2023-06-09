// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileController on ProfileControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'ProfileControllerBase._status', context: context);

  ProfileStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  ProfileStateStatus get _status => status;

  @override
  set _status(ProfileStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'ProfileControllerBase._errorMessage', context: context);

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

  late final _$imageAtom =
      Atom(name: 'ProfileControllerBase.image', context: context);

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

  late final _$_urlImageAtom =
      Atom(name: 'ProfileControllerBase._urlImage', context: context);

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

  late final _$uploadImageAsyncAction =
      AsyncAction('ProfileControllerBase.uploadImage', context: context);

  @override
  Future<void> uploadImage(Uint8List? imageUint, String userId) {
    return _$uploadImageAsyncAction
        .run(() => super.uploadImage(imageUint, userId));
  }

  late final _$ProfileControllerBaseActionController =
      ActionController(name: 'ProfileControllerBase', context: context);

  @override
  void setImage(Uint8List value) {
    final _$actionInfo = _$ProfileControllerBaseActionController.startAction(
        name: 'ProfileControllerBase.setImage');
    try {
      return super.setImage(value);
    } finally {
      _$ProfileControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
image: ${image}
    ''';
  }
}