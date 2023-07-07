import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../core/ui/helpers/loader.dart';
import '../../../../../../core/ui/helpers/messages.dart';
import '../../../../../../core/ui/styles/text_styles.dart';
import '../../../../../../core/widget/text_field_changed_widget.dart';
import '../../../../../../core/widget/text_field_widget.dart';
import '../../../../../../models/worker_model.dart';
import '../../../../worker/profile/documents/widgets/employeer_picker.dart';
import 'document_data_controller.dart';

class DocumentDataPage extends StatefulWidget {
  final WorkerModel worker;
  const DocumentDataPage(this.worker, {super.key});

  @override
  State<DocumentDataPage> createState() => _DocumentDataPageState();
}

class _DocumentDataPageState extends State<DocumentDataPage>
    with Loader, Messages {
  final DocumentDataController controller = DocumentDataController();
  late final ReactionDisposer statusDisposer;

  final cpfEC = TextEditingController();
  final rgEC = TextEditingController();
  final orgaoEmissorEC = TextEditingController();
  final dataEmissaoEC = TextEditingController();
  final employeerEC = TextEditingController();

  @override
  void initState() {
    controller.getData(widget.worker);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case DocumentDataStateStatus.initial:
            break;
          case DocumentDataStateStatus.loading:
            showLoader();
            break;
          case DocumentDataStateStatus.loaded:
            hideLoader();
            break;
          case DocumentDataStateStatus.saved:
            hideLoader();
            Navigator.pop(context, controller.workerModel);
            break;
          case DocumentDataStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
      dataEmissaoEC.text = controller.dataEmissao ?? '';
    });
    super.initState();
  }

  Future<String?> showDateDialog(String? initialValue) async {
    final now = DateTime.now();
    final initialDate = initialValue != null
        ? DateFormat('dd/MM/yyyy').parse(initialValue)
        : DateTime.utc(now.year - 18, now.month, now.day);
    final DateTime? pickedDate = await showDatePicker(
      context: context,
      initialDate: initialDate,
      firstDate: DateTime(1950),
      lastDate: DateTime(2100),
    );

    if (pickedDate != null) {
      final String formattedDate = DateFormat('dd/MM/yyyy').format(pickedDate);
      return formattedDate;
    }
    return null;
  }

  Future<EmployeerModel?> showDialogEmployeer() async {
    final employeerResult = await showDialog(
      context: context,
      builder: (context) => const EmployeerPicker(),
    );
    if (employeerResult != null) {
      return employeerResult;
    } else {
      return null;
    }
  }

  @override
  void dispose() {
    cpfEC.dispose();
    rgEC.dispose();
    orgaoEmissorEC.dispose();
    dataEmissaoEC.dispose();
    employeerEC.dispose();
    statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          'Meus Documentos',
          style: context.textStyles.textBold.copyWith(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: cpfEC,
                  label: 'CPF',
                  hintText: 'Digite seu CPF',
                  errorText: controller.cpfError,
                  onChanged: controller.setCPF,
                  initialValue: controller.cpf,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: rgEC,
                  label: 'RG',
                  hintText: 'Digite seu RG',
                  errorText: controller.rgError,
                  onChanged: controller.setRG,
                  initialValue: controller.rg,
                  keyboardType: TextInputType.number,
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: orgaoEmissorEC,
                  label: 'Órgão emissor',
                  hintText: 'Digite o órgao do seu RG',
                  errorText: controller.orgaoEmissorError,
                  onChanged: controller.setOrgaoEmissor,
                  initialValue: controller.orgaoEmissor,
                ),
              ),
              // Observer(
              //   builder: (_) => TextFieldChangedWidget(
              //     controller: dataEmissaoEC,
              //     label: 'Data de Emissão',
              //     hintText: 'dd/mm/aaaa',
              //     readOnly: true,
              //     initialValue: controller.dataEmissao,
              //     errorText: controller.dataEmissaoError,
              //     onTap: () async {
              //       final result = await showDateDialog(controller.dataEmissao);
              //       if (result != null) {
              //         dataEmissaoEC.text = result;
              //         controller.setDataEmissao(result);
              //       }
              //     },
              //   ),
              // ),
              Observer(
                builder: (_) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Data de Emissão',
                        style: context.textStyles.textBold,
                      ),
                      const SizedBox(height: 8),
                      TextFormField(
                        controller: dataEmissaoEC,
                        // initialValue: controller.dataEmissao,
                        onChanged: controller.setDataEmissao,
                        decoration: InputDecoration(
                          fillColor: Colors.white,
                          errorText: controller.dataEmissaoError,
                          hintText: 'dd/mm/aaaa',
                          suffixIcon: IconButton(
                            icon: const Icon(Icons.date_range),
                            onPressed: () async {
                              final result =
                                  await showDateDialog(controller.dataEmissao);
                              if (result != null) {
                                dataEmissaoEC.text = result;
                                controller.setDataEmissao(result);
                              }
                            },
                          ),
                        ),
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          DataInputFormatter(),
                        ],

                        // onTap: () {},
                      )
                    ],
                  ),
                ),
              ),
              Observer(
                builder: (_) => TextFieldChangedWidget(
                  controller: employeerEC,
                  label: 'Empregadora',
                  hintText: '',
                  readOnly: true,
                  initialValue: controller.employeer!.name,
                  errorText: controller.employeerError,
                  onTap: () async {
                    final result = await showDialogEmployeer();
                    if (result != null) {
                      employeerEC.text = result.name;
                      controller.setEmployeer(result);
                    }
                  },
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
                      child: const Text(
                        'Salvar Informações',
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
