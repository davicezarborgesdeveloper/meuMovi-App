import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../controllers/service_taker_edit_data_controller.dart';
import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../core/widgets/employeer_picker.dart';
import '../../../core/widgets/text_field_changed_widget.dart';
import '../../../core/widgets/text_field_widget.dart';
import '../../../models/worker_model.dart';

class EditServiceTakerEditDataPage extends StatefulWidget {
  const EditServiceTakerEditDataPage({super.key});

  @override
  State<EditServiceTakerEditDataPage> createState() =>
      _EditServiceTakerEditDataPageState();
}

class _EditServiceTakerEditDataPageState
    extends State<EditServiceTakerEditDataPage> with Loader, Messages {
  final ServiceTakerEditDataController controller =
      ServiceTakerEditDataController();

  late final ReactionDisposer statusDisposer;
  final companyNameEC = TextEditingController();
  final fantasyNameEC = TextEditingController();
  final employeerEC = TextEditingController();
  final cnpjEC = TextEditingController();
  final nameEC = TextEditingController();
  final phoneEC = TextEditingController();
  final emaiEC = TextEditingController();
  final zipEC = TextEditingController();
  final numberEC = TextEditingController();
  final cityEC = TextEditingController();
  final passEC = TextEditingController();
  final retypassEC = TextEditingController();
  final focusPassword = FocusNode();
  final focusRetypePass = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case ServiceTakerEditDataStateStatus.initial:
            break;
          case ServiceTakerEditDataStateStatus.loading:
            showLoader();
            break;
          case ServiceTakerEditDataStateStatus.loaded:
            hideLoader();
            break;
          case ServiceTakerEditDataStateStatus.saved:
            hideLoader();
            Navigator.pop(context);
            break;
          case ServiceTakerEditDataStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
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
    companyNameEC.dispose();
    fantasyNameEC.dispose();
    cnpjEC.dispose();
    nameEC.dispose();
    phoneEC.dispose();
    emaiEC.dispose();
    zipEC.dispose();
    numberEC.dispose();
    cityEC.dispose();
    passEC.dispose();
    retypassEC.dispose();
    employeerEC.dispose();
    focusPassword.dispose();
    focusRetypePass.dispose();
    statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[100],
        title: Text(
          'Tomadora de Serviços',
          style: context.textStyles.textBold
              .copyWith(fontSize: 18, color: ColorsApp.i.secondary),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorsApp.i.secondary),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: companyNameEC,
                  label: 'Nome Fantasia',
                  hintText: 'Digite o nome fantasia da empresa',
                  errorText: controller.fantasyNameError,
                  onChanged: controller.setFantasyName,
                  initialValue: controller.fantasyName,
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: fantasyNameEC,
                  label: 'Razão Social',
                  hintText: 'Digite a razão social empresa',
                  errorText: controller.companyNameError,
                  onChanged: controller.setCompanyName,
                  initialValue: controller.companyName,
                ),
              ),
              Observer(
                builder: (_) => TextFieldChangedWidget(
                  controller: employeerEC,
                  label: 'Empregadora',
                  hintText: '',
                  readOnly: true,
                  initialValue: controller.employeer?.name,
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
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: emaiEC,
                  label: 'E-mail',
                  hintText: 'Digite seu e-mail',
                  errorText: controller.emailError,
                  onChanged: controller.setEmail,
                  keyboardType: TextInputType.emailAddress,
                  initialValue: controller.email,
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: cnpjEC,
                  label: 'CNPJ',
                  hintText: 'Digite o CNPJ',
                  errorText: controller.cnpjError,
                  onChanged: controller.setCnpj,
                  initialValue: controller.cnpj,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CnpjInputFormatter(),
                  ],
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: nameEC,
                  label: 'Nome do Responsavel',
                  hintText: 'Digite o nome do resonsavel da empresa',
                  errorText: controller.nameError,
                  onChanged: controller.setName,
                  initialValue: controller.name,
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: phoneEC,
                  label: 'Telefone/Whatsapp',
                  hintText: 'Digite o telefone',
                  onChanged: controller.setPhone,
                  initialValue: controller.phone,
                  errorText: controller.phoneError,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter()
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 7,
                    child: Stack(
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Positioned(
                          right: 4,
                          top: 8,
                          child: Observer(
                            builder: (_) => Text(
                              controller.city ?? '',
                              style: context.textStyles.textRegular,
                            ),
                          ),
                        ),
                        Observer(
                          builder: (_) => TextFieldWidget(
                            controller: zipEC,
                            label: 'CEP',
                            hintText: 'Digite um CEP válido',
                            onChanged: (value) async {
                              controller.setZip(value);
                              if (value.length >= 10) {
                                await controller.searchZip(value);
                              }
                            },
                            initialValue: controller.zip,
                            errorText: controller.zipError,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CepInputFormatter(),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 8,
                  ),
                  Expanded(
                    flex: 2,
                    child: Observer(
                      builder: (_) => TextFieldWidget(
                        controller: numberEC,
                        label: 'Número',
                        hintText: 'Nº',
                        onChanged: controller.setNumber,
                        initialValue: controller.number,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          FilteringTextInputFormatter.digitsOnly,
                          TelefoneInputFormatter()
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: passEC,
                  label: 'Senha',
                  hintText: 'Crie uma senha',
                  errorText: controller.passwordError,
                  onChanged: controller.setPassword,
                  initialValue: controller.password,
                  obscure: true,
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: retypassEC,
                  label: 'Confirmar a senha',
                  hintText: 'Confirme sua senha',
                  errorText: controller.retypePassError,
                  onChanged: controller.setRetypePass,
                  initialValue: controller.retypePass,
                  obscure: true,
                ),
              ),
              Observer(
                builder: (_) => SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: GestureDetector(
                    onTap: controller.invalidSendPressed,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsApp.i.secondary,
                      ),
                      onPressed: controller.sendPressedSignup,
                      child: const Text('Alterar cadastro'),
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
