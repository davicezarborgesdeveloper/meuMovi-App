import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../core/widget/text_field_changed_widget.dart';
import '../../../../../core/widget/text_field_widget.dart';
import '../../../../../models/worker_model.dart';
import '../../../../base/worker/profile/documents/widgets/employeer_picker.dart';
import '../register/worker_syndicate_register_controller.dart';

class WorkerRegisterDocumentsData extends StatefulWidget {
  final WorkerSyndicateRegisterController controller;
  final List<TextEditingController> textControllers;
  const WorkerRegisterDocumentsData(
    this.controller,
    this.textControllers, {
    Key? key,
  }) : super(key: key);

  @override
  State<WorkerRegisterDocumentsData> createState() =>
      _WorkerRegisterDocumentsDataState();
}

class _WorkerRegisterDocumentsDataState
    extends State<WorkerRegisterDocumentsData> {
  final employeerEC = TextEditingController();
  @override
  void dispose() {
    employeerEC.dispose();
    super.dispose();
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
            controller: widget.textControllers[0],
            label: 'CPF',
            hintText: 'Digite seu CPF',
            errorText: widget.controller.cpfError,
            onChanged: widget.controller.setCPF,
            initialValue: widget.controller.cpf,
            keyboardType: TextInputType.number,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              CpfInputFormatter(),
            ],
          ),
        ),
        Observer(
          builder: (_) => TextFieldWidget(
            controller: widget.textControllers[1],
            label: 'RG',
            hintText: 'Digite seu RG',
            errorText: widget.controller.rgError,
            onChanged: widget.controller.setRG,
            initialValue: widget.controller.rg,
            keyboardType: TextInputType.number,
          ),
        ),
        Observer(
          builder: (_) => TextFieldChangedWidget(
            controller: widget.textControllers[2],
            label: 'Empregadora',
            hintText: '',
            readOnly: true,
            onTap: () async {
              final result = await showDialogEmployeer();
              if (result != null) {
                widget.textControllers[2].text = result.name;
                widget.controller.setEmployeer(result);
              }
            },
          ),
        )
      ],
    );
  }
}
