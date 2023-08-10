import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../controllers/syndicate/task_register_controller.dart';
import '../../../../controllers/user_controller.dart';
import '../../../../core/ui/helpers/enums.dart';
import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../core/widgets/dropdown_widget.dart';
import '../../../../core/widgets/service_taker_picker.dart';
import '../../../../core/widgets/text_field_changed_widget.dart';
import '../../../../core/widgets/text_field_widget.dart';
import '../../../../core/widgets/title_bar_form.dart';
import '../../../../models/task_model.dart';
import '../../../registerSuccess/register_success_page.dart';

class TaskSyndicateRegisterPage extends StatefulWidget {
  final TaskModel? task;
  const TaskSyndicateRegisterPage({this.task, super.key});

  @override
  State<TaskSyndicateRegisterPage> createState() =>
      _TaskSyndicateRegisterPageState();
}

class _TaskSyndicateRegisterPageState extends State<TaskSyndicateRegisterPage>
    with Loader, Messages {
  final UserController userCtrl = GetIt.I<UserController>();
  final TaskRegisterController controller = TaskRegisterController();
  late final ReactionDisposer statusDisposer;
  final descriptionServiceEC = TextEditingController();
  final companyNamEC = TextEditingController();
  final descCostCenterEC = TextEditingController();
  final extraPercentageEC = TextEditingController();
  final invoiceAmountEC = TextEditingController();
  final hourDaysEC = TextEditingController();
  final hourUnitaryEC = TextEditingController();
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
    controller.setMode(widget.task != null ? 1 : 0);
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
              builder: (_) => const RegisterSuccessPage(),
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

  Future<ServTakerModel?> showDialogServTaker() async {
    final result = await showDialog(
      context: context,
      builder: (context) => ServiceTakerPicker(
        syndicate: userCtrl.syndicate!.user,
      ),
    );
    if (result != null) {
      return result;
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
      controller.setInvoiceAmount(valueText);
      controller.setValueInvoice(valueText);
      controller.setValuePayroll(valueText);
      valuePayrollEC.text = valueText;
      valueInvoiceEC.text = valueText;

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
              TitleBarForm(
                title: 'Informações Gerais',
                titleColor: ColorsApp.i.primaryDark,
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
              Observer(
                builder: (_) => TextFieldChangedWidget(
                  controller: servTakerEC,
                  label: 'Tomadora',
                  hintText: '',
                  readOnly: true,
                  errorText: controller.servTakerError,
                  initialValue: controller.servTaker?.name,
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
                    flex: 4,
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
              TitleBarForm(
                title: 'Hora Extra',
                titleColor: ColorsApp.i.primaryDark,
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
                titleColor: ColorsApp.i.primaryDark,
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsApp.i.primary,
                      ),
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
