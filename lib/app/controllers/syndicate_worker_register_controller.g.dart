// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syndicate_worker_register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SyndicateWorkerRegisterController
    on SyndicateWorkerRegisterControllerBase, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: 'SyndicateWorkerRegisterControllerBase.nameValid'))
          .value;
  Computed<bool>? _$lastnameValidComputed;

  @override
  bool get lastnameValid =>
      (_$lastnameValidComputed ??= Computed<bool>(() => super.lastnameValid,
              name: 'SyndicateWorkerRegisterControllerBase.lastnameValid'))
          .value;
  Computed<bool>? _$birthdateValidComputed;

  @override
  bool get birthdateValid =>
      (_$birthdateValidComputed ??= Computed<bool>(() => super.birthdateValid,
              name: 'SyndicateWorkerRegisterControllerBase.birthdateValid'))
          .value;
  Computed<bool>? _$emailValidComputed;

  @override
  bool get emailValid =>
      (_$emailValidComputed ??= Computed<bool>(() => super.emailValid,
              name: 'SyndicateWorkerRegisterControllerBase.emailValid'))
          .value;
  Computed<bool>? _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: 'SyndicateWorkerRegisterControllerBase.phoneValid'))
          .value;
  Computed<bool>? _$cpfValidComputed;

  @override
  bool get cpfValid =>
      (_$cpfValidComputed ??= Computed<bool>(() => super.cpfValid,
              name: 'SyndicateWorkerRegisterControllerBase.cpfValid'))
          .value;
  Computed<bool>? _$rgValidComputed;

  @override
  bool get rgValid => (_$rgValidComputed ??= Computed<bool>(() => super.rgValid,
          name: 'SyndicateWorkerRegisterControllerBase.rgValid'))
      .value;
  Computed<bool>? _$employeerValidComputed;

  @override
  bool get employeerValid =>
      (_$employeerValidComputed ??= Computed<bool>(() => super.employeerValid,
              name: 'SyndicateWorkerRegisterControllerBase.employeerValid'))
          .value;
  Computed<bool>? _$zipValidComputed;

  @override
  bool get zipValid =>
      (_$zipValidComputed ??= Computed<bool>(() => super.zipValid,
              name: 'SyndicateWorkerRegisterControllerBase.zipValid'))
          .value;
  Computed<bool>? _$isFormValidPersonalComputed;

  @override
  bool get isFormValidPersonal => (_$isFormValidPersonalComputed ??=
          Computed<bool>(() => super.isFormValidPersonal,
              name:
                  'SyndicateWorkerRegisterControllerBase.isFormValidPersonal'))
      .value;
  Computed<bool>? _$isFormValidDocumentsComputed;

  @override
  bool get isFormValidDocuments => (_$isFormValidDocumentsComputed ??=
          Computed<bool>(() => super.isFormValidDocuments,
              name:
                  'SyndicateWorkerRegisterControllerBase.isFormValidDocuments'))
      .value;
  Computed<bool>? _$isFormValidAddressComputed;

  @override
  bool get isFormValidAddress => (_$isFormValidAddressComputed ??=
          Computed<bool>(() => super.isFormValidAddress,
              name: 'SyndicateWorkerRegisterControllerBase.isFormValidAddress'))
      .value;

  late final _$_statusAtom = Atom(
      name: 'SyndicateWorkerRegisterControllerBase._status', context: context);

  SyndicateWorkerRegisterStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  SyndicateWorkerRegisterStateStatus get _status => status;

  @override
  set _status(SyndicateWorkerRegisterStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'SyndicateWorkerRegisterControllerBase._errorMessage',
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
      name: 'SyndicateWorkerRegisterControllerBase._showErrors',
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

  late final _$nameAtom = Atom(
      name: 'SyndicateWorkerRegisterControllerBase.name', context: context);

  @override
  String? get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String? value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  late final _$lastnameAtom = Atom(
      name: 'SyndicateWorkerRegisterControllerBase.lastname', context: context);

  @override
  String? get lastname {
    _$lastnameAtom.reportRead();
    return super.lastname;
  }

  @override
  set lastname(String? value) {
    _$lastnameAtom.reportWrite(value, super.lastname, () {
      super.lastname = value;
    });
  }

  late final _$birthdateAtom = Atom(
      name: 'SyndicateWorkerRegisterControllerBase.birthdate',
      context: context);

  @override
  String? get birthdate {
    _$birthdateAtom.reportRead();
    return super.birthdate;
  }

  @override
  set birthdate(String? value) {
    _$birthdateAtom.reportWrite(value, super.birthdate, () {
      super.birthdate = value;
    });
  }

  late final _$phoneAtom = Atom(
      name: 'SyndicateWorkerRegisterControllerBase.phone', context: context);

  @override
  String? get phone {
    _$phoneAtom.reportRead();
    return super.phone;
  }

  @override
  set phone(String? value) {
    _$phoneAtom.reportWrite(value, super.phone, () {
      super.phone = value;
    });
  }

  late final _$emailAtom = Atom(
      name: 'SyndicateWorkerRegisterControllerBase.email', context: context);

  @override
  String? get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String? value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  late final _$cpfAtom =
      Atom(name: 'SyndicateWorkerRegisterControllerBase.cpf', context: context);

  @override
  String? get cpf {
    _$cpfAtom.reportRead();
    return super.cpf;
  }

  @override
  set cpf(String? value) {
    _$cpfAtom.reportWrite(value, super.cpf, () {
      super.cpf = value;
    });
  }

  late final _$rgAtom =
      Atom(name: 'SyndicateWorkerRegisterControllerBase.rg', context: context);

  @override
  String? get rg {
    _$rgAtom.reportRead();
    return super.rg;
  }

  @override
  set rg(String? value) {
    _$rgAtom.reportWrite(value, super.rg, () {
      super.rg = value;
    });
  }

  late final _$employeerAtom = Atom(
      name: 'SyndicateWorkerRegisterControllerBase.employeer',
      context: context);

  @override
  EmployeerModel? get employeer {
    _$employeerAtom.reportRead();
    return super.employeer;
  }

  @override
  set employeer(EmployeerModel? value) {
    _$employeerAtom.reportWrite(value, super.employeer, () {
      super.employeer = value;
    });
  }

  late final _$zipAtom =
      Atom(name: 'SyndicateWorkerRegisterControllerBase.zip', context: context);

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
      name: 'SyndicateWorkerRegisterControllerBase.city', context: context);

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
      name: 'SyndicateWorkerRegisterControllerBase.state', context: context);

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
      name: 'SyndicateWorkerRegisterControllerBase.street', context: context);

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
      name: 'SyndicateWorkerRegisterControllerBase.district', context: context);

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
      name: 'SyndicateWorkerRegisterControllerBase.number', context: context);

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
      name: 'SyndicateWorkerRegisterControllerBase.complement',
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
      name: 'SyndicateWorkerRegisterControllerBase.referencePoint',
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

  late final _$termsAcceptedAtom = Atom(
      name: 'SyndicateWorkerRegisterControllerBase.termsAccepted',
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
      'SyndicateWorkerRegisterControllerBase.searchZip',
      context: context);

  @override
  Future<void> searchZip(String zipFilter) {
    return _$searchZipAsyncAction.run(() => super.searchZip(zipFilter));
  }

  late final _$registerAsyncAction = AsyncAction(
      'SyndicateWorkerRegisterControllerBase.register',
      context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$SyndicateWorkerRegisterControllerBaseActionController =
      ActionController(
          name: 'SyndicateWorkerRegisterControllerBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$SyndicateWorkerRegisterControllerBaseActionController
        .startAction(name: 'SyndicateWorkerRegisterControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$SyndicateWorkerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setLastname(String value) {
    final _$actionInfo = _$SyndicateWorkerRegisterControllerBaseActionController
        .startAction(name: 'SyndicateWorkerRegisterControllerBase.setLastname');
    try {
      return super.setLastname(value);
    } finally {
      _$SyndicateWorkerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setBirthdate(String value) {
    final _$actionInfo =
        _$SyndicateWorkerRegisterControllerBaseActionController.startAction(
            name: 'SyndicateWorkerRegisterControllerBase.setBirthdate');
    try {
      return super.setBirthdate(value);
    } finally {
      _$SyndicateWorkerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$SyndicateWorkerRegisterControllerBaseActionController
        .startAction(name: 'SyndicateWorkerRegisterControllerBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$SyndicateWorkerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$SyndicateWorkerRegisterControllerBaseActionController
        .startAction(name: 'SyndicateWorkerRegisterControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$SyndicateWorkerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCPF(String value) {
    final _$actionInfo = _$SyndicateWorkerRegisterControllerBaseActionController
        .startAction(name: 'SyndicateWorkerRegisterControllerBase.setCPF');
    try {
      return super.setCPF(value);
    } finally {
      _$SyndicateWorkerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setRG(String value) {
    final _$actionInfo = _$SyndicateWorkerRegisterControllerBaseActionController
        .startAction(name: 'SyndicateWorkerRegisterControllerBase.setRG');
    try {
      return super.setRG(value);
    } finally {
      _$SyndicateWorkerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setEmployeer(EmployeerModel? value) {
    final _$actionInfo =
        _$SyndicateWorkerRegisterControllerBaseActionController.startAction(
            name: 'SyndicateWorkerRegisterControllerBase.setEmployeer');
    try {
      return super.setEmployeer(value);
    } finally {
      _$SyndicateWorkerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo =
        _$SyndicateWorkerRegisterControllerBaseActionController.startAction(
            name: 'SyndicateWorkerRegisterControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$SyndicateWorkerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void sendPressedNewPage() {
    final _$actionInfo =
        _$SyndicateWorkerRegisterControllerBaseActionController.startAction(
            name: 'SyndicateWorkerRegisterControllerBase.sendPressedNewPage');
    try {
      return super.sendPressedNewPage();
    } finally {
      _$SyndicateWorkerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setZip(String value) {
    final _$actionInfo = _$SyndicateWorkerRegisterControllerBaseActionController
        .startAction(name: 'SyndicateWorkerRegisterControllerBase.setZip');
    try {
      return super.setZip(value);
    } finally {
      _$SyndicateWorkerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCity(String value) {
    final _$actionInfo = _$SyndicateWorkerRegisterControllerBaseActionController
        .startAction(name: 'SyndicateWorkerRegisterControllerBase.setCity');
    try {
      return super.setCity(value);
    } finally {
      _$SyndicateWorkerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setState(String value) {
    final _$actionInfo = _$SyndicateWorkerRegisterControllerBaseActionController
        .startAction(name: 'SyndicateWorkerRegisterControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$SyndicateWorkerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setStreet(String value) {
    final _$actionInfo = _$SyndicateWorkerRegisterControllerBaseActionController
        .startAction(name: 'SyndicateWorkerRegisterControllerBase.setStreet');
    try {
      return super.setStreet(value);
    } finally {
      _$SyndicateWorkerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDistrict(String value) {
    final _$actionInfo = _$SyndicateWorkerRegisterControllerBaseActionController
        .startAction(name: 'SyndicateWorkerRegisterControllerBase.setDistrict');
    try {
      return super.setDistrict(value);
    } finally {
      _$SyndicateWorkerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setNumber(String value) {
    final _$actionInfo = _$SyndicateWorkerRegisterControllerBaseActionController
        .startAction(name: 'SyndicateWorkerRegisterControllerBase.setNumber');
    try {
      return super.setNumber(value);
    } finally {
      _$SyndicateWorkerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setComplement(String value) {
    final _$actionInfo =
        _$SyndicateWorkerRegisterControllerBaseActionController.startAction(
            name: 'SyndicateWorkerRegisterControllerBase.setComplement');
    try {
      return super.setComplement(value);
    } finally {
      _$SyndicateWorkerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setReferencePoint(String value) {
    final _$actionInfo =
        _$SyndicateWorkerRegisterControllerBaseActionController.startAction(
            name: 'SyndicateWorkerRegisterControllerBase.setReferencePoint');
    try {
      return super.setReferencePoint(value);
    } finally {
      _$SyndicateWorkerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setTermsAccepted(bool value) {
    final _$actionInfo =
        _$SyndicateWorkerRegisterControllerBaseActionController.startAction(
            name: 'SyndicateWorkerRegisterControllerBase.setTermsAccepted');
    try {
      return super.setTermsAccepted(value);
    } finally {
      _$SyndicateWorkerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
lastname: ${lastname},
birthdate: ${birthdate},
phone: ${phone},
email: ${email},
cpf: ${cpf},
rg: ${rg},
employeer: ${employeer},
zip: ${zip},
city: ${city},
state: ${state},
street: ${street},
district: ${district},
number: ${number},
complement: ${complement},
referencePoint: ${referencePoint},
termsAccepted: ${termsAccepted},
nameValid: ${nameValid},
lastnameValid: ${lastnameValid},
birthdateValid: ${birthdateValid},
emailValid: ${emailValid},
phoneValid: ${phoneValid},
cpfValid: ${cpfValid},
rgValid: ${rgValid},
employeerValid: ${employeerValid},
zipValid: ${zipValid},
isFormValidPersonal: ${isFormValidPersonal},
isFormValidDocuments: ${isFormValidDocuments},
isFormValidAddress: ${isFormValidAddress}
    ''';
  }
}
