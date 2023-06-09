import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../core/widget/text_field_changed_widget.dart';
import '../../../../../core/widget/text_field_widget.dart';
import '../worker_register_controller.dart';

class WorkerRegisterPersonalData extends StatefulWidget {
  final WorkerRegisterController controller;
  const WorkerRegisterPersonalData(this.controller, {Key? key})
      : super(key: key);

  @override
  State<WorkerRegisterPersonalData> createState() =>
      _WorkerRegisterPersonalDataState();
}

class _WorkerRegisterPersonalDataState
    extends State<WorkerRegisterPersonalData> {
  final birthDateEC = TextEditingController();

  @override
  void dispose() {
    birthDateEC.dispose();
    super.dispose();
  }

  Future<String?> showDateDialog(String? initialValue) async {
    final now = DateTime.now();
    final initialDate = initialValue != null
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
                'Para iniciar seu cadastro, informe abaixo os seus dados pessoais',
                style: context.textStyles.textRegular
                    .copyWith(color: Colors.grey.shade700),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Observer(
          builder: (_) => TextFieldWidget(
            label: 'Nome',
            hintText: 'Digite seu primeiro nome',
            errorText: widget.controller.nameError,
            onChanged: widget.controller.setName,
            initialValue: widget.controller.name,
          ),
        ),
        Observer(
          builder: (_) => TextFieldWidget(
            label: 'Sobrenome',
            hintText: 'Digite seu sobrenome',
            errorText: widget.controller.lastnameError,
            onChanged: widget.controller.setLastname,
            initialValue: widget.controller.lastname,
          ),
        ),
        Observer(
          builder: (_) => TextFieldChangedWidget(
            controller: birthDateEC,
            label: 'Data de Nascimento',
            hintText: 'Data de Nascimento',
            readOnly: true,
            initialValue: widget.controller.birthdate,
            errorText: widget.controller.birthdateError,
            onTap: () async {
              final result = await showDateDialog(widget.controller.birthdate);
              if (result != null) {
                birthDateEC.text = result;
                widget.controller.setBirthdate(result);
              }
            },
          ),
        ),
        Observer(
          builder: (_) => TextFieldWidget(
            label: 'E-mail',
            hintText: 'Digite seu e-mail',
            errorText: widget.controller.emailError,
            onChanged: widget.controller.setEmail,
            keyboardType: TextInputType.emailAddress,
            initialValue: widget.controller.email,
          ),
        ),
        Observer(
          builder: (_) => TextFieldWidget(
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
