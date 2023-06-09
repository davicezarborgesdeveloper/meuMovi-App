// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_my_address_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ProfileMyAddressController on ProfileMyAddressControllerBase, Store {
  Computed<bool>? _$zipValidComputed;

  @override
  bool get zipValid =>
      (_$zipValidComputed ??= Computed<bool>(() => super.zipValid,
              name: 'ProfileMyAddressControllerBase.zipValid'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'ProfileMyAddressControllerBase.isFormValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: 'ProfileMyAddressControllerBase.sendPressed'))
          .value;

  late final _$_statusAtom =
      Atom(name: 'ProfileMyAddressControllerBase._status', context: context);

  ProfileMyAddressStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  ProfileMyAddressStateStatus get _status => status;

  @override
  set _status(ProfileMyAddressStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'ProfileMyAddressControllerBase._errorMessage', context: context);

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
      name: 'ProfileMyAddressControllerBase._showErrors', context: context);

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

  late final _$zipAtom =
      Atom(name: 'ProfileMyAddressControllerBase.zip', context: context);

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
      Atom(name: 'ProfileMyAddressControllerBase.city', context: context);

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

  late final _$stateAtom =
      Atom(name: 'ProfileMyAddressControllerBase.state', context: context);

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

  late final _$streetAtom =
      Atom(name: 'ProfileMyAddressControllerBase.street', context: context);

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

  late final _$districtAtom =
      Atom(name: 'ProfileMyAddressControllerBase.district', context: context);

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

  late final _$numberAtom =
      Atom(name: 'ProfileMyAddressControllerBase.number', context: context);

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

  late final _$complementAtom =
      Atom(name: 'ProfileMyAddressControllerBase.complement', context: context);

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
      name: 'ProfileMyAddressControllerBase.referencePoint', context: context);

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

  late final _$searchZipAsyncAction =
      AsyncAction('ProfileMyAddressControllerBase.searchZip', context: context);

  @override
  Future<void> searchZip(String zipFilter) {
    return _$searchZipAsyncAction.run(() => super.searchZip(zipFilter));
  }

  late final _$saveAsyncAction =
      AsyncAction('ProfileMyAddressControllerBase.save', context: context);

  @override
  Future<void> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  late final _$getUserDataAsyncAction = AsyncAction(
      'ProfileMyAddressControllerBase.getUserData',
      context: context);

  @override
  Future<void> getUserData() {
    return _$getUserDataAsyncAction.run(() => super.getUserData());
  }

  late final _$ProfileMyAddressControllerBaseActionController =
      ActionController(
          name: 'ProfileMyAddressControllerBase', context: context);

  @override
  void setZip(String value) {
    final _$actionInfo = _$ProfileMyAddressControllerBaseActionController
        .startAction(name: 'ProfileMyAddressControllerBase.setZip');
    try {
      return super.setZip(value);
    } finally {
      _$ProfileMyAddressControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCity(String value) {
    final _$actionInfo = _$ProfileMyAddressControllerBaseActionController
        .startAction(name: 'ProfileMyAddressControllerBase.setCity');
    try {
      return super.setCity(value);
    } finally {
      _$ProfileMyAddressControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setState(String value) {
    final _$actionInfo = _$ProfileMyAddressControllerBaseActionController
        .startAction(name: 'ProfileMyAddressControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$ProfileMyAddressControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStreet(String value) {
    final _$actionInfo = _$ProfileMyAddressControllerBaseActionController
        .startAction(name: 'ProfileMyAddressControllerBase.setStreet');
    try {
      return super.setStreet(value);
    } finally {
      _$ProfileMyAddressControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDistrict(String value) {
    final _$actionInfo = _$ProfileMyAddressControllerBaseActionController
        .startAction(name: 'ProfileMyAddressControllerBase.setDistrict');
    try {
      return super.setDistrict(value);
    } finally {
      _$ProfileMyAddressControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumber(String value) {
    final _$actionInfo = _$ProfileMyAddressControllerBaseActionController
        .startAction(name: 'ProfileMyAddressControllerBase.setNumber');
    try {
      return super.setNumber(value);
    } finally {
      _$ProfileMyAddressControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComplement(String value) {
    final _$actionInfo = _$ProfileMyAddressControllerBaseActionController
        .startAction(name: 'ProfileMyAddressControllerBase.setComplement');
    try {
      return super.setComplement(value);
    } finally {
      _$ProfileMyAddressControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReferencePoint(String value) {
    final _$actionInfo = _$ProfileMyAddressControllerBaseActionController
        .startAction(name: 'ProfileMyAddressControllerBase.setReferencePoint');
    try {
      return super.setReferencePoint(value);
    } finally {
      _$ProfileMyAddressControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$ProfileMyAddressControllerBaseActionController
        .startAction(name: 'ProfileMyAddressControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$ProfileMyAddressControllerBaseActionController.endAction(_$actionInfo);
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
