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
import '../../../../../core/widget/text_field_widget.dart';
import '../../../../../core/widget/title_bar_form.dart';
import '../../../../../models/task_model.dart';
import '../../../../auth/user_controller.dart';
import '../../../syndicate/tasks/register/widgets/serv_taker_picker.dart';
import 'task_service_taker_register_controller.dart';

class TaskServiceTakerRegisterPage extends StatefulWidget {
  final TaskModel? task;
  const TaskServiceTakerRegisterPage({this.task, super.key});

  @override
  State<TaskServiceTakerRegisterPage> createState() =>
      _TaskServiceTakerRegisterPageState();
}

class _TaskServiceTakerRegisterPageState
    extends State<TaskServiceTakerRegisterPage> with Loader, Messages {
  final UserController userCtrl = GetIt.I<UserController>();
  late final TaskServiceTakerRegisterController controller =
      TaskServiceTakerRegisterController();
  late final ReactionDisposer statusDisposer;
  final descriptionServiceEC = TextEditingController();
  final descCostCenterEC = TextEditingController();
  final extraPercentageEC = TextEditingController();
  final hourDaysEC = TextEditingController();
  final hourUnitaryEC = TextEditingController();
  // final valuePayrollEC = TextEditingController();
  final invoiceAmountEC = TextEditingController();
  final valueInvoiceEC = TextEditingController();
  final quantityEC = TextEditingController();
  final unitaryValueEC = TextEditingController();

  @override
  void initState() {
    if (widget.task != null) {
      controller.loadData(widget.task);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case TaskServiceTakerRegisterStateStatus.initial:
            break;
          case TaskServiceTakerRegisterStateStatus.loading:
            showLoader();
            break;
          case TaskServiceTakerRegisterStateStatus.loaded:
            hideLoader();
            break;
          case TaskServiceTakerRegisterStateStatus.saved:
            final navigator = Navigator.of(context);
            hideLoader();
            await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const RegisterSuccess(),
            );
            navigator.pop();

            break;
          case TaskServiceTakerRegisterStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
      controller.setServTaker(userCtrl.serviceTaker);
    });
    super.initState();
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

  Future<void> calculatetime() async {
    if (controller.quantity != null &&
        controller.unitaryValue != null &&
        controller.quantity!.isNotEmpty &&
        controller.unitaryValue!.isNotEmpty) {
      final quantity = int.tryParse(controller.quantity!)!;
      final unitaryValue = double.tryParse(
        controller.unitaryValue!.replaceAll('.', '').replaceAll(',', '.'),
      );

      double valueAmount = 0.0;
      valueAmount = unitaryValue! * quantity;
      if (controller.hourDays != null &&
          controller.hourUnitary != null &&
          controller.hourDays!.isNotEmpty &&
          controller.hourUnitary!.isNotEmpty) {
        final hourQuantity =
            double.tryParse(controller.hourDays!.replaceAll(',', '.'))!;
        final unitaryValue = double.tryParse(
          controller.hourUnitary!.replaceAll('.', '').replaceAll(',', '.'),
        );
        valueAmount += unitaryValue! * hourQuantity;
      }
      final String valueText = UtilBrasilFields.obterReal(
        valueAmount,
        moeda: false,
      );
      valueInvoiceEC.text = valueText;
      controller.setInvoiceAmount(valueText);
      controller.setValueInvoice(valueText);
      controller.setValuePayroll(valueText);
      invoiceAmountEC.text = valueText;
    } else {
      valueInvoiceEC.clear();
      invoiceAmountEC.clear();
      controller.setInvoiceAmount(null);
      controller.setValueInvoice(null);
      controller.setValuePayroll(null);
    }
  }

  @override
  void dispose() {
    descriptionServiceEC.dispose();
    descCostCenterEC.dispose();
    extraPercentageEC.dispose();
    hourDaysEC.dispose();
    hourUnitaryEC.dispose();
    // valuePayrollEC.dispose();
    invoiceAmountEC.dispose();
    valueInvoiceEC.dispose();
    quantityEC.dispose();
    unitaryValueEC.dispose();
    statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.i.bg,
        title: Text(
          'Tarefas',
          style: context.textStyles.textBold
              .copyWith(color: ColorsApp.i.secondary),
        ),
        iconTheme: IconThemeData(color: ColorsApp.i.secondary),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              TitleBarForm(
                title: 'Informações Gerais',
                titleColor: ColorsApp.i.secondaryDark,
              ),
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
              // // Observer(
              // //   builder: (_) => TextFieldWidget(
              // //     controller: descCostCenterEC,
              // //     label: 'Descrição do Centro de Custo',
              // //     hintText: '',
              // //     onChanged: controller.setDescCostCenter,
              // //     initialValue: controller.descCostCenter,
              // //   ),
              // // ),
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
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          CentavosInputFormatter(),
                        ],
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
              const SizedBox(
                height: 4,
              ),
              TitleBarForm(
                title: 'Hora Extra',
                titleColor: ColorsApp.i.secondaryDark,
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Observer(
                      builder: (_) => TextFieldWidget(
                        controller: hourDaysEC,
                        label: 'Qtde. Horas',
                        hintText: '0',
                        onChanged: (value) async {
                          controller.setHourDays(value);
                          calculatetime();
                        },
                        initialValue: controller.hourDays,
                        keyboardType: TextInputType.number,
                        // inputFormatters: [
                        //   FilteringTextInputFormatter.digitsOnly,
                        //   CentavosInputFormatter(),
                        // ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 8),
                  Expanded(
                    flex: 4,
                    child: Observer(
                      builder: (_) => TextFieldWidget(
                        controller: hourUnitaryEC,
                        label: 'Valor unitário',
                        hintText: '0,00',
                        errorText: controller.hourUnitaryError,
                        onChanged: (value) async {
                          controller.setHourUnitary(value);
                          calculatetime();
                        },
                        initialValue: controller.hourUnitary,
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
              const SizedBox(height: 16),
              TitleBarForm(
                title: 'Valores da Tarefa',
                titleColor: ColorsApp.i.secondaryDark,
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
                          calculatetime();
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
                          calculatetime();
                        },
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
              // Observer(
              //   builder: (_) => TextFieldWidget(
              //     controller: valuePayrollEC,
              //     label: 'Valor p/ Folha',
              //     hintText: '',
              //     errorText: controller.valuePayrollError,
              //     onChanged: controller.setValuePayroll,
              //     initialValue: controller.valuePayroll,
              //     keyboardType: TextInputType.number,
              //   ),
              // ),
              Observer(
                builder: (_) => TextFieldWidget(
                  label: 'Valor p/Fatura',
                  hintText: '',
                  controller: invoiceAmountEC,
                  errorText: controller.invoiceAmountError,
                  onChanged: controller.setInvoiceAmount,
                  initialValue: controller.invoiceAmount,
                  // keyboardType: TextInputType.number,
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
                  // keyboardType: TextInputType.number,
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
