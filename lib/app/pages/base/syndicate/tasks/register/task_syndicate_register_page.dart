import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/extensions/formatter_extensions.dart';
import '../../../../../core/ui/helpers/loader.dart';
import '../../../../../core/ui/helpers/messages.dart';
import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../core/widget/register_success.dart';
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
  late final TaskRegisterController controller = TaskRegisterController();
  late final ReactionDisposer statusDisposer;
  final descriptionServiceEC = TextEditingController();
  final companyNamEC = TextEditingController();
  final descCostCenterEC = TextEditingController();
  final extraPercentageEC = TextEditingController();
  final hourDaysEC = TextEditingController();
  final valuePayrollEC = TextEditingController();
  final invoiceAmountEC = TextEditingController();
  final valueInvoiceEC = TextEditingController();
  final quantityEC = TextEditingController();
  final employeerEC = TextEditingController();

  @override
  void initState() {
    if (widget.task != null) {
      controller.loadData(widget.task);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
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
    quantityEC.dispose();
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
              Text(
                'Descrição do Serviço',
                style: context.textStyles.textBold,
              ),
              const SizedBox(height: 4),
              Text(
                controller.descriptionService!,
                style: context.textStyles.textRegular.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 12),
              Text(
                'Tomadora',
                style: context.textStyles.textBold,
              ),
              const SizedBox(height: 4),
              Text(
                controller.servTaker!.name,
                style: context.textStyles.textRegular.copyWith(fontSize: 16),
              ),
              const SizedBox(height: 12),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tipo de Produção',
                        style: context.textStyles.textBold,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        controller.productionType!.name,
                        style: context.textStyles.textRegular
                            .copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Percentual Extras',
                        style: context.textStyles.textBold,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        controller.extraPercentage ?? '0.00',
                        style: context.textStyles.textRegular
                            .copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 12),
              Text(
                'Informe',
                style: context.textStyles.textBold,
              ),
              const SizedBox(height: 4),
              Text(
                controller.reportType!.name,
                style: context.textStyles.textRegular.copyWith(fontSize: 16),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: 70,
                    child: Observer(
                      builder: (_) => TextFieldWidget(
                        controller: quantityEC,
                        label: 'Qtde.',
                        hintText: '0',
                        keyboardType: TextInputType.number,
                        errorText: controller.quantityError,
                        onChanged: controller.setQuantity,
                        initialValue: controller.quantity,
                        inputFormatters: [
                          LengthLimitingTextInputFormatter(3),
                          FilteringTextInputFormatter.digitsOnly,
                        ],
                      ),
                    ),
                  ),
                  // Column(
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: [
                  //     Text(
                  //       'Qtde.',
                  //       style: context.textStyles.textBold,
                  //     ),
                  //     const SizedBox(height: 4),
                  //     Text(
                  //       '${controller.quantity}',
                  //       style: context.textStyles.textRegular
                  //           .copyWith(fontSize: 16),
                  //     ),
                  //   ],
                  // ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Valor unitário',
                        style: context.textStyles.textBold,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        controller.unitaryValue!.currencyPTBR,
                        style: context.textStyles.textRegular
                            .copyWith(fontSize: 16),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Valor total',
                        style: context.textStyles.textBold,
                      ),
                      const SizedBox(height: 4),
                      Observer(
                        builder: (_) => Text(
                          controller.totalValue!.currencyPTBR,
                          style: context.textStyles.textRegular
                              .copyWith(fontSize: 16),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              // Row(
              //   crossAxisAlignment: CrossAxisAlignment.center,
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Row(
              //       crossAxisAlignment: CrossAxisAlignment.center,
              //       children: [
              //         Observer(
              //           builder: (_) => Checkbox(
              //             value: controller.calculateNightTime,
              //             onChanged: (value) =>
              //                 controller.setCalculateNightTime(value!),
              //           ),
              //         ),
              //         SizedBox(
              //           width: context.percentWidth(.4),
              //           child: const Text(
              //             'Calcular Horas Adicional Noturno na Produção',
              //           ),
              //         )
              //       ],
              //     ),
              //     Expanded(
              //       child: Padding(
              //         padding: const EdgeInsets.only(left: 8),
              //         child: Column(
              //           crossAxisAlignment: CrossAxisAlignment.start,
              //           children: [
              //             Text(
              //               'Horas Dias',
              //               style: context.textStyles.textBold,
              //             ),
              //             const SizedBox(height: 8),
              //             TextFormField(
              //               controller: hourDaysEC,
              //               onChanged: controller.setHourDays,
              //               decoration: InputDecoration(
              //                 errorText: controller.hourDaysError,
              //               ),
              //               keyboardType: TextInputType.number,
              //             ),
              //           ],
              //         ),
              //       ),
              //     ),
              //   ],
              // ),
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
