import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../../../core/ui/helpers/enums.dart';
import '../../../../../models/service_taker_model.dart';
import '../../../../../models/task_model.dart';
import '../../../../../services/task/task_service.dart';
part 'task_service_taker_register_controller.g.dart';

enum TaskServiceTakerRegisterStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class TaskServiceTakerRegisterController = TaskServiceTakerRegisterControllerBase
    with _$TaskServiceTakerRegisterController;

abstract class TaskServiceTakerRegisterControllerBase with Store {
  @readonly
  var _status = TaskServiceTakerRegisterStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  @readonly
  String? _code;

  @observable
  String? descriptionService;

  @observable
  ServTakerModel? servTaker;

  @observable
  String? descCostCenter;

  @observable
  String? extraPercentage;

  @observable
  ProductionType? productionType;

  @observable
  ReportType? reportType;

  @observable
  bool calculateNightTime = false;

  @observable
  String? hourDays;

  @observable
  String? invoiceAmount;

  @observable
  String? valueInvoice;

  @readonly
  int? _access;

  @readonly
  int? _statusTask;

  @readonly
  double? _valuePayroll;

  @readonly
  String? _syndicate;

  @observable
  String? quantity;

  @observable
  String? unitaryValue;

  @observable
  double? totalValue = 0.00;

  @action
  void setDescriptionService(String value) => descriptionService = value;

  @action
  void setServTaker(ServiceTakerModel? value) {
    servTaker = ServTakerModel(code: value!.user, name: value.companyName);
  }

  @action
  void setDescCostCenter(String value) => descCostCenter = value;

  @action
  void setProductionType(ProductionType? value) => productionType = value;

  @action
  void setExtraPercentage(String value) => extraPercentage = value;

  @action
  void setReportType(ReportType? value) => reportType = value;

  @action
  void setCalculateNightTime(bool value) => calculateNightTime = value;

  @action
  void setHourDays(String value) => hourDays = value;

  @action
  void setInvoiceAmount(String value) => invoiceAmount = value;

  @action
  void setValueInvoice(String value) => valueInvoice = value;

  @action
  void setQuantity(String? value) {
    quantity = value;
    if (quantity != null && unitaryValue != null) {
      totalValue = double.tryParse(unitaryValue!.replaceAll(',', '.'))! *
          int.tryParse(quantity!)!;
    }
  }

  @action
  void setUnitaryValue(String value) {
    unitaryValue = value;
    if (quantity != null && unitaryValue != null) {
      totalValue = double.tryParse(unitaryValue!.replaceAll(',', '.'))! *
          int.tryParse(quantity!)!;
    }
  }

  @computed
  bool get descriptionServiceValid =>
      descriptionService != null && descriptionService!.isNotEmpty;
  String? get descriptionServiceError {
    if (!_showErrors || descriptionServiceValid) {
      return null;
    } else {
      return 'Descrição do Serviço obrigatório';
    }
  }

  @computed
  bool get descCostCenterValid =>
      descCostCenter != null && descCostCenter != null;
  String? get descCostCenterError {
    if (!_showErrors || descCostCenterValid) {
      return null;
    } else {
      return 'Descrição Centro de Custo Obrigatória';
    }
  }

  @computed
  bool get productionTypeValid => productionType != null;
  String? get productionTypeError {
    if (!_showErrors || productionTypeValid) {
      return null;
    } else {
      return 'Tipo de Produção Obrigatória';
    }
  }

  @computed
  bool get extraPercentageValid =>
      extraPercentage != null && extraPercentage!.isNotEmpty;
  String? get extraPercentageError {
    if (!_showErrors || extraPercentageValid) {
      return null;
    } else {
      return 'Percentual Extra Obrigatório';
    }
  }

  @computed
  bool get reportTypeValid => reportType != null && reportType != null;
  String? get reportTypeError {
    if (!_showErrors || reportTypeValid) {
      return null;
    } else {
      return 'Tipo de Produção Obrigatória';
    }
  }

  @computed
  bool get hourDaysValid =>
      calculateNightTime ? hourDays != null && hourDays!.isNotEmpty : true;
  String? get hourDaysError {
    if (!_showErrors || hourDaysValid) {
      return null;
    } else {
      return 'Hora extra Obrigatória';
    }
  }

