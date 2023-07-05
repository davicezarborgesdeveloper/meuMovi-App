import 'dart:developer';

import 'package:mobx/mobx.dart';

import '../../../../../core/ui/helpers/enums.dart';
import '../../../../../models/service_taker_model.dart';
import '../../../../../models/task_model.dart';
import '../../../../../services/task/task_service.dart';
part 'task_register_controller.g.dart';

enum TaskRegisterStateStatus {
  initial,
  loading,
  loaded,
  error,
  saved,
}

class TaskRegisterController = TaskRegisterControllerBase
    with _$TaskRegisterController;

abstract class TaskRegisterControllerBase with Store {
  @readonly
  var _status = TaskRegisterStateStatus.initial;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  @readonly
  String? _code;

  @observable
  String? descriptionService;

  @observable
  ServiceTakerModel? serviceTaker;

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
  String? valuePayroll;

  @observable
  String? invoiceAmount;

  @observable
  String? valueInvoice;

  @readonly
  String? _syndicate;

  @readonly
  int? _access;

  @readonly
  int? _statusTask;

  @observable
  String? quantity;

  @readonly
  double? _unitaryValue;

  @readonly
  double? _totalValue;

  @action
  void setDescriptionService(String value) => descriptionService = value;

  @action
  void setServiceTaker(ServiceTakerModel? value) => serviceTaker = value;

  @action
  void setServTaker(ServTakerModel? value) => servTaker = value;

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
  void setValuePayroll(String value) => valuePayroll = value;

  @action
  void setInvoiceAmount(String value) => invoiceAmount = value;

  @action
  void setValueInvoice(String value) => valueInvoice = value;

  @action
  void setQuantity(String? value) {
    quantity = value;
    if (quantity != null) {
      _totalValue = _unitaryValue! * int.tryParse(quantity!)!;
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
  bool get serviceTakerValid => serviceTaker != null && serviceTaker != null;
  String? get serviceTakerError {
    if (!_showErrors || serviceTakerValid) {
      return null;
    } else {
      return 'Tomadora de Serviço Obrigatório';
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
  bool get productionTypeValid =>
      productionType != null && productionType != null;
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
  bool get servTakerValid => servTaker != null;
  String? get servTakerError {
    if (!_showErrors || servTakerValid) {
      return null;
    } else {
      return 'Tomadora Obrigatória';
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

  @computed
  bool get valuePayrollValid =>
      valuePayroll != null && valuePayroll!.isNotEmpty;
  String? get valuePayrollError {
    if (!_showErrors || valuePayrollValid) {
      return null;
    } else {
      return 'Valor para Folha Obrigatória';
    }
  }

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

  @action
  void invalidSendPressed() => _showErrors = true;

  @computed
  bool get isFormValid =>
      descriptionServiceValid &&
      productionTypeValid &&
      reportTypeValid &&
      hourDaysValid &&
      valuePayrollValid &&
      invoiceAmountValid &&
      valueInvoiceValid;

  @computed
  dynamic get sendPressed => isFormValid ? register : null;

  @action
  Future<void> register() async {
    try {
      _status = TaskRegisterStateStatus.loading;
      final task = TaskModel(
        code: _code,
        descriptionService: descriptionService!,
        descCostCenter: descCostCenter,
        extraPercentage: extraPercentage ?? '0.00',
        productionType: productionType!,
        servTaker: ServTakerModel(
          code: servTaker!.code,
          name: servTaker!.name,
        ),
        reportType: reportType!,
        calculateNightTime: calculateNightTime,
        hourDays: hourDays,
        valuePayroll: double.parse(valuePayroll!.replaceAll(',', '.')),
        invoiceAmount: double.parse(invoiceAmount!.replaceAll(',', '.')),
        valueInvoice: double.parse(valueInvoice!.replaceAll(',', '.')),
        syndicate: _syndicate,
        status: _statusTask ?? 0,
        access: _access ?? 0,
      );
      await TaskService().save(task);
      _status = TaskRegisterStateStatus.saved;
    } on Exception catch (e, s) {
      log('Erro ao registrar tarefa', error: e, stackTrace: s);
      _errorMessage = 'Erro ao registrar usuário';
      _status = TaskRegisterStateStatus.error;
    }
  }

  Future<void> loadData(TaskModel? model) async {
    _status = TaskRegisterStateStatus.loading;
    _code = model!.code;
    descriptionService = model.descriptionService;
    descCostCenter = model.descCostCenter;
    extraPercentage = model.extraPercentage;
    hourDays = model.hourDays ?? '0,00';
    valuePayroll = model.valuePayroll.toString();
    invoiceAmount = model.invoiceAmount.toString();
    valueInvoice = model.valueInvoice.toString();
    productionType = ProductionType.parse(model.productionType!.acronym);
    reportType = ReportType.parse(model.reportType!.acronym);
    servTaker = model.servTaker != null
        ? ServTakerModel(
            code: model.servTaker!.code,
            name: model.servTaker!.name,
          )
        : ServTakerModel(code: '', name: '');
    _access = model.access;
    _statusTask = model.status;
    _syndicate = model.syndicate;
    valueInvoice = model.valueInvoice.toString();
    _status = TaskRegisterStateStatus.loaded;
    quantity = model.quantity.toString();
    _unitaryValue = model.unitaryValue;
    _totalValue = model.unitaryValue! * model.quantity!;
  }
}
