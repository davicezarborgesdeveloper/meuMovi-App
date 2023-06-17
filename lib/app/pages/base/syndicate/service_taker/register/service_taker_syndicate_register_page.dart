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
import '../../../../../core/widget/text_field_widget.dart';
import '../../../../auth/signup/service_taker/service_taker_register_controller.dart';
import '../../../../menu/menu_drawer.dart';

class ServiceTakerSyndicateRegisterPage extends StatefulWidget {
  const ServiceTakerSyndicateRegisterPage({super.key});

  @override
  State<ServiceTakerSyndicateRegisterPage> createState() =>
      _ServiceTakerSyndicateRegisterPageState();
}

class _ServiceTakerSyndicateRegisterPageState
    extends State<ServiceTakerSyndicateRegisterPage> with Loader, Messages {
  final ServiceTakerRegisterController controller =
      ServiceTakerRegisterController();
  late final ReactionDisposer statusDisposer;
  final cityEC = TextEditingController();

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
            showDialog(
              context: context,
              builder: (_) => const RegisterSuccess(),
            );
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
    cityEC.dispose();
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
      drawer: const MenuDrawer(),
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
