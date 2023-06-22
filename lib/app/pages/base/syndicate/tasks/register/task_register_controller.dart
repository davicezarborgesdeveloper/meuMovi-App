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
  String? companyId;

  @observable
  String? companyName;

  @observable
  ServiceTakerModel? serviceTaker;

  @observable
  String? idCostCenter;

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

  @action
  void setDescriptionService(String value) => descriptionService = value;

  @action
  void setCompanyId(String value) => companyId = value;

  @action
  void setCompanyName(String value) => companyName = value;

  @action
  void setServiceTaker(ServiceTakerModel? value) => serviceTaker = value;

  @action
  void setIdCostCenter(String value) => idCostCenter = value;

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
  bool get companyIdValid => companyId != null && companyId!.isNotEmpty;
  String? get companyIdError {
    if (!_showErrors || companyIdValid) {
      return null;
    } else {
      return 'Codigo da tomadora obrigatório';
    }
  }

  @computed
  bool get companyNameValid => companyName != null && companyName!.isNotEmpty;
  String? get companyNameError {
    if (!_showErrors || companyNameValid) {
      return null;
    } else {
      return 'Nome fantasia da tomadora obrigatório';
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
  bool get idCostCenterValid =>
      idCostCenter != null && idCostCenter!.isNotEmpty;
  String? get idCostCenterError {
    if (!_showErrors || idCostCenterValid) {
      return null;
    } else {
      return 'Identificação Centro de Custo Obrigatória';
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

  @action
  void invalidSendPressed() => _showErrors = true;

  @computed
  bool get isFormValid =>
      descriptionServiceValid &&
      companyNameValid &&
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
        companyId: companyId,
        companyName: companyName!,
        // serviceTaker: serviceTaker!,
        idCostCenter: idCostCenter,
        descCostCenter: descCostCenter,
        extraPercentage: extraPercentage ?? '0.00',
        productionType: productionType!,
        reportType: reportType!,
        calculateNightTime: calculateNightTime,
        hourDays: hourDays,
        valuePayroll: double.parse(valuePayroll!.replaceAll(',', '.')),
        invoiceAmount: double.parse(invoiceAmount!.replaceAll(',', '.')),
        valueInvoice: double.parse(valueInvoice!.replaceAll(',', '.')),
      );
      await TaskService().save(task);
      _status = TaskRegisterStateStatus.saved;
    } on Exception catch (e, s) {
      log('Erro ao registrar tarefa', error: e, stackTrace: s);
      _errorMessage = 'Erro ao registrar usuário';
      _status = TaskRegisterStateStatus.error;
    }
  }

  Future<void> loadData(TaskModel? taskmodel) async {
    _status = TaskRegisterStateStatus.loading;
    _code = taskmodel!.code;
    descriptionService = taskmodel.descriptionService;
    companyId = taskmodel.companyId!;
    companyName = taskmodel.companyName;
    idCostCenter = taskmodel.idCostCenter!;
    descCostCenter = taskmodel.descCostCenter!;
    extraPercentage = taskmodel.extraPercentage;
    hourDays = taskmodel.hourDays ?? '0,00';
    valuePayroll = taskmodel.valuePayroll.toString();
    invoiceAmount = taskmodel.invoiceAmount.toString();
    valueInvoice = taskmodel.valueInvoice.toString();
    productionType = ProductionType.parse(taskmodel.productionType!.acronym);
    reportType = ReportType.parse(taskmodel.reportType!.acronym);
    _status = TaskRegisterStateStatus.loaded;
  }
}
