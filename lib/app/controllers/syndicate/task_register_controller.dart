import 'dart:developer';

import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../core/rest_client/custom_dio.dart';
import '../../core/ui/helpers/enums.dart';
import '../../models/task_model.dart';
import '../../services/task/task_service.dart';
import '../http_controller.dart';
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

  @observable
  int? mode;

  @readonly
  String? _errorMessage;

  @readonly
  bool _showErrors = false;

  @observable
  String? descriptionService;

  @observable
  ProductionType? productionType;

  @observable
  String? extraPercentage;

  @observable
  ReportType? reportType;

  @observable
  String? quantity;

  @observable
  String? unitaryValue;

  @observable
  String? invoiceAmount;

  @observable
  String? valueInvoice;

  @observable
  String? valuePayroll;

  @readonly
  int? _access;

  @readonly
  int? _statusTask;

  @observable
  ServTakerModel? servTaker;

  @observable
  bool calculateNightTime = false;

  @observable
  String? hourDays;

  @observable
  String? hourUnitary;

  @observable
  String? syndicate;

  @readonly
  String? _code;

  @action
  void setDescriptionService(String value) => descriptionService = value;

  @action
  void setProductionType(ProductionType? value) => productionType = value;

  @action
  void setExtraPercentage(String value) => extraPercentage = value;

  @action
  void setReportType(ReportType? value) => reportType = value;

  @action
  void setSyndicate(String value) => syndicate = value;

  @action
  void setQuantity(String? value) => quantity = value;

  @action
  void setUnitaryValue(String value) => unitaryValue = value;

  @action
  void setInvoiceAmount(String? value) => invoiceAmount = value;

  @action
  void setValueInvoice(String? value) => valueInvoice = value;

  @action
  void setValuePayroll(String? value) => valuePayroll = value;

  @action
  void setServTaker(ServTakerModel? value) => servTaker = value;

  @action
  void setCalculateNightTime(bool value) => calculateNightTime = value;

  @action
  void setHourDays(String value) => hourDays = value;

  @action
  void setHourUnitary(String value) => hourUnitary = value;

  @action
  void setMode(int value) => mode = value;

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
  bool get valuePayrollValid =>
      valuePayroll != null && valuePayroll!.isNotEmpty;
  String? get valuePayrollError {
    if (!_showErrors || valuePayrollValid) {
      return null;
    } else {
      return 'Valor para folha Obrigatória';
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
      _status = TaskRegisterStateStatus.loading;
      final CustomDio dio = GetIt.I<HttpController>().customDio!;
      final task = TaskModel(
        code: _code,
        descriptionService: descriptionService!,
        productionType: productionType!,
        extraPercentage: extraPercentage?.replaceAll(',', '.') ?? '0.00',
        servTaker: ServTakerModel(
          code: servTaker!.code,
          name: servTaker!.name,
        ),
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
        syndicate: syndicate,
        quantity: int.tryParse(quantity!),
        unitaryValue: double.tryParse(unitaryValue!.replaceAll(',', '.')),
        hourUnitary: hourUnitary != null
            ? double.tryParse(hourUnitary!.replaceAll(',', '.'))
            : null,
        totalValueTask: await setTotalTask(),
        status: _statusTask ?? 1,
        access: _access ?? 2,
      );
      if (mode == 0) {
        await TaskService(dio).save(task);
      } else {
        await TaskService(dio).update(task);
      }
      _status = TaskRegisterStateStatus.saved;
    } on Exception catch (e, s) {
      log('Erro ao registrar tarefa', error: e, stackTrace: s);
      _errorMessage = 'Erro ao registrar usuário';
      _status = TaskRegisterStateStatus.error;
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
    _status = TaskRegisterStateStatus.loading;
    _code = model!.code;
    descriptionService = model.descriptionService;
    extraPercentage = model.extraPercentage;
    valuePayroll = model.valuePayroll.toString().replaceAll('.', ',');
    invoiceAmount = model.invoiceAmount.toString().replaceAll('.', ',');
    valueInvoice = model.valueInvoice.toString().replaceAll('.', ',');
    hourDays = model.hourDays ?? '0,00';
    quantity = model.quantity.toString();
    unitaryValue = model.unitaryValue.toString().replaceAll('.', ',');
    hourUnitary = model.hourUnitary.toString().replaceAll('.', ',');
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
    syndicate = model.syndicate;
    quantity = model.quantity.toString();
    unitaryValue = model.unitaryValue.toString().replaceAll('.', ',');
    _status = TaskRegisterStateStatus.loaded;
  }
}
