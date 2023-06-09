import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/ui/styles/text_styles.dart';
import '../../../../core/widget/text_field_widget.dart';
import '../register_controller.dart';

class RegisterDocumentsData extends StatelessWidget {
  final RegisterController controller;
  const RegisterDocumentsData(this.controller, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Informe seu documento',
                style: context.textStyles.textBold,
              ),
              const SizedBox(height: 12),
              Text(
                'Agora, digite o número do seu CPF e RG',
                style: context.textStyles.textRegular
                    .copyWith(color: Colors.grey.shade700),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Observer(
          builder: (_) => TextFieldWidget(
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
            label: 'RG',
            hintText: 'Digite seu RG',
            errorText: controller.rgError,
            onChanged: controller.setRG,
            initialValue: controller.rg,
            keyboardType: TextInputType.number,
          ),
        ),
      ],
    );
  }
}