  // @computed
  // bool get valuePayrollValid =>
  //     valuePayroll != null && valuePayroll!.isNotEmpty;
  // String? get valuePayrollError {
  //   if (!_showErrors || valuePayrollValid) {
  //     return null;
  //   } else {
  //     return 'Valor para Folha Obrigatória';
  //   }
  // }

  @computed
  bool get invoiceAmountValid =>
      invoiceAmount != null && invoiceAmount!.isNotEmpty;
  String? get invoiceAmountError {
    if (!_showErrors || invoiceAmountValid) {
      return null;
    } else {
      return 'Valor para Fatura Obrigatória';
    }
  }

  @computed
  bool get valueInvoiceValid =>
      valueInvoice != null && valueInvoice!.isNotEmpty;
  String? get valueInvoiceError {
    if (!_showErrors || valueInvoiceValid) {
      return null;
    } else {
      return 'Valor para nota fiscal Obrigatória';
    }
  }

  @computed
  bool get quantityValid =>
      quantity != null && quantity!.isNotEmpty && quantity != '0';
  String? get quantityError {
    if (!_showErrors || quantityValid) {
      return null;
    } else if (quantity == '0') {
      return 'inválida';
    } else {
      return 'Obrigatorio';
    }
  }

  @computed
  bool get unitaryValueValid =>
      unitaryValue != null && unitaryValue!.isNotEmpty;
  String? get unitaryValueError {
    if (!_showErrors || unitaryValueValid) {
      return null;
    } else {
      return 'Valor unitário Obrigatório';
    }
  }

  @action
  void invalidSendPressed() => _showErrors = true;

  @computed
  bool get isFormValid =>
      descriptionServiceValid &&
      productionTypeValid &&
      reportTypeValid &&
      quantityValid &&
      unitaryValueValid &&
      valueInvoiceValid &&
      invoiceAmountValid;

  @computed
  dynamic get sendPressed => isFormValid ? register : null;

  @action
  Future<void> register() async {
    try {
      _status = TaskServiceTakerRegisterStateStatus.loading;
      final task = TaskModel(
        code: _code,
        descriptionService: descriptionService!,
        descCostCenter: descCostCenter,
        extraPercentage: extraPercentage ?? '0.00',
        productionType: productionType!,
        servTaker: servTaker,
        reportType: reportType!,
        calculateNightTime: calculateNightTime,
        hourDays: hourDays,
        valuePayroll: _valuePayroll,
        invoiceAmount: double.parse(invoiceAmount!.replaceAll(',', '.')),
        valueInvoice: double.parse(valueInvoice!.replaceAll(',', '.')),
        quantity: int.tryParse(quantity!),
        unitaryValue: double.tryParse(unitaryValue!.replaceAll(',', '.')),
        syndicate: _syndicate,
        status: _statusTask ?? 0,
        access: _access ?? 0,
      );
      await TaskService().save(task);
      _status = TaskServiceTakerRegisterStateStatus.saved;
    } on Exception catch (e, s) {
      log('Erro ao registrar tarefa', error: e, stackTrace: s);
      _errorMessage = 'Erro ao registrar usuário';
      _status = TaskServiceTakerRegisterStateStatus.error;
    }
  }

  Future<void> loadData(TaskModel? model) async {
    _status = TaskServiceTakerRegisterStateStatus.loading;
    _code = model!.code;
    descriptionService = model.descriptionService;
    descCostCenter = model.descCostCenter ?? '';
    extraPercentage = model.extraPercentage;
    hourDays = model.hourDays ?? '0,00';
    invoiceAmount = model.invoiceAmount.toString();
    valueInvoice = model.valueInvoice.toString();
    productionType = ProductionType.parse(model.productionType!.acronym);
    reportType = ReportType.parse(model.reportType!.acronym);
    calculateNightTime = model.calculateNightTime;
    quantity = model.quantity.toString();
    unitaryValue = model.unitaryValue.toString();
    totalValue = model.unitaryValue! * model.quantity!;
    // syndicate = model.syndicate;
    servTaker = model.servTaker != null
        ? ServTakerModel(
            code: model.servTaker!.code,
            name: model.servTaker!.name,
          )
        : ServTakerModel(code: '', name: '');
    _access = model.access;
    _statusTask = model.status;
    _syndicate = model.syndicate;
    _valuePayroll = model.valuePayroll;
    _status = TaskServiceTakerRegisterStateStatus.loaded;
  }
}
