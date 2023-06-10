// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'syndicate_register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$SyndicateRegisterController on SyndicateRegisterControllerBase, Store {
  Computed<bool>? _$corporateNameValidComputed;

  @override
  bool get corporateNameValid => (_$corporateNameValidComputed ??=
          Computed<bool>(() => super.corporateNameValid,
              name: 'SyndicateRegisterControllerBase.corporateNameValid'))
      .value;
  Computed<bool>? _$fantasyNameValidComputed;

  @override
  bool get fantasyNameValid => (_$fantasyNameValidComputed ??= Computed<bool>(
          () => super.fantasyNameValid,
          name: 'SyndicateRegisterControllerBase.fantasyNameValid'))
      .value;
  Computed<bool>? _$cnpjValidComputed;

  @override
  bool get cnpjValid =>
      (_$cnpjValidComputed ??= Computed<bool>(() => super.cnpjValid,
              name: 'SyndicateRegisterControllerBase.cnpjValid'))
          .value;
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: 'SyndicateRegisterControllerBase.nameValid'))
          .value;
  Computed<bool>? _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: 'SyndicateRegisterControllerBase.phoneValid'))
          .value;
  Computed<bool>? _$mobilePhoneValidComputed;

  @override
  bool get mobilePhoneValid => (_$mobilePhoneValidComputed ??= Computed<bool>(
          () => super.mobilePhoneValid,
          name: 'SyndicateRegisterControllerBase.mobilePhoneValid'))
      .value;
  Computed<bool>? _$zipValidComputed;

  @override
  bool get zipValid =>
      (_$zipValidComputed ??= Computed<bool>(() => super.zipValid,
              name: 'SyndicateRegisterControllerBase.zipValid'))
          .value;
  Computed<bool>? _$isFormValidInicialDataComputed;

  @override
  bool get isFormValidInicialData => (_$isFormValidInicialDataComputed ??=
          Computed<bool>(() => super.isFormValidInicialData,
              name: 'SyndicateRegisterControllerBase.isFormValidInicialData'))
      .value;
  Computed<bool>? _$isFormValidResponsibleContactComputed;

  @override
  bool get isFormValidResponsibleContact =>
      (_$isFormValidResponsibleContactComputed ??= Computed<bool>(
              () => super.isFormValidResponsibleContact,
              name:
                  'SyndicateRegisterControllerBase.isFormValidResponsibleContact'))
          .value;
  Computed<bool>? _$isFormValidAddressComputed;

  @override
  bool get isFormValidAddress => (_$isFormValidAddressComputed ??=
          Computed<bool>(() => super.isFormValidAddress,
              name: 'SyndicateRegisterControllerBase.isFormValidAddress'))
      .value;

  late final _$_statusAtom =
      Atom(name: 'SyndicateRegisterControllerBase._status', context: context);

  SyndicateRegisterStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  SyndicateRegisterStateStatus get _status => status;

  @override
  set _status(SyndicateRegisterStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'SyndicateRegisterControllerBase._errorMessage', context: context);

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
      name: 'SyndicateRegisterControllerBase._showErrors', context: context);

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

  late final _$corporateNameAtom = Atom(
      name: 'SyndicateRegisterControllerBase.corporateName', context: context);

  @override
  String? get corporateName {
    _$corporateNameAtom.reportRead();
    return super.corporateName;
  }

  @override
  set corporateName(String? value) {
    _$corporateNameAtom.reportWrite(value, super.corporateName, () {
      super.corporateName = value;
    });
  }

  late final _$fantasyNameAtom = Atom(
      name: 'SyndicateRegisterControllerBase.fantasyName', context: context);

  @override
  String? get fantasyName {
    _$fantasyNameAtom.reportRead();
    return super.fantasyName;
  }

  @override
  set fantasyName(String? value) {
    _$fantasyNameAtom.reportWrite(value, super.fantasyName, () {
      super.fantasyName = value;
    });
  }

  late final _$cnpjAtom =
      Atom(name: 'SyndicateRegisterControllerBase.cnpj', context: context);

  @override
  String? get cnpj {
    _$cnpjAtom.reportRead();
    return super.cnpj;
  }

  @override
  set cnpj(String? value) {
    _$cnpjAtom.reportWrite(value, super.cnpj, () {
      super.cnpj = value;
    });
  }

  late final _$nameAtom =
      Atom(name: 'SyndicateRegisterControllerBase.name', context: context);

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

  late final _$emailAtom =
      Atom(name: 'SyndicateRegisterControllerBase.email', context: context);

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

  late final _$phoneAtom =
      Atom(name: 'SyndicateRegisterControllerBase.phone', context: context);

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

  late final _$mobilePhoneAtom = Atom(
      name: 'SyndicateRegisterControllerBase.mobilePhone', context: context);

  @override
  String? get mobilePhone {
    _$mobilePhoneAtom.reportRead();
    return super.mobilePhone;
  }

  @override
  set mobilePhone(String? value) {
    _$mobilePhoneAtom.reportWrite(value, super.mobilePhone, () {
      super.mobilePhone = value;
    });
  }

  late final _$companySectorAtom = Atom(
      name: 'SyndicateRegisterControllerBase.companySector', context: context);

  @override
  CompanySector? get companySector {
    _$companySectorAtom.reportRead();
    return super.companySector;
  }

  @override
  set companySector(CompanySector? value) {
    _$companySectorAtom.reportWrite(value, super.companySector, () {
      super.companySector = value;
    });
  }

  late final _$zipAtom =
      Atom(name: 'SyndicateRegisterControllerBase.zip', context: context);

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
      Atom(name: 'SyndicateRegisterControllerBase.city', context: context);

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
      Atom(name: 'SyndicateRegisterControllerBase.state', context: context);

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
      Atom(name: 'SyndicateRegisterControllerBase.street', context: context);

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
      Atom(name: 'SyndicateRegisterControllerBase.district', context: context);

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
      Atom(name: 'SyndicateRegisterControllerBase.number', context: context);

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
      name: 'SyndicateRegisterControllerBase.complement', context: context);

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
      name: 'SyndicateRegisterControllerBase.termsAccepted', context: context);

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
      'SyndicateRegisterControllerBase.searchZip',
      context: context);

  @override
  Future<void> searchZip(String zipFilter) {
    return _$searchZipAsyncAction.run(() => super.searchZip(zipFilter));
  }

  late final _$registerAsyncAction =
      AsyncAction('SyndicateRegisterControllerBase.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$SyndicateRegisterControllerBaseActionController =
      ActionController(
          name: 'SyndicateRegisterControllerBase', context: context);

  @override
  void setCorporateName(String value) {
    final _$actionInfo = _$SyndicateRegisterControllerBaseActionController
        .startAction(name: 'SyndicateRegisterControllerBase.setCorporateName');
    try {
      return super.setCorporateName(value);
    } finally {
      _$SyndicateRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setFantasyName(String value) {
    final _$actionInfo = _$SyndicateRegisterControllerBaseActionController
        .startAction(name: 'SyndicateRegisterControllerBase.setFantasyName');
    try {
      return super.setFantasyName(value);
    } finally {
      _$SyndicateRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCNPJ(String value) {
    final _$actionInfo = _$SyndicateRegisterControllerBaseActionController
        .startAction(name: 'SyndicateRegisterControllerBase.setCNPJ');
    try {
      return super.setCNPJ(value);
    } finally {
      _$SyndicateRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setName(String value) {
    final _$actionInfo = _$SyndicateRegisterControllerBaseActionController
        .startAction(name: 'SyndicateRegisterControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$SyndicateRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$SyndicateRegisterControllerBaseActionController
        .startAction(name: 'SyndicateRegisterControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$SyndicateRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$SyndicateRegisterControllerBaseActionController
        .startAction(name: 'SyndicateRegisterControllerBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$SyndicateRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMobilePhone(String value) {
    final _$actionInfo = _$SyndicateRegisterControllerBaseActionController
        .startAction(name: 'SyndicateRegisterControllerBase.setMobilePhone');
    try {
      return super.setMobilePhone(value);
    } finally {
      _$SyndicateRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCompanySector(CompanySector? value) {
    final _$actionInfo = _$SyndicateRegisterControllerBaseActionController
        .startAction(name: 'SyndicateRegisterControllerBase.setCompanySector');
    try {
      return super.setCompanySector(value);
    } finally {
      _$SyndicateRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setZip(String value) {
    final _$actionInfo = _$SyndicateRegisterControllerBaseActionController
        .startAction(name: 'SyndicateRegisterControllerBase.setZip');
    try {
      return super.setZip(value);
    } finally {
      _$SyndicateRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCity(String value) {
    final _$actionInfo = _$SyndicateRegisterControllerBaseActionController
        .startAction(name: 'SyndicateRegisterControllerBase.setCity');
    try {
      return super.setCity(value);
    } finally {
      _$SyndicateRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setState(String value) {
    final _$actionInfo = _$SyndicateRegisterControllerBaseActionController
        .startAction(name: 'SyndicateRegisterControllerBase.setState');
    try {
      return super.setState(value);
    } finally {
      _$SyndicateRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setStreet(String value) {
    final _$actionInfo = _$SyndicateRegisterControllerBaseActionController
        .startAction(name: 'SyndicateRegisterControllerBase.setStreet');
    try {
      return super.setStreet(value);
    } finally {
      _$SyndicateRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDistrict(String value) {
    final _$actionInfo = _$SyndicateRegisterControllerBaseActionController
        .startAction(name: 'SyndicateRegisterControllerBase.setDistrict');
    try {
      return super.setDistrict(value);
    } finally {
      _$SyndicateRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setNumber(String value) {
    final _$actionInfo = _$SyndicateRegisterControllerBaseActionController
        .startAction(name: 'SyndicateRegisterControllerBase.setNumber');
    try {
      return super.setNumber(value);
    } finally {
      _$SyndicateRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setComplement(String value) {
    final _$actionInfo = _$SyndicateRegisterControllerBaseActionController
        .startAction(name: 'SyndicateRegisterControllerBase.setComplement');
    try {
      return super.setComplement(value);
    } finally {
      _$SyndicateRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTermsAccepted(bool value) {
    final _$actionInfo = _$SyndicateRegisterControllerBaseActionController
        .startAction(name: 'SyndicateRegisterControllerBase.setTermsAccepted');
    try {
      return super.setTermsAccepted(value);
    } finally {
      _$SyndicateRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo =
        _$SyndicateRegisterControllerBaseActionController.startAction(
            name: 'SyndicateRegisterControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$SyndicateRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void sendPressedNewPage() {
    final _$actionInfo =
        _$SyndicateRegisterControllerBaseActionController.startAction(
            name: 'SyndicateRegisterControllerBase.sendPressedNewPage');
    try {
      return super.sendPressedNewPage();
    } finally {
      _$SyndicateRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
corporateName: ${corporateName},
fantasyName: ${fantasyName},
cnpj: ${cnpj},
name: ${name},
email: ${email},
phone: ${phone},
mobilePhone: ${mobilePhone},
companySector: ${companySector},
zip: ${zip},
city: ${city},
state: ${state},
street: ${street},
district: ${district},
number: ${number},
complement: ${complement},
termsAccepted: ${termsAccepted},
corporateNameValid: ${corporateNameValid},
fantasyNameValid: ${fantasyNameValid},
cnpjValid: ${cnpjValid},
nameValid: ${nameValid},
phoneValid: ${phoneValid},
mobilePhoneValid: ${mobilePhoneValid},
zipValid: ${zipValid},
isFormValidInicialData: ${isFormValidInicialData},
isFormValidResponsibleContact: ${isFormValidResponsibleContact},
isFormValidAddress: ${isFormValidAddress}
    ''';
  }
}
