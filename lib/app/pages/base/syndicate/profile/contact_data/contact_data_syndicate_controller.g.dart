// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'contact_data_syndicate_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$ContactDataSyndicateController
    on ContactDataSyndicateControllerBase, Store {
  Computed<bool>? _$nameValidComputed;

  @override
  bool get nameValid =>
      (_$nameValidComputed ??= Computed<bool>(() => super.nameValid,
              name: 'ContactDataSyndicateControllerBase.nameValid'))
          .value;
  Computed<bool>? _$phoneValidComputed;

  @override
  bool get phoneValid =>
      (_$phoneValidComputed ??= Computed<bool>(() => super.phoneValid,
              name: 'ContactDataSyndicateControllerBase.phoneValid'))
          .value;
  Computed<bool>? _$mobilePhoneValidComputed;

  @override
  bool get mobilePhoneValid => (_$mobilePhoneValidComputed ??= Computed<bool>(
          () => super.mobilePhoneValid,
          name: 'ContactDataSyndicateControllerBase.mobilePhoneValid'))
      .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: 'ContactDataSyndicateControllerBase.sendPressed'))
          .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'ContactDataSyndicateControllerBase.isFormValid'))
          .value;

  late final _$_statusAtom = Atom(
      name: 'ContactDataSyndicateControllerBase._status', context: context);

  ContactDataSyndicateStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  ContactDataSyndicateStateStatus get _status => status;

  @override
  set _status(ContactDataSyndicateStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'ContactDataSyndicateControllerBase._errorMessage',
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
      name: 'ContactDataSyndicateControllerBase._showErrors', context: context);

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

  late final _$nameAtom =
      Atom(name: 'ContactDataSyndicateControllerBase.name', context: context);

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
      Atom(name: 'ContactDataSyndicateControllerBase.email', context: context);

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
      Atom(name: 'ContactDataSyndicateControllerBase.phone', context: context);

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
      name: 'ContactDataSyndicateControllerBase.mobilePhone', context: context);

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
      name: 'ContactDataSyndicateControllerBase.companySector',
      context: context);

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

  late final _$getDataAsyncAction = AsyncAction(
      'ContactDataSyndicateControllerBase.getData',
      context: context);

  @override
  Future<void> getData() {
    return _$getDataAsyncAction.run(() => super.getData());
  }

  late final _$registerAsyncAction = AsyncAction(
      'ContactDataSyndicateControllerBase.register',
      context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$ContactDataSyndicateControllerBaseActionController =
      ActionController(
          name: 'ContactDataSyndicateControllerBase', context: context);

  @override
  void setName(String value) {
    final _$actionInfo = _$ContactDataSyndicateControllerBaseActionController
        .startAction(name: 'ContactDataSyndicateControllerBase.setName');
    try {
      return super.setName(value);
    } finally {
      _$ContactDataSyndicateControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setEmail(String value) {
    final _$actionInfo = _$ContactDataSyndicateControllerBaseActionController
        .startAction(name: 'ContactDataSyndicateControllerBase.setEmail');
    try {
      return super.setEmail(value);
    } finally {
      _$ContactDataSyndicateControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setPhone(String value) {
    final _$actionInfo = _$ContactDataSyndicateControllerBaseActionController
        .startAction(name: 'ContactDataSyndicateControllerBase.setPhone');
    try {
      return super.setPhone(value);
    } finally {
      _$ContactDataSyndicateControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setMobilePhone(String value) {
    final _$actionInfo = _$ContactDataSyndicateControllerBaseActionController
        .startAction(name: 'ContactDataSyndicateControllerBase.setMobilePhone');
    try {
      return super.setMobilePhone(value);
    } finally {
      _$ContactDataSyndicateControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setCompanySector(CompanySector? value) {
    final _$actionInfo =
        _$ContactDataSyndicateControllerBaseActionController.startAction(
            name: 'ContactDataSyndicateControllerBase.setCompanySector');
    try {
      return super.setCompanySector(value);
    } finally {
      _$ContactDataSyndicateControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo =
        _$ContactDataSyndicateControllerBaseActionController.startAction(
            name: 'ContactDataSyndicateControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$ContactDataSyndicateControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
phone: ${phone},
mobilePhone: ${mobilePhone},
companySector: ${companySector},
nameValid: ${nameValid},
phoneValid: ${phoneValid},
mobilePhoneValid: ${mobilePhoneValid},
sendPressed: ${sendPressed},
isFormValid: ${isFormValid}
    ''';
  }
}
