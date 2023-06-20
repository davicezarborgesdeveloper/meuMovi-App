// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_worker_address_data_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileWorkerAddressDataController
    on ProfileWorkerAddressDataControllerBase, Store {
  Computed<bool>? _$zipValidComputed;

  @override
  bool get zipValid =>
      (_$zipValidComputed ??= Computed<bool>(() => super.zipValid,
              name: 'ProfileWorkerAddressDataControllerBase.zipValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'ProfileWorkerAddressDataControllerBase.isFormValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: 'ProfileWorkerAddressDataControllerBase.sendPressed'))
          .value;

  late final _$_statusAtom = Atom(
      name: 'ProfileWorkerAddressDataControllerBase._status', context: context);

  ProfileWorkerAddressDataStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  ProfileWorkerAddressDataStateStatus get _status => status;

  @override
  set _status(ProfileWorkerAddressDataStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'ProfileWorkerAddressDataControllerBase._errorMessage',
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
      name: 'ProfileWorkerAddressDataControllerBase._showErrors',
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

  late final _$zipAtom = Atom(
      name: 'ProfileWorkerAddressDataControllerBase.zip', context: context);

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

  late final _$cityAtom = Atom(
      name: 'ProfileWorkerAddressDataControllerBase.city', context: context);

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
      name: 'ProfileWorkerAddressDataControllerBase.state', context: context);

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
      name: 'ProfileWorkerAddressDataControllerBase.street', context: context);

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
      name: 'ProfileWorkerAddressDataControllerBase.district',
      context: context);

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
      name: 'ProfileWorkerAddressDataControllerBase.number', context: context);

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
      name: 'ProfileWorkerAddressDataControllerBase.complement',
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

  late final _$referencePointAtom = Atom(
      name: 'ProfileWorkerAddressDataControllerBase.referencePoint',
      context: context);

  @override
  String? get referencePoint {
    _$referencePointAtom.reportRead();
    return super.referencePoint;
  }

  @override
  set referencePoint(String? value) {
    _$referencePointAtom.reportWrite(value, super.referencePoint, () {
      super.referencePoint = value;
    });
  }

  late final _$searchZipAsyncAction = AsyncAction(
      'ProfileWorkerAddressDataControllerBase.searchZip',
      context: context);

  @override
  Future<void> searchZip(String zipFilter) {
    return _$searchZipAsyncAction.run(() => super.searchZip(zipFilter));
  }

  late final _$saveAsyncAction = AsyncAction(
      'ProfileWorkerAddressDataControllerBase.save',
      context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$getDataAsyncAction = AsyncAction(
      'ProfileWorkerAddressDataControllerBase.getData',
      context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$ProfileWorkerAddressDataControllerBaseActionController =
      ActionController(
          name: 'ProfileWorkerAddressDataControllerBase', context: context);

  @override
  void setZip(String value) {
    final _$actionInfo =
        _$ProfileWorkerAddressDataControllerBaseActionController.startAction(
            name: 'ProfileWorkerAddressDataControllerBase.setZip');
    try {
      return super.setZip(value);
    } finally {
      _$ProfileWorkerAddressDataControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCity(String value) {
    final _$actionInfo =
        _$ProfileWorkerAddressDataControllerBaseActionController.startAction(
            name: 'ProfileWorkerAddressDataControllerBase.setCity');
    try {
      return super.setCity(value);
    } finally {
      _$ProfileWorkerAddressDataControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setState(String value) {
    final _$actionInfo =
        _$ProfileWorkerAddressDataControllerBaseActionController.startAction(
            name: 'ProfileWorkerAddressDataControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$ProfileWorkerAddressDataControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setStreet(String value) {
    final _$actionInfo =
        _$ProfileWorkerAddressDataControllerBaseActionController.startAction(
            name: 'ProfileWorkerAddressDataControllerBase.setStreet');
    try {
      return super.setStreet(value);
    } finally {
      _$ProfileWorkerAddressDataControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDistrict(String value) {
    final _$actionInfo =
        _$ProfileWorkerAddressDataControllerBaseActionController.startAction(
            name: 'ProfileWorkerAddressDataControllerBase.setDistrict');
    try {
      return super.setDistrict(value);
    } finally {
      _$ProfileWorkerAddressDataControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setNumber(String value) {
    final _$actionInfo =
        _$ProfileWorkerAddressDataControllerBaseActionController.startAction(
            name: 'ProfileWorkerAddressDataControllerBase.setNumber');
    try {
      return super.setNumber(value);
    } finally {
      _$ProfileWorkerAddressDataControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setComplement(String value) {
    final _$actionInfo =
        _$ProfileWorkerAddressDataControllerBaseActionController.startAction(
            name: 'ProfileWorkerAddressDataControllerBase.setComplement');
    try {
      return super.setComplement(value);
    } finally {
      _$ProfileWorkerAddressDataControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setReferencePoint(String value) {
    final _$actionInfo =
        _$ProfileWorkerAddressDataControllerBaseActionController.startAction(
            name: 'ProfileWorkerAddressDataControllerBase.setReferencePoint');
    try {
      return super.setReferencePoint(value);
    } finally {
      _$ProfileWorkerAddressDataControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo =
        _$ProfileWorkerAddressDataControllerBaseActionController.startAction(
            name: 'ProfileWorkerAddressDataControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$ProfileWorkerAddressDataControllerBaseActionController
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
referencePoint: ${referencePoint},
zipValid: ${zipValid},
isFormValid: ${isFormValid},
sendPressed: ${sendPressed}
    ''';
  }
}
