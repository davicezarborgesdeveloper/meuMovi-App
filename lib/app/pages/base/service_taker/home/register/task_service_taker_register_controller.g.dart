// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'task_service_taker_register_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$TaskServiceTakerRegisterController
    on TaskServiceTakerRegisterControllerBase, Store {
  Computed<bool>? _$descriptionServiceValidComputed;

  @override
  bool get descriptionServiceValid => (_$descriptionServiceValidComputed ??=
          Computed<bool>(() => super.descriptionServiceValid,
              name:
                  'TaskServiceTakerRegisterControllerBase.descriptionServiceValid'))
      .value;
  Computed<bool>? _$descCostCenterValidComputed;

  @override
  bool get descCostCenterValid => (_$descCostCenterValidComputed ??=
          Computed<bool>(() => super.descCostCenterValid,
              name:
                  'TaskServiceTakerRegisterControllerBase.descCostCenterValid'))
      .value;
  Computed<bool>? _$productionTypeValidComputed;

  @override
  bool get productionTypeValid => (_$productionTypeValidComputed ??=
          Computed<bool>(() => super.productionTypeValid,
              name:
                  'TaskServiceTakerRegisterControllerBase.productionTypeValid'))
      .value;
  Computed<bool>? _$extraPercentageValidComputed;

  @override
  bool get extraPercentageValid => (_$extraPercentageValidComputed ??= Computed<
              bool>(() => super.extraPercentageValid,
          name: 'TaskServiceTakerRegisterControllerBase.extraPercentageValid'))
      .value;
  Computed<bool>? _$reportTypeValidComputed;

  @override
  bool get reportTypeValid =>
      (_$reportTypeValidComputed ??= Computed<bool>(() => super.reportTypeValid,
              name: 'TaskServiceTakerRegisterControllerBase.reportTypeValid'))
          .value;
  Computed<bool>? _$invoiceAmountValidComputed;

  @override
  bool get invoiceAmountValid => (_$invoiceAmountValidComputed ??=
          Computed<bool>(() => super.invoiceAmountValid,
              name:
                  'TaskServiceTakerRegisterControllerBase.invoiceAmountValid'))
      .value;
  Computed<bool>? _$valueInvoiceValidComputed;

  @override
  bool get valueInvoiceValid => (_$valueInvoiceValidComputed ??= Computed<bool>(
          () => super.valueInvoiceValid,
          name: 'TaskServiceTakerRegisterControllerBase.valueInvoiceValid'))
      .value;
  Computed<bool>? _$quantityValidComputed;

  @override
  bool get quantityValid =>
      (_$quantityValidComputed ??= Computed<bool>(() => super.quantityValid,
              name: 'TaskServiceTakerRegisterControllerBase.quantityValid'))
          .value;
  Computed<bool>? _$unitaryValueValidComputed;

  @override
  bool get unitaryValueValid => (_$unitaryValueValidComputed ??= Computed<bool>(
          () => super.unitaryValueValid,
          name: 'TaskServiceTakerRegisterControllerBase.unitaryValueValid'))
      .value;
  Computed<bool>? _$hourUnitaryValidComputed;

  @override
  bool get hourUnitaryValid => (_$hourUnitaryValidComputed ??= Computed<bool>(
          () => super.hourUnitaryValid,
          name: 'TaskServiceTakerRegisterControllerBase.hourUnitaryValid'))
      .value;
  Computed<bool>? _$isFormValidComputed;

  @override
  bool get isFormValid =>
      (_$isFormValidComputed ??= Computed<bool>(() => super.isFormValid,
              name: 'TaskServiceTakerRegisterControllerBase.isFormValid'))
          .value;
  Computed<dynamic>? _$sendPressedComputed;

  @override
  dynamic get sendPressed =>
      (_$sendPressedComputed ??= Computed<dynamic>(() => super.sendPressed,
              name: 'TaskServiceTakerRegisterControllerBase.sendPressed'))
          .value;

  late final _$_statusAtom = Atom(
      name: 'TaskServiceTakerRegisterControllerBase._status', context: context);

  TaskServiceTakerRegisterStateStatus get status {
    _$_statusAtom.reportRead();
    return super._status;
  }

  @override
  TaskServiceTakerRegisterStateStatus get _status => status;

  @override
  set _status(TaskServiceTakerRegisterStateStatus value) {
    _$_statusAtom.reportWrite(value, super._status, () {
      super._status = value;
    });
  }

  late final _$_errorMessageAtom = Atom(
      name: 'TaskServiceTakerRegisterControllerBase._errorMessage',
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
      name: 'TaskServiceTakerRegisterControllerBase._showErrors',
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

  late final _$_codeAtom = Atom(
      name: 'TaskServiceTakerRegisterControllerBase._code', context: context);

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

  late final _$descriptionServiceAtom = Atom(
      name: 'TaskServiceTakerRegisterControllerBase.descriptionService',
      context: context);

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

  late final _$servTakerAtom = Atom(
      name: 'TaskServiceTakerRegisterControllerBase.servTaker',
      context: context);

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

  late final _$descCostCenterAtom = Atom(
      name: 'TaskServiceTakerRegisterControllerBase.descCostCenter',
      context: context);

  @override
  String? get descCostCenter {
    _$descCostCenterAtom.reportRead();
    return super.descCostCenter;
  }

  @override
  set descCostCenter(String? value) {
    _$descCostCenterAtom.reportWrite(value, super.descCostCenter, () {
      super.descCostCenter = value;
    });
  }

  late final _$extraPercentageAtom = Atom(
      name: 'TaskServiceTakerRegisterControllerBase.extraPercentage',
      context: context);

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

  late final _$productionTypeAtom = Atom(
      name: 'TaskServiceTakerRegisterControllerBase.productionType',
      context: context);

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

  late final _$reportTypeAtom = Atom(
      name: 'TaskServiceTakerRegisterControllerBase.reportType',
      context: context);

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

  late final _$hourDaysAtom = Atom(
      name: 'TaskServiceTakerRegisterControllerBase.hourDays',
      context: context);

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

  late final _$hourUnitaryAtom = Atom(
      name: 'TaskServiceTakerRegisterControllerBase.hourUnitary',
      context: context);

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

  late final _$invoiceAmountAtom = Atom(
      name: 'TaskServiceTakerRegisterControllerBase.invoiceAmount',
      context: context);

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

  late final _$valueInvoiceAtom = Atom(
      name: 'TaskServiceTakerRegisterControllerBase.valueInvoice',
      context: context);

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

  late final _$_accessAtom = Atom(
      name: 'TaskServiceTakerRegisterControllerBase._access', context: context);

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

  late final _$_statusTaskAtom = Atom(
      name: 'TaskServiceTakerRegisterControllerBase._statusTask',
      context: context);

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

  late final _$valuePayrollAtom = Atom(
      name: 'TaskServiceTakerRegisterControllerBase.valuePayroll',
      context: context);

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

  late final _$_syndicateAtom = Atom(
      name: 'TaskServiceTakerRegisterControllerBase._syndicate',
      context: context);

  String? get syndicate {
    _$_syndicateAtom.reportRead();
    return super._syndicate;
  }

  @override
  String? get _syndicate => syndicate;

  @override
  set _syndicate(String? value) {
    _$_syndicateAtom.reportWrite(value, super._syndicate, () {
      super._syndicate = value;
    });
  }

  late final _$quantityAtom = Atom(
      name: 'TaskServiceTakerRegisterControllerBase.quantity',
      context: context);

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

  late final _$unitaryValueAtom = Atom(
      name: 'TaskServiceTakerRegisterControllerBase.unitaryValue',
      context: context);

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

  late final _$registerAsyncAction = AsyncAction(
      'TaskServiceTakerRegisterControllerBase.register',
      context: context);

  @override
  Future<void> register() {
    return _$registerAsyncAction.run(() => super.register());
  }

  late final _$TaskServiceTakerRegisterControllerBaseActionController =
      ActionController(
          name: 'TaskServiceTakerRegisterControllerBase', context: context);

  @override
  void setDescriptionService(String value) {
    final _$actionInfo =
        _$TaskServiceTakerRegisterControllerBaseActionController.startAction(
            name:
                'TaskServiceTakerRegisterControllerBase.setDescriptionService');
    try {
      return super.setDescriptionService(value);
    } finally {
      _$TaskServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setServTaker(ServiceTakerModel? value) {
    final _$actionInfo =
        _$TaskServiceTakerRegisterControllerBaseActionController.startAction(
            name: 'TaskServiceTakerRegisterControllerBase.setServTaker');
    try {
      return super.setServTaker(value);
    } finally {
      _$TaskServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setDescCostCenter(String value) {
    final _$actionInfo =
        _$TaskServiceTakerRegisterControllerBaseActionController.startAction(
            name: 'TaskServiceTakerRegisterControllerBase.setDescCostCenter');
    try {
      return super.setDescCostCenter(value);
    } finally {
      _$TaskServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setProductionType(ProductionType? value) {
    final _$actionInfo =
        _$TaskServiceTakerRegisterControllerBaseActionController.startAction(
            name: 'TaskServiceTakerRegisterControllerBase.setProductionType');
    try {
      return super.setProductionType(value);
    } finally {
      _$TaskServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setExtraPercentage(String value) {
    final _$actionInfo =
        _$TaskServiceTakerRegisterControllerBaseActionController.startAction(
            name: 'TaskServiceTakerRegisterControllerBase.setExtraPercentage');
    try {
      return super.setExtraPercentage(value);
    } finally {
      _$TaskServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setReportType(ReportType? value) {
    final _$actionInfo =
        _$TaskServiceTakerRegisterControllerBaseActionController.startAction(
            name: 'TaskServiceTakerRegisterControllerBase.setReportType');
    try {
      return super.setReportType(value);
    } finally {
      _$TaskServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setHourDays(String value) {
    final _$actionInfo =
        _$TaskServiceTakerRegisterControllerBaseActionController.startAction(
            name: 'TaskServiceTakerRegisterControllerBase.setHourDays');
    try {
      return super.setHourDays(value);
    } finally {
      _$TaskServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setHourUnitary(String value) {
    final _$actionInfo =
        _$TaskServiceTakerRegisterControllerBaseActionController.startAction(
            name: 'TaskServiceTakerRegisterControllerBase.setHourUnitary');
    try {
      return super.setHourUnitary(value);
    } finally {
      _$TaskServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setInvoiceAmount(String? value) {
    final _$actionInfo =
        _$TaskServiceTakerRegisterControllerBaseActionController.startAction(
            name: 'TaskServiceTakerRegisterControllerBase.setInvoiceAmount');
    try {
      return super.setInvoiceAmount(value);
    } finally {
      _$TaskServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setValueInvoice(String? value) {
    final _$actionInfo =
        _$TaskServiceTakerRegisterControllerBaseActionController.startAction(
            name: 'TaskServiceTakerRegisterControllerBase.setValueInvoice');
    try {
      return super.setValueInvoice(value);
    } finally {
      _$TaskServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setValuePayroll(String? value) {
    final _$actionInfo =
        _$TaskServiceTakerRegisterControllerBaseActionController.startAction(
            name: 'TaskServiceTakerRegisterControllerBase.setValuePayroll');
    try {
      return super.setValuePayroll(value);
    } finally {
      _$TaskServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setQuantity(String? value) {
    final _$actionInfo =
        _$TaskServiceTakerRegisterControllerBaseActionController.startAction(
            name: 'TaskServiceTakerRegisterControllerBase.setQuantity');
    try {
      return super.setQuantity(value);
    } finally {
      _$TaskServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void setUnitaryValue(String value) {
    final _$actionInfo =
        _$TaskServiceTakerRegisterControllerBaseActionController.startAction(
            name: 'TaskServiceTakerRegisterControllerBase.setUnitaryValue');
    try {
      return super.setUnitaryValue(value);
    } finally {
      _$TaskServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  void invalidSendPressed() {
    final _$actionInfo =
        _$TaskServiceTakerRegisterControllerBaseActionController.startAction(
            name: 'TaskServiceTakerRegisterControllerBase.invalidSendPressed');
    try {
      return super.invalidSendPressed();
    } finally {
      _$TaskServiceTakerRegisterControllerBaseActionController
          .endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
descriptionService: ${descriptionService},
servTaker: ${servTaker},
descCostCenter: ${descCostCenter},
extraPercentage: ${extraPercentage},
productionType: ${productionType},
reportType: ${reportType},
hourDays: ${hourDays},
hourUnitary: ${hourUnitary},
invoiceAmount: ${invoiceAmount},
valueInvoice: ${valueInvoice},
valuePayroll: ${valuePayroll},
quantity: ${quantity},
unitaryValue: ${unitaryValue},
descriptionServiceValid: ${descriptionServiceValid},
descCostCenterValid: ${descCostCenterValid},
productionTypeValid: ${productionTypeValid},
extraPercentageValid: ${extraPercentageValid},
reportTypeValid: ${reportTypeValid},
invoiceAmountValid: ${invoiceAmountValid},
valueInvoiceValid: ${valueInvoiceValid},
quantityValid: ${quantityValid},
unitaryValueValid: ${unitaryValueValid},
hourUnitaryValid: ${hourUnitaryValid},
isFormValid: ${isFormValid},
sendPressed: ${sendPressed}
    ''';
  }
}
