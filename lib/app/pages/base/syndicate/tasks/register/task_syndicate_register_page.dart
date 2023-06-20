import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
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
import 'task_register_controller.dart';

class TasksSyndicateRegisterPage extends StatefulWidget {
  const TasksSyndicateRegisterPage({super.key});

  @override
  State<TasksSyndicateRegisterPage> createState() =>
      _TasksSyndicateRegisterPageState();
}

class _TasksSyndicateRegisterPageState extends State<TasksSyndicateRegisterPage>
    with Loader, Messages {
  final TaskRegisterController controller = TaskRegisterController();
  late final ReactionDisposer statusDisposer;
  final serviceTakerEC = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
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
            hideLoader();
            showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const RegisterSuccess(),
            );
            break;
          case TaskRegisterStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    serviceTakerEC.dispose();
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
                  label: 'Descrição do Serviço',
                  hintText: '',
                  errorText: controller.descriptionServiceError,
                  onChanged: controller.setDescriptionService,
                  initialValue: controller.descriptionService,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'cod.',
                            style: context.textStyles.textBold,
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            onChanged: controller.setCompanyId,
                            decoration: InputDecoration(
                              errorText: controller.companyIdError,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Razão Social da Tomadora',
                            style: context.textStyles.textBold,
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            onChanged: controller.setCompanyName,
                            decoration: InputDecoration(
                              errorText: controller.companyNameError,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'cod.',
                            style: context.textStyles.textBold,
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            onChanged: controller.setIdCostCenter,
                            decoration: InputDecoration(
                              errorText: controller.idCostCenterError,
                            ),
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 5,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Descrição do Centro de Custo',
                            style: context.textStyles.textBold,
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            onChanged: controller.setDescCostCenter,
                            decoration: InputDecoration(
                              errorText: controller.descCostCenterError,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
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
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 0, 0, 0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Percentual Extras',
                            style: context.textStyles.textBold,
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            onChanged: controller.setExtraPercentage,
                            decoration: InputDecoration(
                              errorText: controller.extraPercentageError,
                              isDense: false,
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CentavosInputFormatter()
                            ],
                          ),
                        ],
                      ),
                    ),
                  )
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
                      child: const Text('Confirmar cadastro'),
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
