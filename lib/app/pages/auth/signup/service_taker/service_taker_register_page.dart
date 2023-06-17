import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../../../core/ui/helpers/size_extensions.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../core/widget/text_field_widget.dart';
import 'service_taker_register_controller.dart';

class ServiceTakerRegisterPage extends StatefulWidget {
  const ServiceTakerRegisterPage({super.key});

  @override
  State<ServiceTakerRegisterPage> createState() =>
      _ServiceTakerRegisterPageState();
}

class _ServiceTakerRegisterPageState extends State<ServiceTakerRegisterPage>
    with Loader, Messages {
  final ServiceTakerRegisterController controller =
      ServiceTakerRegisterController();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
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
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/home', (route) => false);
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

  @override
  void dispose() {
    statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          'Tomadora de Serviços',
          style: context.textStyles.textBold
              .copyWith(fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
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
                  label: 'Nome',
                  hintText: 'Digite o nome da empresa',
                  errorText: controller.nameError,
                  onChanged: controller.setName,
                  initialValue: controller.name,
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  label: 'Telefone',
                  hintText: 'Digite o telefone',
                  onChanged: controller.setPhone,
                  initialValue: controller.phone,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter()
                  ],
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
                  label: 'Confirmar a senha',
                  hintText: 'Confirme sua senha',
                  errorText: controller.retypePassError,
                  onChanged: controller.setRetypePass,
                  initialValue: controller.retypePass,
                  obscure: true,
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
                    // Text(
                    //     'Termo de uso Eu li e aceito as condições de uso, as políticas de privacidade, políticas de cookies e sou maior de 18 anos.')
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
