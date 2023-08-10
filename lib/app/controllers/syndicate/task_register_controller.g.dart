// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskRegisterController on TaskRegisterControllerBase, Store {
  Computed<bool>? _$servTakerValidComputed;

  @override
  bool get servTakerValid =>
      (_$servTakerValidComputed ??= Computed<bool>(() => super.servTakerValid,
              name: 'TaskRegisterControllerBase.servTakerValid'))
          .value;
  Computed<bool>? _$descriptionServiceValidComputed;

  @override
  bool get descriptionServiceValid => (_$descriptionServiceValidComputed ??=
          Computed<bool>(() => super.descriptionServiceValid,
              name: 'TaskRegisterControllerBase.descriptionServiceValid'))
      .value;
  Computed<bool>? _$productionTypeValidComputed;

  @override
  bool get productionTypeValid => (_$productionTypeValidComputed ??=
          Computed<bool>(() => super.productionTypeValid,
              name: 'TaskRegisterControllerBase.productionTypeValid'))
      .value;
  Computed<bool>? _$extraPercentageValidComputed;

  @override
  bool get extraPercentageValid => (_$extraPercentageValidComputed ??=
          Computed<bool>(() => super.extraPercentageValid,
              name: 'TaskRegisterControllerBase.extraPercentageValid'))
      .value;
  Computed<bool>? _$reportTypeValidComputed;

  @override
  bool get reportTypeValid =>
      (_$reportTypeValidComputed ??= Computed<bool>(() => super.reportTypeValid,
              name: 'TaskRegisterControllerBase.reportTypeValid'))
          .value;
  Computed<bool>? _$quantityValidComputed;

  @override
  bool get quantityValid =>
      (_$quantityValidComputed ??= Computed<bool>(() => super.quantityValid,
              name: 'TaskRegisterControllerBase.quantityValid'))
          .value;
  Computed<bool>? _$hourDaysValidComputed;

  @override
  bool get hourDaysValid =>
      (_$hourDaysValidComputed ??= Computed<bool>(() => super.hourDaysValid,
              name: 'TaskRegisterControllerBase.hourDaysValid'))
          .value;
  Computed<bool>? _$unitaryValueValidComputed;

  @override
  bool get unitaryValueValid => (_$unitaryValueValidComputed ??= Computed<bool>(
          () => super.unitaryValueValid,
          name: 'TaskRegisterControllerBase.unitaryValueValid'))
      .value;
  Computed<bool>? _$invoiceAmountValidComputed;

  @override
  bool get invoiceAmountValid => (_$invoiceAmountValidComputed ??=
          Computed<bool>(() => super.invoiceAmountValid,
              name: 'TaskRegisterControllerBase.invoiceAmountValid'))
      .value;
  Computed<bool>? _$valueInvoiceValidComputed;

  @override
  bool get valueInvoiceValid => (_$valueInvoiceValidComputed ??= Computed<bool>(
          () => super.valueInvoiceValid,
          name: 'TaskRegisterControllerBase.valueInvoiceValid'))
      .value;
  Computed<bool>? _$valuePayrollValidComputed;

  @override
  bool get valuePayrollValid => (_$valuePayrollValidComputed ??= Computed<bool>(
          () => super.valuePayrollValid,
          name: 'TaskRegisterControllerBase.valuePayrollValid'))
      .value;
  Computed<bool>? _$hourUnitaryValidComputed;

  @override
  bool get hourUnitaryValid => (_$hourUnitaryValidComputed ??= Computed<bool>(
          () => super.hourUnitaryValid,
          name: 'TaskRegisterControllerBase.hourUnitaryValid'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'TaskRegisterControllerBase.isFormValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: 'TaskRegisterControllerBase.sendPressed'))
          .value;

  late final _$_statusAtom =
      Atom(name: 'TaskRegisterControllerBase._status', context: context);

  TaskRegisterStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  TaskRegisterStateStatus get _status => status;

  @override
  set _status(TaskRegisterStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$modeAtom =
      Atom(name: 'TaskRegisterControllerBase.mode', context: context);

  @override
  int? get mode {
    _$modeAtom.reportRead();
    return super.mode;
  }

  @override
  set mode(int? value) {
    _$modeAtom.reportWrite(value, super.mode, () {
      super.mode = value;
    });
  }

  late final _$_errorMessageAtom =
      Atom(name: 'TaskRegisterControllerBase._errorMessage', context: context);

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

  late final _$_showErrorsAtom =
      Atom(name: 'TaskRegisterControllerBase._showErrors', context: context);

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

  late final _$descriptionServiceAtom = Atom(
      name: 'TaskRegisterControllerBase.descriptionService', context: context);

  @override
  String? get descriptionService {
    _$descriptionServiceAtom.reportRead();
    return super.descriptionService;
  }

  @override
  set descriptionService(String? value) {
    _$descriptionServiceAtom.reportWrite(value, super.descriptionService, () {
      super.descriptionService = value;
    });
  }

  late final _$productionTypeAtom =
      Atom(name: 'TaskRegisterControllerBase.productionType', context: context);

  @override
  ProductionType? get productionType {
    _$productionTypeAtom.reportRead();
    return super.productionType;
  }

  @override
  set productionType(ProductionType? value) {
    _$productionTypeAtom.reportWrite(value, super.productionType, () {
      super.productionType = value;
    });
  }

  late final _$extraPercentageAtom = Atom(
      name: 'TaskRegisterControllerBase.extraPercentage', context: context);

  @override
  String? get extraPercentage {
    _$extraPercentageAtom.reportRead();
    return super.extraPercentage;
  }

  @override
  set extraPercentage(String? value) {
    _$extraPercentageAtom.reportWrite(value, super.extraPercentage, () {
      super.extraPercentage = value;
    });
  }

  late final _$reportTypeAtom =
      Atom(name: 'TaskRegisterControllerBase.reportType', context: context);

  @override
  ReportType? get reportType {
    _$reportTypeAtom.reportRead();
    return super.reportType;
  }

  @override
  set reportType(ReportType? value) {
    _$reportTypeAtom.reportWrite(value, super.reportType, () {
      super.reportType = value;
    });
  }

  late final _$quantityAtom =
      Atom(name: 'TaskRegisterControllerBase.quantity', context: context);

  @override
  String? get quantity {
    _$quantityAtom.reportRead();
    return super.quantity;
  }

  @override
  set quantity(String? value) {
    _$quantityAtom.reportWrite(value, super.quantity, () {
      super.quantity = value;
    });
  }

  late final _$unitaryValueAtom =
      Atom(name: 'TaskRegisterControllerBase.unitaryValue', context: context);

  @override
  String? get unitaryValue {
    _$unitaryValueAtom.reportRead();
    return super.unitaryValue;
  }

  @override
  set unitaryValue(String? value) {
    _$unitaryValueAtom.reportWrite(value, super.unitaryValue, () {
      super.unitaryValue = value;
    });
  }

  late final _$invoiceAmountAtom =
      Atom(name: 'TaskRegisterControllerBase.invoiceAmount', context: context);

  @override
  String? get invoiceAmount {
    _$invoiceAmountAtom.reportRead();
    return super.invoiceAmount;
  }

  @override
  set invoiceAmount(String? value) {
    _$invoiceAmountAtom.reportWrite(value, super.invoiceAmount, () {
      super.invoiceAmount = value;
    });
  }

  late final _$valueInvoiceAtom =
      Atom(name: 'TaskRegisterControllerBase.valueInvoice', context: context);

  @override
  String? get valueInvoice {
    _$valueInvoiceAtom.reportRead();
    return super.valueInvoice;
  }

  @override
  set valueInvoice(String? value) {
    _$valueInvoiceAtom.reportWrite(value, super.valueInvoice, () {
      super.valueInvoice = value;
    });
  }

  late final _$valuePayrollAtom =
      Atom(name: 'TaskRegisterControllerBase.valuePayroll', context: context);

  @override
  String? get valuePayroll {
    _$valuePayrollAtom.reportRead();
    return super.valuePayroll;
  }

  @override
  set valuePayroll(String? value) {
    _$valuePayrollAtom.reportWrite(value, super.valuePayroll, () {
      super.valuePayroll = value;
    });
  }

  late final _$_accessAtom =
      Atom(name: 'TaskRegisterControllerBase._access', context: context);

  int? get access {
    _$_accessAtom.reportRead();
    return super._access;
  }

  @override
  int? get _access => access;

  @override
  set _access(int? value) {
    _$_accessAtom.reportWrite(value, super._access, () {
      super._access = value;
    });
  }

  late final _$_statusTaskAtom =
      Atom(name: 'TaskRegisterControllerBase._statusTask', context: context);

  int? get statusTask {
    _$_statusTaskAtom.reportRead();
    return super._statusTask;
  }

  @override
  int? get _statusTask => statusTask;

  @override
  set _statusTask(int? value) {
    _$_statusTaskAtom.reportWrite(value, super._statusTask, () {
      super._statusTask = value;
    });
  }

  late final _$servTakerAtom =
      Atom(name: 'TaskRegisterControllerBase.servTaker', context: context);

  @override
  ServTakerModel? get servTaker {
    _$servTakerAtom.reportRead();
    return super.servTaker;
  }

  @override
  set servTaker(ServTakerModel? value) {
    _$servTakerAtom.reportWrite(value, super.servTaker, () {
      super.servTaker = value;
    });
  }

  late final _$calculateNightTimeAtom = Atom(
      name: 'TaskRegisterControllerBase.calculateNightTime', context: context);

  @override
  bool get calculateNightTime {
    _$calculateNightTimeAtom.reportRead();
    return super.calculateNightTime;
  }

  @override
  set calculateNightTime(bool value) {
    _$calculateNightTimeAtom.reportWrite(value, super.calculateNightTime, () {
      super.calculateNightTime = value;
    });
  }

  late final _$hourDaysAtom =
      Atom(name: 'TaskRegisterControllerBase.hourDays', context: context);

  @override
  String? get hourDays {
    _$hourDaysAtom.reportRead();
    return super.hourDays;
  }

  @override
  set hourDays(String? value) {
    _$hourDaysAtom.reportWrite(value, super.hourDays, () {
      super.hourDays = value;
    });
  }

  late final _$hourUnitaryAtom =
      Atom(name: 'TaskRegisterControllerBase.hourUnitary', context: context);

  @override
  String? get hourUnitary {
    _$hourUnitaryAtom.reportRead();
    return super.hourUnitary;
  }

  @override
  set hourUnitary(String? value) {
    _$hourUnitaryAtom.reportWrite(value, super.hourUnitary, () {
      super.hourUnitary = value;
    });
  }

  late final _$syndicateAtom =
      Atom(name: 'TaskRegisterControllerBase.syndicate', context: context);

  @override
  String? get syndicate {
    _$syndicateAtom.reportRead();
    return super.syndicate;
  }

  @override
  set syndicate(String? value) {
    _$syndicateAtom.reportWrite(value, super.syndicate, () {
      super.syndicate = value;
    });
  }

  late final _$_codeAtom =
      Atom(name: 'TaskRegisterControllerBase._code', context: context);

  String? get code {
    _$_codeAtom.reportRead();
    return super._code;
  }

  @override
  String? get _code => code;

  @override
  set _code(String? value) {
    _$_codeAtom.reportWrite(value, super._code, () {
      super._code = value;
    });
  }

  late final _$registerAsyncAction =
      AsyncAction('TaskRegisterControllerBase.register', context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$TaskRegisterControllerBaseActionController =
      ActionController(name: 'TaskRegisterControllerBase', context: context);

  @override
  void setDescriptionService(String value) {
    final _$actionInfo = _$TaskRegisterControllerBaseActionController
        .startAction(name: 'TaskRegisterControllerBase.setDescriptionService');
    try {
      return super.setDescriptionService(value);
    } finally {
      _$TaskRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setProductionType(ProductionType? value) {
    final _$actionInfo = _$TaskRegisterControllerBaseActionController
        .startAction(name: 'TaskRegisterControllerBase.setProductionType');
    try {
      return super.setProductionType(value);
    } finally {
      _$TaskRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setExtraPercentage(String value) {
    final _$actionInfo = _$TaskRegisterControllerBaseActionController
        .startAction(name: 'TaskRegisterControllerBase.setExtraPercentage');
    try {
      return super.setExtraPercentage(value);
    } finally {
      _$TaskRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setReportType(ReportType? value) {
    final _$actionInfo = _$TaskRegisterControllerBaseActionController
        .startAction(name: 'TaskRegisterControllerBase.setReportType');
    try {
      return super.setReportType(value);
    } finally {
      _$TaskRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setSyndicate(String value) {
    final _$actionInfo = _$TaskRegisterControllerBaseActionController
        .startAction(name: 'TaskRegisterControllerBase.setSyndicate');
    try {
      return super.setSyndicate(value);
    } finally {
      _$TaskRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setQuantity(String? value) {
    final _$actionInfo = _$TaskRegisterControllerBaseActionController
        .startAction(name: 'TaskRegisterControllerBase.setQuantity');
    try {
      return super.setQuantity(value);
    } finally {
      _$TaskRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setUnitaryValue(String value) {
    final _$actionInfo = _$TaskRegisterControllerBaseActionController
        .startAction(name: 'TaskRegisterControllerBase.setUnitaryValue');
    try {
      return super.setUnitaryValue(value);
    } finally {
      _$TaskRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setInvoiceAmount(String? value) {
    final _$actionInfo = _$TaskRegisterControllerBaseActionController
        .startAction(name: 'TaskRegisterControllerBase.setInvoiceAmount');
    try {
      return super.setInvoiceAmount(value);
    } finally {
      _$TaskRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValueInvoice(String? value) {
    final _$actionInfo = _$TaskRegisterControllerBaseActionController
        .startAction(name: 'TaskRegisterControllerBase.setValueInvoice');
    try {
      return super.setValueInvoice(value);
    } finally {
      _$TaskRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setValuePayroll(String? value) {
    final _$actionInfo = _$TaskRegisterControllerBaseActionController
        .startAction(name: 'TaskRegisterControllerBase.setValuePayroll');
    try {
      return super.setValuePayroll(value);
    } finally {
      _$TaskRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setServTaker(ServTakerModel? value) {
    final _$actionInfo = _$TaskRegisterControllerBaseActionController
        .startAction(name: 'TaskRegisterControllerBase.setServTaker');
    try {
      return super.setServTaker(value);
    } finally {
      _$TaskRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setCalculateNightTime(bool value) {
    final _$actionInfo = _$TaskRegisterControllerBaseActionController
        .startAction(name: 'TaskRegisterControllerBase.setCalculateNightTime');
    try {
      return super.setCalculateNightTime(value);
    } finally {
      _$TaskRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHourDays(String value) {
    final _$actionInfo = _$TaskRegisterControllerBaseActionController
        .startAction(name: 'TaskRegisterControllerBase.setHourDays');
    try {
      return super.setHourDays(value);
    } finally {
      _$TaskRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setHourUnitary(String value) {
    final _$actionInfo = _$TaskRegisterControllerBaseActionController
        .startAction(name: 'TaskRegisterControllerBase.setHourUnitary');
    try {
      return super.setHourUnitary(value);
    } finally {
      _$TaskRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setMode(int value) {
    final _$actionInfo = _$TaskRegisterControllerBaseActionController
        .startAction(name: 'TaskRegisterControllerBase.setMode');
    try {
      return super.setMode(value);
    } finally {
      _$TaskRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo = _$TaskRegisterControllerBaseActionController
        .startAction(name: 'TaskRegisterControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$TaskRegisterControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
mode: ${mode},
descriptionService: ${descriptionService},
productionType: ${productionType},
extraPercentage: ${extraPercentage},
reportType: ${reportType},
quantity: ${quantity},
unitaryValue: ${unitaryValue},
invoiceAmount: ${invoiceAmount},
valueInvoice: ${valueInvoice},
valuePayroll: ${valuePayroll},
servTaker: ${servTaker},
calculateNightTime: ${calculateNightTime},
hourDays: ${hourDays},
hourUnitary: ${hourUnitary},
syndicate: ${syndicate},
servTakerValid: ${servTakerValid},
descriptionServiceValid: ${descriptionServiceValid},
productionTypeValid: ${productionTypeValid},
extraPercentageValid: ${extraPercentageValid},
reportTypeValid: ${reportTypeValid},
quantityValid: ${quantityValid},
hourDaysValid: ${hourDaysValid},
unitaryValueValid: ${unitaryValueValid},
invoiceAmountValid: ${invoiceAmountValid},
valueInvoiceValid: ${valueInvoiceValid},
valuePayrollValid: ${valuePayrollValid},
hourUnitaryValid: ${hourUnitaryValid},
isFormValid: ${isFormValid},
sendPressed: ${sendPressed}
    ''';
  }
}
