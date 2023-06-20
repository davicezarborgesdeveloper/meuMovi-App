import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/ui/helpers/loader.dart';
import '../../../../../core/ui/helpers/messages.dart';
import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../core/widget/text_field_widget.dart';
import 'legal_data_controller.dart';

class LegalDataPage extends StatefulWidget {
  const LegalDataPage({super.key});

  @override
  State<LegalDataPage> createState() => _LegalDataPageState();
}

class _LegalDataPageState extends State<LegalDataPage> with Loader, Messages {
  final LegalDataController controller = LegalDataController();
  late final ReactionDisposer statusDisposer;
  final corporateNameEC = TextEditingController();
  final fantasyNameEC = TextEditingController();
  final cnpjEC = TextEditingController();
  final passwordEC = TextEditingController();
  final retypePassEC = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case LegalDataStateStatus.initial:
            break;
          case LegalDataStateStatus.loading:
            showLoader();
            break;
          case LegalDataStateStatus.loaded:
            hideLoader();
            break;
          case LegalDataStateStatus.saved:
            hideLoader();
            Navigator.pop(context);
            break;
          case LegalDataStateStatus.error:
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
    corporateNameEC.dispose();
    fantasyNameEC.dispose();
    cnpjEC.dispose();
    passwordEC.dispose();
    retypePassEC.dispose();
    statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.i.bg,
        title: Text(
          'Dados Juridicos',
          style:
              context.textStyles.textBold.copyWith(color: ColorsApp.i.primary),
        ),
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: corporateNameEC,
                  label: 'Razão Social',
                  hintText: 'Digite a razão social',
                  errorText: controller.corporateNameError,
                  onChanged: controller.setCorporateName,
                  initialValue: controller.corporateName,
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: fantasyNameEC,
                  label: 'Nome Fantasia',
                  hintText: 'Digite o nome fantasia',
                  errorText: controller.fantasyNameError,
                  onChanged: controller.setFantasyName,
                  initialValue: controller.fantasyName,
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: cnpjEC,
                  label: 'CNPJ',
                  hintText: 'Digite o CNPJ',
                  errorText: controller.cnpjError,
                  onChanged: controller.setCNPJ,
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
                  controller: passwordEC,
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
                  controller: retypePassEC,
                  label: 'Confirmar a senha',
                  hintText: 'Confirme sua senha',
                  errorText: controller.retypePassError,
                  onChanged: controller.setRetypePass,
                  initialValue: controller.retypePass,
                  obscure: true,
                ),
              ),
              const SizedBox(height: 16.0),
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
