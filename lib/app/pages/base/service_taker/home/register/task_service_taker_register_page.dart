import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/ui/helpers/enums.dart';
import '../../../../../core/ui/helpers/loader.dart';
import '../../../../../core/ui/helpers/messages.dart';
import '../../../../../core/ui/helpers/size_extensions.dart';
import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../core/widget/dropdown_widget.dart';
import '../../../../../core/widget/register_success.dart';
import '../../../../../core/widget/text_field_widget.dart';
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
  final companyNamEC = TextEditingController();
  final descCostCenterEC = TextEditingController();
  final extraPercentageEC = TextEditingController();
  final hourDaysEC = TextEditingController();
  final valuePayrollEC = TextEditingController();
  final invoiceAmountEC = TextEditingController();
  final valueInvoiceEC = TextEditingController();
  final employeerEC = TextEditingController();

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

  @override
  void dispose() {
    descriptionServiceEC.dispose();
    companyNamEC.dispose();
    descCostCenterEC.dispose();
    extraPercentageEC.dispose();
    hourDaysEC.dispose();
    valuePayrollEC.dispose();
    invoiceAmountEC.dispose();
    valueInvoiceEC.dispose();
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
          style:
              context.textStyles.textBold.copyWith(color: ColorsApp.i.primary),
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
                builder: (_) => TextFieldWidget(
                  controller: descCostCenterEC,
                  label: 'Descrição do Centro de Custo',
                  hintText: '',
                  onChanged: controller.setDescCostCenter,
                  initialValue: controller.descCostCenter,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: DropdownWidget(
                      label: 'Tipo de Produção',
                      statusSelected: controller.productionType,
                      onSave: controller.setProductionType,
                      errorText: controller.productionTypeError,
                      listOptions: ProductionType.values,
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
                      ),
                    ),
                  ),
                ],
              ),
              DropdownWidget(
                label: 'Informe',
                statusSelected: controller.reportType,
                onSave: controller.setReportType,
                errorText: controller.reportTypeError,
                listOptions: ReportType.values,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Observer(
                        builder: (_) => Checkbox(
                          value: controller.calculateNightTime,
                          onChanged: (value) =>
                              controller.setCalculateNightTime(value!),
                        ),
                      ),
                      SizedBox(
                        width: context.percentWidth(.4),
                        child: const Text(
                          'Calcular Horas Adicional Noturno na Produção',
                        ),
                      )
                    ],
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Horas Dias',
                            style: context.textStyles.textBold,
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: hourDaysEC,
                            onChanged: controller.setHourDays,
                            decoration: InputDecoration(
                              errorText: controller.hourDaysError,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: valuePayrollEC,
                  label: 'Valor p/ Folha',
                  hintText: '',
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
              // Observer(
              //   builder: (_) => TextFieldWidget(
              //     label: 'Valor p/ Nota Fiscal',
              //     hintText: '',
              //     controller: valueInvoiceEC,
              //     errorText: controller.valueInvoiceError,
              //     onChanged: controller.setValueInvoice,
              //     initialValue: controller.valueInvoice,
              //     keyboardType: TextInputType.number,
              //   ),
              // ),
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
