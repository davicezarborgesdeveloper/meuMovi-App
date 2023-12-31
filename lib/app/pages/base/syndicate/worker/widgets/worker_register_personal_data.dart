import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../core/widget/text_field_widget.dart';
import '../register/worker_syndicate_register_controller.dart';

class WorkerRegisterPersonalData extends StatefulWidget {
  final WorkerSyndicateRegisterController controller;
  final List<TextEditingController> textControllers;
  const WorkerRegisterPersonalData(
    this.controller,
    this.textControllers, {
    Key? key,
  }) : super(key: key);

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
            controller: widget.textControllers[0],
            label: 'Nome',
            hintText: 'Digite seu primeiro nome',
            errorText: widget.controller.nameError,
            onChanged: widget.controller.setName,
            initialValue: widget.controller.name,
          ),
        ),
        Observer(
          builder: (_) => TextFieldWidget(
            controller: widget.textControllers[1],
            label: 'Sobrenome',
            hintText: 'Digite seu sobrenome',
            errorText: widget.controller.lastnameError,
            onChanged: widget.controller.setLastname,
            initialValue: widget.controller.lastname,
          ),
        ),
        // Observer(
        //   builder: (_) => TextFieldChangedWidget(
        //     controller: widget.textControllers[2],
        //     label: 'Data de Nascimento',
        //     hintText: 'Data de Nascimento',
        //     readOnly: true,
        //     initialValue: widget.controller.birthdate,
        //     errorText: widget.controller.birthdateError,
        //     onTap: () async {
        //       final result = await showDateDialog(widget.controller.birthdate);
        //       if (result != null) {
        //         widget.textControllers[2].text = result;
        //         widget.controller.setBirthdate(result);
        //       }
        //     },
        //   ),
        // ),
        Observer(
          builder: (_) => Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Data de Nascimento',
                  style: context.textStyles.textBold,
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: widget.textControllers[2],
                  // initialValue: widget.controller.birthdate,
                  onChanged: widget.controller.setBirthdate,
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    errorText: widget.controller.birthdateError,
                    hintText: 'Data de Nascimento',
                    suffixIcon: IconButton(
                      icon: const Icon(Icons.date_range),
                      onPressed: () async {
                        final result =
                            await showDateDialog(widget.controller.birthdate);
                        if (result != null) {
                          widget.textControllers[2].text = result;
                          widget.controller.setBirthdate(result);
                        }
                      },
                    ),
                  ),
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    DataInputFormatter(),
                  ],

                  // onTap: () {},
                )
              ],
            ),
          ),
        ),
        Observer(
          builder: (_) => TextFieldWidget(
            controller: widget.textControllers[3],
            label: 'Telefone',
            hintText: 'Digite seu telefone',
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
            controller: widget.textControllers[4],
            label: 'E-mail',
            hintText: 'Digite seu e-mail',
            errorText: widget.controller.emailError,
            onChanged: widget.controller.setEmail,
            keyboardType: TextInputType.emailAddress,
            initialValue: widget.controller.email,
          ),
        ),
      ],
    );
  }
}
