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
  String? hourDays;

  @observable
  String? hourUnitary;

  @observable
  String? invoiceAmount;

  @observable
  String? valueInvoice;

  @readonly
  int? _access;

  @readonly
  int? _statusTask;

  @observable
  String? valuePayroll;

  @readonly
  String? _syndicate;

  @observable
  String? quantity;

  @observable
  String? unitaryValue;

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
  void setHourDays(String value) => hourDays = value;

  @action
  void setHourUnitary(String value) => hourUnitary = value;

  @action
  void setInvoiceAmount(String? value) => invoiceAmount = value;

  @action
  void setValueInvoice(String? value) => valueInvoice = value;

  @action
  void setValuePayroll(String? value) => valuePayroll = value;

  @action
  void setQuantity(String? value) => quantity = value;

  @action
  void setUnitaryValue(String value) => unitaryValue = value;

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

  @computed
  bool get hourUnitaryValid => hourDays != null && hourDays!.isNotEmpty
      ? hourUnitary != null && hourUnitary!.isNotEmpty
      : true;

  String? get hourUnitaryError {
    if (!_showErrors || hourUnitaryValid) {
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
      hourUnitaryValid &&
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
        productionType: productionType!,
        extraPercentage: extraPercentage ?? '0.00',
        servTaker: servTaker,
        reportType: reportType!,
        hourDays: hourDays,
        valuePayroll: double.parse(
          valuePayroll!.replaceAll('.', '').replaceAll(',', '.'),
        ),
        invoiceAmount: double.parse(
          invoiceAmount!.replaceAll('.', '').replaceAll(',', '.'),
        ),
        valueInvoice: double.parse(
          valueInvoice!.replaceAll('.', '').replaceAll(',', '.'),
        ),
        syndicate: _syndicate,
        quantity: int.tryParse(quantity!),
        unitaryValue: double.tryParse(unitaryValue!.replaceAll(',', '.')),
        hourUnitary: hourUnitary != null
            ? double.tryParse(hourUnitary!.replaceAll(',', '.'))
            : null,
        totalValueTask: await setTotalTask(),
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

  Future<double> setTotalTask() async {
    double total = (int.tryParse(quantity!)! *
        double.tryParse(unitaryValue!.replaceAll(',', '.'))!);
    if (hourDays != null && hourDays!.isNotEmpty && hourUnitary != null) {
      total += double.tryParse(hourDays!.replaceAll(',', '.'))! *
          double.tryParse(
            hourUnitary!.replaceAll('.', '').replaceAll(',', '.'),
          )!;
    }
    return total;
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
    quantity = model.quantity.toString();
    unitaryValue = model.unitaryValue.toString().replaceAll('.', ',');
    hourUnitary = model.hourUnitary.toString().replaceAll('.', ',');
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
    valuePayroll = model.valuePayroll.toString();
    _status = TaskServiceTakerRegisterStateStatus.loaded;
  }
}
