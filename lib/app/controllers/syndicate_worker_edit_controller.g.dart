// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syndicate_worker_edit_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SyndicateWorkerEditController
    on SyndicateWorkerEditControllerBase, Store {
  late final _$_statusAtom =
      Atom(name: 'SyndicateWorkerEditControllerBase._status', context: context);

  SyndicateWorkerEditStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  SyndicateWorkerEditStateStatus get _status => status;

  @override
  set _status(SyndicateWorkerEditStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'SyndicateWorkerEditControllerBase._errorMessage',
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
      name: 'SyndicateWorkerEditControllerBase._fantasyName', context: context);

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
      Atom(name: 'SyndicateWorkerEditControllerBase._cnpj', context: context);

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

  late final _$workerModelAtom = Atom(
      name: 'SyndicateWorkerEditControllerBase.workerModel', context: context);

  @override
  WorkerModel? get workerModel {
    _$workerModelAtom.reportRead();
    return super.workerModel;
  }

  @override
  set workerModel(WorkerModel? value) {
    _$workerModelAtom.reportWrite(value, super.workerModel, () {
      super.workerModel = value;
    });
  }

  late final _$imageAtom =
      Atom(name: 'SyndicateWorkerEditControllerBase.image', context: context);

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
      name: 'SyndicateWorkerEditControllerBase._urlImage', context: context);

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

  late final _$SyndicateWorkerEditControllerBaseActionController =
      ActionController(
          name: 'SyndicateWorkerEditControllerBase', context: context);

  @override
  void setImage(Uint8List value) {
    final _$actionInfo = _$SyndicateWorkerEditControllerBaseActionController
        .startAction(name: 'SyndicateWorkerEditControllerBase.setImage');
    try {
      return super.setImage(value);
    } finally {
      _$SyndicateWorkerEditControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setWorkerModel(WorkerModel value) {
    final _$actionInfo = _$SyndicateWorkerEditControllerBaseActionController
        .startAction(name: 'SyndicateWorkerEditControllerBase.setWorkerModel');
    try {
      return super.setWorkerModel(value);
    } finally {
      _$SyndicateWorkerEditControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
workerModel: ${workerModel},
image: ${image}
    ''';
  }
}
