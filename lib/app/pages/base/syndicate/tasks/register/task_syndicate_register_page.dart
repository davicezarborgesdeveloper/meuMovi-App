import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/ui/helpers/enums.dart';
import '../../../../../core/ui/helpers/loader.dart';
import '../../../../../core/ui/helpers/messages.dart';
import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../core/widget/dropdown_widget.dart';
import '../../../../../core/widget/register_success.dart';
import '../../../../../core/widget/text_field_changed_widget.dart';
import '../../../../../core/widget/text_field_widget.dart';
import '../../../../../models/task_model.dart';
import '../../../../auth/user_controller.dart';
import 'task_register_controller.dart';
import 'widgets/serv_taker_picker.dart';

class TasksSyndicateRegisterPage extends StatefulWidget {
  final TaskModel? task;
  const TasksSyndicateRegisterPage({this.task, super.key});

  @override
  State<TasksSyndicateRegisterPage> createState() =>
      _TasksSyndicateRegisterPageState();
}

class _TasksSyndicateRegisterPageState extends State<TasksSyndicateRegisterPage>
    with Loader, Messages {
  final UserController userCtrl = GetIt.I<UserController>();
  final TaskRegisterController controller = TaskRegisterController();
  late final ReactionDisposer statusDisposer;
  final descriptionServiceEC = TextEditingController();
  final companyNamEC = TextEditingController();
  final descCostCenterEC = TextEditingController();
  final extraPercentageEC = TextEditingController();
  final invoiceAmountEC = TextEditingController();
  final valueInvoiceEC = TextEditingController();
  final valuePayrollEC = TextEditingController();
  final quantityEC = TextEditingController();
  final unitaryValueEC = TextEditingController();
  final servTakerEC = TextEditingController();

  @override
  void initState() {
    if (widget.task != null) {
      controller.loadData(widget.task);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case TaskRegisterStateStatus.initial:
            break;
          case TaskRegisterStateStatus.loading:
            showLoader();
            break;
          case TaskRegisterStateStatus.loaded:
            hideLoader();
            break;
          case TaskRegisterStateStatus.saved:
            final navigator = Navigator.of(context);
            hideLoader();
            await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const RegisterSuccess(),
            );
            navigator.pop();

            break;
          case TaskRegisterStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
      controller.setSyndicate(userCtrl.syndicate!.user);
    });
    super.initState();
  }

  @override
  void dispose() {
    descriptionServiceEC.dispose();
    companyNamEC.dispose();
    descCostCenterEC.dispose();
    extraPercentageEC.dispose();
    invoiceAmountEC.dispose();
    valueInvoiceEC.dispose();
    valuePayrollEC.dispose();
    quantityEC.dispose();
    unitaryValueEC.dispose();
    servTakerEC.dispose();
    statusDisposer();
    super.dispose();
  }

  Future<ServTakerModel?> showDialogServTaker() async {
    final employeerResult = await showDialog(
      context: context,
      builder: (context) => const ServTakerPicker(),
    );
    if (employeerResult != null) {
      return employeerResult;
    } else {
      return null;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.i.bg,
        title: Text(
          'Tarefas',
          style: context.textStyles.textBold.copyWith(
            color: ColorsApp.i.primary,
          ),
        ),
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: descriptionServiceEC,
                  label: 'Descrição do Serviço',
                  hintText: '',
                  errorText: controller.descriptionServiceError,
                  onChanged: controller.setDescriptionService,
                  initialValue: controller.descriptionService,
                ),
              ),
              Observer(
                builder: (_) => TextFieldChangedWidget(
                  controller: servTakerEC,
                  label: 'Tomadora',
                  hintText: '',
                  readOnly: true,
                  errorText: controller.servTakerError,
                  initialValue: controller.servTaker!.name,
                  onTap: () async {
                    final result = await showDialogServTaker();
                    if (result != null) {
                      servTakerEC.text = result.name;
                      controller.setServTaker(result);
                    }
                  },
                ),
              ),
              Row(
                children: [
                  Observer(
                    builder: (_) => Expanded(
                      flex: 4,
                      child: DropdownWidget(
                        label: 'Tipo de Produção',
                        statusSelected: controller.productionType,
                        onSave: controller.setProductionType,
                        errorText: controller.productionTypeError,
                        listOptions: ProductionType.values,
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 2,
                    child: Observer(
                      builder: (_) => TextFieldWidget(
                        controller: extraPercentageEC,
                        label: 'Percentual Extras',
                        hintText: '0,00',
                        onChanged: controller.setExtraPercentage,
                        initialValue: controller.extraPercentage,
                        keyboardType: const TextInputType.numberWithOptions(
                          decimal: true,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Observer(
                builder: (_) => DropdownWidget(
                  label: 'Informe',
                  statusSelected: controller.reportType,
                  onSave: controller.setReportType,
                  errorText: controller.reportTypeError,
                  listOptions: ReportType.values,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Observer(
                      builder: (_) => TextFieldWidget(
                        controller: quantityEC,
                        label: 'Qtde.',
                        hintText: '0',
                        keyboardType: TextInputType.number,
                        errorText: controller.quantityError,
                        onChanged: (value) async {
                          controller.setQuantity(value);
                          if (controller.quantity != null &&
                              controller.unitaryValue != null &&
                              controller.quantity!.isNotEmpty &&
                              controller.unitaryValue!.isNotEmpty) {
                            valuePayrollEC.text = UtilBrasilFields.obterReal(
                              double.tryParse(
                                    controller.unitaryValue!
                                        .replaceAll('.', '')
                                        .replaceAll(',', '.'),
                                  )! *
                                  int.tryParse(controller.quantity!)!,
                              moeda: false,
                            );
                            controller.setInvoiceAmount(valuePayrollEC.text);
                            controller.setValueInvoice(valuePayrollEC.text);
                            controller.setValuePayroll(valuePayrollEC.text);
                            invoiceAmountEC.text = valuePayrollEC.text;
                            valueInvoiceEC.text = valuePayrollEC.text;
                          } else {
                            valuePayrollEC.clear();
                            invoiceAmountEC.clear();
                            valueInvoiceEC.clear();
                            controller.setInvoiceAmount(null);
                            controller.setValueInvoice(null);
                            controller.setValuePayroll(null);
                          }
                        },
                        initialValue: controller.quantity,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(3),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 4,
                    child: Observer(
                      builder: (_) => TextFieldWidget(
                        controller: unitaryValueEC,
                        label: 'Valor unitário',
                        hintText: '0,00',
                        errorText: controller.unitaryValueError,
                        onChanged: (value) async {
                          controller.setUnitaryValue(value);
                          if (controller.quantity != null &&
                              controller.unitaryValue != null &&
                              controller.quantity!.isNotEmpty &&
                              controller.unitaryValue!.isNotEmpty) {
                            valuePayrollEC.text = UtilBrasilFields.obterReal(
                              double.tryParse(
                                    controller.unitaryValue!
                                        .replaceAll('.', '')
                                        .replaceAll(',', '.'),
                                  )! *
                                  int.tryParse(controller.quantity!)!,
                              moeda: false,
                            );
                            controller.setInvoiceAmount(valuePayrollEC.text);
                            controller.setValueInvoice(valuePayrollEC.text);
                            controller.setValuePayroll(valuePayrollEC.text);
                            invoiceAmountEC.text = valuePayrollEC.text;
                            valueInvoiceEC.text = valuePayrollEC.text;
                          } else {
                            valuePayrollEC.clear();
                            invoiceAmountEC.clear();
                            valueInvoiceEC.clear();
                            controller.setInvoiceAmount(null);
                            controller.setValueInvoice(null);
                            controller.setValuePayroll(null);
                          }
                        },
                        // onChanged: controller.setUnitaryValue,
                        initialValue: controller.unitaryValue,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CentavosInputFormatter(),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                ],
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  label: 'Valor p/Folha',
                  hintText: '',
                  controller: valuePayrollEC,
                  errorText: controller.valuePayrollError,
                  onChanged: controller.setValuePayroll,
                  initialValue: controller.valuePayroll,
                  keyboardType: TextInputType.number,
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  label: 'Valor p/Fatura',
                  hintText: '',
                  controller: invoiceAmountEC,
                  errorText: controller.invoiceAmountError,
                  onChanged: controller.setInvoiceAmount,
                  initialValue: controller.invoiceAmount,
                  keyboardType: TextInputType.number,
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  label: 'Valor p/ Nota Fiscal',
                  hintText: '',
                  controller: valueInvoiceEC,
                  errorText: controller.valueInvoiceError,
                  onChanged: controller.setValueInvoice,
                  initialValue: controller.valueInvoice,
                  keyboardType: TextInputType.number,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Observer(
                builder: (_) => SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: GestureDetector(
                    onTap: controller.invalidSendPressed,
                    child: ElevatedButton(
                      onPressed: controller.sendPressed,
                      child: Text(
                        widget.task != null
                            ? 'Alterar Cadastro'
                            : 'Confirmar cadastro',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
