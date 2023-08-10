import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../../../controllers/worker/profile_worker_documents_controller.dart';
import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../core/widgets/employeer_picker.dart';
import '../../../../core/widgets/text_field_changed_widget.dart';
import '../../../../core/widgets/text_field_widget.dart';
import '../../../../models/worker_model.dart';

class ProfileWorkerDocumentsPage extends StatefulWidget {
  final WorkerModel worker;
  const ProfileWorkerDocumentsPage(this.worker, {super.key});

  @override
  State<ProfileWorkerDocumentsPage> createState() =>
      _ProfileWorkerDocumentsPageState();
}

class _ProfileWorkerDocumentsPageState extends State<ProfileWorkerDocumentsPage>
    with Loader, Messages {
  final ProfileWorkerDocumentsController controller =
      ProfileWorkerDocumentsController();
  late final ReactionDisposer statusDisposer;

  final cpfEC = TextEditingController();
  final rgEC = TextEditingController();
  final orgaoEmissorEC = TextEditingController();
  final dataEmissaoEC = TextEditingController();
  final employeerEC = TextEditingController();

  @override
  void initState() {
    controller.getUserData(widget.worker);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case ProfileWorkerDocumentsStateStatus.initial:
            break;
          case ProfileWorkerDocumentsStateStatus.loading:
            showLoader();
            break;
          case ProfileWorkerDocumentsStateStatus.loaded:
            hideLoader();
            break;
          case ProfileWorkerDocumentsStateStatus.saved:
            hideLoader();
            Navigator.pop(context);
            break;
          case ProfileWorkerDocumentsStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
      dataEmissaoEC.text = controller.dataEmissao ?? '';
    });
    super.initState();
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

  Future<String?> showDateDialog(String? initialValue) async {
    final now = DateTime.now();
    final initialDate = initialValue != null && initialValue.isNotEmpty
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(
          'Meus Documentos',
          style:
              context.textStyles.textBold.copyWith(color: ColorsApp.i.ternary),
        ),
        iconTheme: IconThemeData(color: ColorsApp.i.ternary),
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
                  controller: orgaoEmissorEC,
                  label: 'Órgão emissor',
                  hintText: 'Digite o órgao do seu RG',
                  errorText: controller.orgaoEmissorError,
                  onChanged: controller.setOrgaoEmissor,
                  initialValue: controller.orgaoEmissor,
                ),
              ),
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
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsApp.i.ternary,
                      ),
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
