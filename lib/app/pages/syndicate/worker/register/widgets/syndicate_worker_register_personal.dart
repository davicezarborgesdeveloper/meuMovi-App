import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';

import '../../../../../controllers/syndicate_worker_register_controller.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../core/widgets/text_field_widget.dart';

class SyndicateWorkerRegisterPersonal extends StatefulWidget {
  final SyndicateWorkerRegisterController controller;
  final List<TextEditingController> textControllers;
  const SyndicateWorkerRegisterPersonal(
    this.controller,
    this.textControllers, {
    super.key,
  });

  @override
  State<SyndicateWorkerRegisterPersonal> createState() =>
      _SyndicateWorkerRegisterPersonalState();
}

class _SyndicateWorkerRegisterPersonalState
    extends State<SyndicateWorkerRegisterPersonal> {
  final birthDateEC = TextEditingController();

  @override
  void dispose() {
    birthDateEC.dispose();
    super.dispose();
  }

  Future<String?> showDateDialog(String? initialValue) async {
    final now = DateTime.now();
    final initialDate = initialValue != null && initialValue.isNotEmpty
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
