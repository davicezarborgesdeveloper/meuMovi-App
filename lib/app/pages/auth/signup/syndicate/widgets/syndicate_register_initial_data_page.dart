import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../core/widget/text_field_widget.dart';
import '../syndicate_register_controller.dart';

class SyndicateRegisterInitialDataPage extends StatefulWidget {
  final SyndicateRegisterController controller;
  final List<TextEditingController> editController;
  const SyndicateRegisterInitialDataPage(
    this.controller,
    this.editController, {
    super.key,
  });

  @override
  State<SyndicateRegisterInitialDataPage> createState() =>
      _SyndicateRegisterInitialDataPageState();
}

class _SyndicateRegisterInitialDataPageState
    extends State<SyndicateRegisterInitialDataPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Olá! Bem-vindo à MeuMovi!',
                style: context.textStyles.textBold,
              ),
              const SizedBox(height: 12),
              Text(
                'Para iniciar seu cadastro, informe abaixo os dados iniciais da empresa',
                style: context.textStyles.textRegular
                    .copyWith(color: Colors.grey.shade700),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Observer(
          builder: (_) => TextFieldWidget(
            controller: widget.editController[0],
            label: 'Razão Social',
            hintText: 'Digite a razão social',
            errorText: widget.controller.corporateNameError,
            onChanged: widget.controller.setCorporateName,
            initialValue: widget.controller.corporateName,
          ),
        ),
        Observer(
          builder: (_) => TextFieldWidget(
            controller: widget.editController[1],
            label: 'Nome Fantasia',
            hintText: 'Digite o nome fantasia',
            errorText: widget.controller.fantasyNameError,
            onChanged: widget.controller.setFantasyName,
            initialValue: widget.controller.fantasyName,
          ),
        ),
        Observer(
          builder: (_) => TextFieldWidget(
            controller: widget.editController[2],
            label: 'CNPJ',
            hintText: 'Digite o CNPJ',
            errorText: widget.controller.cnpjError,
            onChanged: widget.controller.setCNPJ,
            initialValue: widget.controller.cnpj,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CnpjInputFormatter(),
            ],
          ),
        ),
        Observer(
          builder: (_) => TextFieldWidget(
            controller: widget.editController[3],
            label: 'Senha',
            hintText: 'Crie uma senha',
            errorText: widget.controller.passwordError,
            onChanged: widget.controller.setPassword,
            initialValue: widget.controller.password,
            obscure: true,
          ),
        ),
        Observer(
          builder: (_) => TextFieldWidget(
            controller: widget.editController[4],
            label: 'Confirmar a senha',
            hintText: 'Confirme sua senha',
            errorText: widget.controller.retypePassError,
            onChanged: widget.controller.setRetypePass,
            initialValue: widget.controller.retypePass,
            obscure: true,
          ),
        ),
      ],
    );
  }
}
