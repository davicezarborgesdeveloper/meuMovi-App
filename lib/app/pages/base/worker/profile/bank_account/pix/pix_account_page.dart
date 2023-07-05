import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../core/ui/helpers/enums.dart';
import '../../../../../../core/ui/helpers/loader.dart';
import '../../../../../../core/ui/helpers/messages.dart';
import '../../../../../../core/ui/styles/colors_app.dart';
import '../../../../../../core/ui/styles/text_styles.dart';
import '../../../../../../core/widget/dropdown_widget.dart';
import '../../../../../../core/widget/text_field_widget.dart';
import 'pix_controller.dart';

class PixAccountPage extends StatefulWidget {
  const PixAccountPage({super.key});

  @override
  State<PixAccountPage> createState() => _PixAccountPageState();
}

class _PixAccountPageState extends State<PixAccountPage> with Loader, Messages {
  final PixController controller = PixController();
  late final ReactionDisposer statusDisposer;
  final keyPixEC = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case PixStateStatus.initial:
            break;
          case PixStateStatus.loading:
            showLoader();
            break;
          case PixStateStatus.loaded:
            hideLoader();
            break;
          case PixStateStatus.saved:
            hideLoader();
            Navigator.pop(context);
            break;
          case PixStateStatus.error:
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
    keyPixEC.dispose();
    statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          'Chave Pix',
          style: context.textStyles.textBold.copyWith(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(32, 32, 32, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Cadastre uma chave Pix ativa para recebimentos.',
                style:
                    context.textStyles.textRegular.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 32),
              Observer(
                builder: (_) => DropdownWidget(
                  label: 'Escolha o tipo de chave',
                  statusSelected: controller.pixKeyType,
                  onSave: (value) {
                    keyPixEC.text = '';
                    controller.setPixKeyType(value);
                  },
                  errorText: controller.pixKeyTypeError,
                  listOptions: PixKeyType.values,
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: keyPixEC,
                  hintText: 'Digite sua chave pix',
                  errorText: controller.pixKeyError,
                  onChanged: controller.setPixKey,
                  initialValue: controller.pixKey,
                  keyboardType: controller.pixKeyType != null
                      ? controller.pixKeyType!.acronym == 'EMl'
                          ? TextInputType.emailAddress
                          : TextInputType.number
                      : TextInputType.text,
                  inputFormatters: (controller.pixKeyType == null ||
                          controller.pixKeyType!.acronym == 'EMl')
                      ? null
                      : [
                          FilteringTextInputFormatter.digitsOnly,
                          if (controller.pixKeyType!.acronym == 'CPF')
                            CpfInputFormatter()
                          else if (controller.pixKeyType!.acronym == 'CNPJ')
                            CnpjInputFormatter()
                          else
                            TelefoneInputFormatter()
                        ],
                ),
              ),
              const SizedBox(
                height: 16,
              ),
              Observer(
                builder: (_) => SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: GestureDetector(
                    onTap: controller.invalidSendPressed,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsApp.i.ternary,
                      ),
                      onPressed: controller.sendPressed,
                      child: const Text(
                        'Salvar Informações',
                      ),
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
