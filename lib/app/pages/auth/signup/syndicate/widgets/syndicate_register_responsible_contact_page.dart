import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/ui/helpers/enums.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../core/widget/dropdown_widget.dart';
import '../../../../../core/widget/text_field_widget.dart';
import '../syndicate_register_controller.dart';

class SyndicateRegisterResponsibleContactPage extends StatefulWidget {
  final SyndicateRegisterController controller;
  final List<TextEditingController> editController;
  const SyndicateRegisterResponsibleContactPage(
    this.controller,
    this.editController, {
    super.key,
  });

  @override
  State<SyndicateRegisterResponsibleContactPage> createState() =>
      _SyndicateRegisterResponsibleContactPageState();
}

class _SyndicateRegisterResponsibleContactPageState
    extends State<SyndicateRegisterResponsibleContactPage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Dados de contato',
                style: context.textStyles.textBold,
              ),
              const SizedBox(height: 12),
              Text(
                'Informe os dados conforme necessário',
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
            label: 'Nome',
            hintText: 'Digite o nome',
            errorText: widget.controller.nameError,
            onChanged: widget.controller.setName,
            initialValue: widget.controller.name,
          ),
        ),
        Observer(
          builder: (_) => TextFieldWidget(
            controller: widget.editController[1],
            label: 'E-mail',
            hintText: 'Digite seu e-mail',
            onChanged: widget.controller.setEmail,
            keyboardType: TextInputType.emailAddress,
            initialValue: widget.controller.email,
          ),
        ),
        Observer(
          builder: (_) => TextFieldWidget(
            controller: widget.editController[2],
            label: 'Telefone',
            hintText: 'Digite o telefone',
            errorText: widget.controller.phoneError,
            onChanged: widget.controller.setPhone,
            initialValue: widget.controller.phone,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              TelefoneInputFormatter(),
            ],
          ),
        ),
        Observer(
          builder: (_) => TextFieldWidget(
            controller: widget.editController[3],
            label: 'Celular',
            hintText: 'Digite o celular',
            errorText: widget.controller.mobilePhoneError,
            onChanged: widget.controller.setMobilePhone,
            initialValue: widget.controller.mobilePhone,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              TelefoneInputFormatter(),
            ],
          ),
        ),
        DropdownWidget(
          label: 'Setor',
          statusSelected: widget.controller.companySector,
          onSave: widget.controller.setCompanySector,
          listOptions: CompanySector.values,
        ),
      ],
    );
  }
}
