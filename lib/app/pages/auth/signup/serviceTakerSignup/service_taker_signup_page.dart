import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../controllers/service_taker_signup_controller.dart';
import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../../../core/ui/helpers/size_extensions.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../core/widgets/employeer_picker.dart';
import '../../../../core/widgets/text_field_changed_widget.dart';
import '../../../../core/widgets/text_field_widget.dart';
import '../../../../models/worker_model.dart';

class ServiceTakerSignupPage extends StatefulWidget {
  const ServiceTakerSignupPage({super.key});

  @override
  State<ServiceTakerSignupPage> createState() => _ServiceTakerSignupPageState();
}

class _ServiceTakerSignupPageState extends State<ServiceTakerSignupPage>
    with Loader, Messages {
  final ServiceTakerSignupController controller =
      ServiceTakerSignupController();
  late final ReactionDisposer statusDisposer;
  final employeerEC = TextEditingController();
  final focusPassword = FocusNode();
  final focusRetypePass = FocusNode();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case ServiceTakerSignupStateStatus.initial:
            break;
          case ServiceTakerSignupStateStatus.loading:
            showLoader();
            break;
          case ServiceTakerSignupStateStatus.loaded:
            hideLoader();
            break;
          case ServiceTakerSignupStateStatus.saved:
            hideLoader();
            Navigator.of(context).pushNamedAndRemoveUntil(
              '/home/serviceTaker',
              (route) => false,
            );
            break;
          case ServiceTakerSignupStateStatus.error:
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
        automaticallyImplyLeading: false,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.close,
              color: Colors.red,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Observer(
                builder: (_) => TextFieldWidget(
                  label: 'Nome Fantasia',
                  hintText: 'Digite o nome fantasia da empresa',
                  errorText: controller.fantasyNameError,
                  onChanged: controller.setFantasyName,
                  initialValue: controller.fantasyName,
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
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
                  label: 'Nome do Responsavel',
                  hintText: 'Digite o nome do resonsavel da empresa',
                  errorText: controller.nameError,
                  onChanged: controller.setName,
                  initialValue: controller.name,
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
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
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'CEP',
                                style: context.textStyles.textBold,
                              ),
                              Observer(
                                builder: (_) => Text(
                                  controller.city ?? '',
                                  style: context.textStyles.textRegular,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            onChanged: (value) async {
                              controller.setZip(value);
                              if (value.length >= 10) {
                                await controller.searchZip(value);
                              }
                            },
                            decoration: InputDecoration(
                              hintText: 'Digite um CEP válido',
                              errorText: controller.zipError,
                            ),
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly,
                              CepInputFormatter(),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Número',
                            style: context.textStyles.textBold,
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            onChanged: controller.setNumber,
                            decoration: const InputDecoration(hintText: 'Nº'),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  focusNode: focusPassword,
                  label: 'Senha',
                  hintText: 'Crie uma senha',
                  errorText: controller.passwordError,
                  onChanged: controller.setPassword,
                  initialValue: controller.password,
                  obscure: true,
                  themeColor: ColorsApp.i.secondary,
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  focusNode: focusRetypePass,
                  label: 'Confirmar a senha',
                  hintText: 'Confirme sua senha',
                  errorText: controller.retypePassError,
                  onChanged: controller.setRetypePass,
                  initialValue: controller.retypePass,
                  obscure: true,
                  themeColor: ColorsApp.i.secondary,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 16, bottom: 32),
                child: Row(
                  children: [
                    Observer(
                      builder: (_) => Checkbox(
                        value: controller.termsAccepted,
                        onChanged: (value) =>
                            controller.setTermsAccepted(value!),
                      ),
                    ),
                    SizedBox(
                      width: context.percentWidth(.78),
                      child: RichText(
                        softWrap: true,
                        text: TextSpan(
                          text: '',
                          style: context.textStyles.textRegular
                              .copyWith(color: Colors.grey[900]),
                          children: [
                            TextSpan(
                              text: 'Termo de uso ',
                              style: context.textStyles.textRegular
                                  .copyWith(color: ColorsApp.i.secondary),
                              recognizer: TapGestureRecognizer()
                                ..onTap = () => Navigator.of(context)
                                    .pushNamed('/auth/signup/termsUse'),
                            ),
                            const TextSpan(
                              text:
                                  'Eu li e aceito as condições de uso, as políticas de privacidade, políticas de cookies e sou maior de 18 anos.',
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
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
