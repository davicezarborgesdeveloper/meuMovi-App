import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/ui/helpers/loader.dart';
import '../../../../../core/ui/helpers/messages.dart';
import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../core/widget/register_success.dart';
import '../../../../../core/widget/text_field_changed_widget.dart';
import '../../../../../core/widget/text_field_widget.dart';
import '../../../../../models/service_taker_model.dart';
import '../../../../../models/worker_model.dart';
import '../../../worker/profile/documents/widgets/employeer_picker.dart';
import 'service_taker_syndicate_register_controller.dart';

class ServiceTakerSyndicateRegisterPage extends StatefulWidget {
  final ServiceTakerModel? serviceTaker;
  const ServiceTakerSyndicateRegisterPage({this.serviceTaker, super.key});

  @override
  State<ServiceTakerSyndicateRegisterPage> createState() =>
      _ServiceTakerSyndicateRegisterPageState();
}

class _ServiceTakerSyndicateRegisterPageState
    extends State<ServiceTakerSyndicateRegisterPage> with Loader, Messages {
  final ServiceTakerSyndicateRegisterController controller =
      ServiceTakerSyndicateRegisterController();
  late final ReactionDisposer statusDisposer;
  final companyNameEC = TextEditingController();
  final fantasyNameEC = TextEditingController();
  final cnpjEC = TextEditingController();
  final nameEC = TextEditingController();
  final phoneEC = TextEditingController();
  final emaiEC = TextEditingController();
  final zipEC = TextEditingController();
  final numberEC = TextEditingController();
  final cityEC = TextEditingController();
  final employeerEC = TextEditingController();

  @override
  void initState() {
    if (widget.serviceTaker != null) {
      controller.loadData(widget.serviceTaker);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case ServiceTakerRegisterStateStatus.initial:
            break;
          case ServiceTakerRegisterStateStatus.loading:
            showLoader();
            break;
          case ServiceTakerRegisterStateStatus.loaded:
            hideLoader();
            break;
          case ServiceTakerRegisterStateStatus.saved:
            hideLoader();
            final navigator = Navigator.of(context);
            await showDialog(
              context: context,
              builder: (_) => const RegisterSuccess(),
            );
            navigator.pop();
            // navigator.pop();
            break;
          case ServiceTakerRegisterStateStatus.error:
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
    employeerEC.dispose();
    statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.i.bg,
        title: Text(
          'Tomadora de Serviços',
          style:
              context.textStyles.textBold.copyWith(color: ColorsApp.i.primary),
        ),
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
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
                        ],
                      ),
                    ),
                  ),
                ],
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
                      onPressed: controller.sendPressedRegister,
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
