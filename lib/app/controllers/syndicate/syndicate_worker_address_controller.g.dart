// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syndicate_worker_address_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SyndicateWorkerAddressController
    on SyndicateWorkerAddressControllerBase, Store {
  Computed<bool>? _$zipValidComputed;

  @override
  bool get zipValid =>
      (_$zipValidComputed ??= Computed<bool>(() => super.zipValid,
              name: 'SyndicateWorkerAddressControllerBase.zipValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'SyndicateWorkerAddressControllerBase.isFormValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: 'SyndicateWorkerAddressControllerBase.sendPressed'))
          .value;

  late final _$_statusAtom = Atom(
      name: 'SyndicateWorkerAddressControllerBase._status', context: context);

  SyndicateWorkerAddressStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  SyndicateWorkerAddressStateStatus get _status => status;

  @override
  set _status(SyndicateWorkerAddressStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'SyndicateWorkerAddressControllerBase._errorMessage',
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

  late final _$_showErrorsAtom = Atom(
      name: 'SyndicateWorkerAddressControllerBase._showErrors',
      context: context);

  bool get showErrors {
    _$_showErrorsAtom.reportRead();
    return super._showErrors;
  }

  @override
  bool get _showErrors => showErrors;

  @override
  set _showErrors(bool value) {
    _$_showErrorsAtom.reportWrite(value, super._showErrors, () {
      super._showErrors = value;
    });
  }

  late final _$_workerModelAtom = Atom(
      name: 'SyndicateWorkerAddressControllerBase._workerModel',
      context: context);

  WorkerModel? get workerModel {
    _$_workerModelAtom.reportRead();
    return super._workerModel;
  }

  @override
  WorkerModel? get _workerModel => workerModel;

  @override
  set _workerModel(WorkerModel? value) {
    _$_workerModelAtom.reportWrite(value, super._workerModel, () {
      super._workerModel = value;
    });
  }

  late final _$zipAtom =
      Atom(name: 'SyndicateWorkerAddressControllerBase.zip', context: context);

  @override
  String? get zip {
    _$zipAtom.reportRead();
    return super.zip;
  }

  @override
  set zip(String? value) {
    _$zipAtom.reportWrite(value, super.zip, () {
      super.zip = value;
    });
  }

  late final _$cityAtom =
      Atom(name: 'SyndicateWorkerAddressControllerBase.city', context: context);

  @override
  String? get city {
    _$cityAtom.reportRead();
    return super.city;
  }

  @override
  set city(String? value) {
    _$cityAtom.reportWrite(value, super.city, () {
      super.city = value;
    });
  }

  late final _$stateAtom = Atom(
      name: 'SyndicateWorkerAddressControllerBase.state', context: context);

  @override
  String? get state {
    _$stateAtom.reportRead();
    return super.state;
  }

  @override
  set state(String? value) {
    _$stateAtom.reportWrite(value, super.state, () {
      super.state = value;
    });
  }

  late final _$streetAtom = Atom(
      name: 'SyndicateWorkerAddressControllerBase.street', context: context);

  @override
  String? get street {
    _$streetAtom.reportRead();
    return super.street;
  }

  @override
  set street(String? value) {
    _$streetAtom.reportWrite(value, super.street, () {
      super.street = value;
    });
  }

  late final _$districtAtom = Atom(
      name: 'SyndicateWorkerAddressControllerBase.district', context: context);

  @override
  String? get district {
    _$districtAtom.reportRead();
    return super.district;
  }

  @override
  set district(String? value) {
    _$districtAtom.reportWrite(value, super.district, () {
      super.district = value;
    });
  }

  late final _$numberAtom = Atom(
      name: 'SyndicateWorkerAddressControllerBase.number', context: context);

  @override
  String? get number {
    _$numberAtom.reportRead();
    return super.number;
  }

  @override
  set number(String? value) {
    _$numberAtom.reportWrite(value, super.number, () {
      super.number = value;
    });
  }

  late final _$complementAtom = Atom(
      name: 'SyndicateWorkerAddressControllerBase.complement',
      context: context);

  @override
  String? get complement {
    _$complementAtom.reportRead();
    return super.complement;
  }

  @override
  set complement(String? value) {
    _$complementAtom.reportWrite(value, super.complement, () {
      super.complement = value;
    });
  }

  late final _$termsAcceptedAtom = Atom(
      name: 'SyndicateWorkerAddressControllerBase.termsAccepted',
      context: context);

  @override
  bool get termsAccepted {
    _$termsAcceptedAtom.reportRead();
    return super.termsAccepted;
  }

  @override
  set termsAccepted(bool value) {
    _$termsAcceptedAtom.reportWrite(value, super.termsAccepted, () {
      super.termsAccepted = value;
    });
  }

  late final _$searchZipAsyncAction = AsyncAction(
      'SyndicateWorkerAddressControllerBase.searchZip',
      context: context);

  @override
  Future<void> searchZip(String zipFilter) {
    return _$searchZipAsyncAction.run(() => super.searchZip(zipFilter));
  }

  late final _$getDataAsyncAction = AsyncAction(
      'SyndicateWorkerAddressControllerBase.getData',
      context: context);

  @override
  Future<void> getData(WorkerModel worker) {
    return _$getDataAsyncAction.run(() => super.getData(worker));
  }

  late final _$registerAsyncAction = AsyncAction(
      'SyndicateWorkerAddressControllerBase.register',
      context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$SyndicateWorkerAddressControllerBaseActionController =
      ActionController(
          name: 'SyndicateWorkerAddressControllerBase', context: context);

  @override
  void setZip(String value) {
    final _$actionInfo = _$SyndicateWorkerAddressControllerBaseActionController
        .startAction(name: 'SyndicateWorkerAddressControllerBase.setZip');
    try {
      return super.setZip(value);
    } finally {
      _$SyndicateWorkerAddressControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCity(String value) {
    final _$actionInfo = _$SyndicateWorkerAddressControllerBaseActionController
        .startAction(name: 'SyndicateWorkerAddressControllerBase.setCity');
    try {
      return super.setCity(value);
    } finally {
      _$SyndicateWorkerAddressControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setState(String value) {
    final _$actionInfo = _$SyndicateWorkerAddressControllerBaseActionController
        .startAction(name: 'SyndicateWorkerAddressControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$SyndicateWorkerAddressControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setStreet(String value) {
    final _$actionInfo = _$SyndicateWorkerAddressControllerBaseActionController
        .startAction(name: 'SyndicateWorkerAddressControllerBase.setStreet');
    try {
      return super.setStreet(value);
    } finally {
      _$SyndicateWorkerAddressControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDistrict(String value) {
    final _$actionInfo = _$SyndicateWorkerAddressControllerBaseActionController
        .startAction(name: 'SyndicateWorkerAddressControllerBase.setDistrict');
    try {
      return super.setDistrict(value);
    } finally {
      _$SyndicateWorkerAddressControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setNumber(String value) {
    final _$actionInfo = _$SyndicateWorkerAddressControllerBaseActionController
        .startAction(name: 'SyndicateWorkerAddressControllerBase.setNumber');
    try {
      return super.setNumber(value);
    } finally {
      _$SyndicateWorkerAddressControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setComplement(String value) {
    final _$actionInfo =
        _$SyndicateWorkerAddressControllerBaseActionController.startAction(
            name: 'SyndicateWorkerAddressControllerBase.setComplement');
    try {
      return super.setComplement(value);
    } finally {
      _$SyndicateWorkerAddressControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo =
        _$SyndicateWorkerAddressControllerBaseActionController.startAction(
            name: 'SyndicateWorkerAddressControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$SyndicateWorkerAddressControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
zip: ${zip},
city: ${city},
state: ${state},
street: ${street},
district: ${district},
number: ${number},
complement: ${complement},
termsAccepted: ${termsAccepted},
zipValid: ${zipValid},
isFormValid: ${isFormValid},
sendPressed: ${sendPressed}
    ''';
  }
}
