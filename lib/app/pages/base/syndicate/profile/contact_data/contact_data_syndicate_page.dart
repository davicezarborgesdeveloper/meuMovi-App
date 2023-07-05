import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/ui/helpers/enums.dart';
import '../../../../../core/ui/helpers/loader.dart';
import '../../../../../core/ui/helpers/messages.dart';
import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../core/widget/dropdown_widget.dart';
import '../../../../../core/widget/text_field_widget.dart';
import 'contact_data_syndicate_controller.dart';

class ContactDataSyndicatePage extends StatefulWidget {
  const ContactDataSyndicatePage({super.key});

  @override
  State<ContactDataSyndicatePage> createState() =>
      _ContactDataSyndicatePageState();
}

class _ContactDataSyndicatePageState extends State<ContactDataSyndicatePage>
    with Loader, Messages {
  final ContactDataSyndicateController controller =
      ContactDataSyndicateController();
  late final ReactionDisposer statusDisposer;
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final phoneEC = TextEditingController();
  final mobileEC = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case ContactDataSyndicateStateStatus.initial:
            break;
          case ContactDataSyndicateStateStatus.loading:
            showLoader();
            break;
          case ContactDataSyndicateStateStatus.loaded:
            hideLoader();
            break;
          case ContactDataSyndicateStateStatus.saved:
            hideLoader();
            Navigator.pop(context);
            break;
          case ContactDataSyndicateStateStatus.error:
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
    nameEC.dispose();
    emailEC.dispose();
    phoneEC.dispose();
    mobileEC.dispose();
    statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.i.bg,
        title: Text(
          'Contato do Responsável',
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
                  controller: nameEC,
                  label: 'Nome',
                  hintText: 'Digite o nome',
                  errorText: controller.nameError,
                  onChanged: controller.setName,
                  initialValue: controller.name,
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: emailEC,
                  label: 'E-mail',
                  hintText: 'Digite seu e-mail',
                  onChanged: controller.setEmail,
                  keyboardType: TextInputType.emailAddress,
                  initialValue: controller.email,
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: phoneEC,
                  label: 'Telefone',
                  hintText: 'Digite o telefone',
                  errorText: controller.phoneError,
                  onChanged: controller.setPhone,
                  initialValue: controller.phone,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
                  ],
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: mobileEC,
                  label: 'Celular',
                  hintText: 'Digite o celular',
                  errorText: controller.mobilePhoneError,
                  onChanged: controller.setMobilePhone,
                  initialValue: controller.mobilePhone,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    TelefoneInputFormatter(),
                  ],
                ),
              ),
              DropdownWidget(
                label: 'Setor',
                statusSelected: controller.companySector,
                onSave: controller.setCompanySector,
                listOptions: CompanySector.values,
              ),
              const SizedBox(height: 16.0),
              Observer(
                builder: (_) => SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: GestureDetector(
                    onTap: controller.invalidSendPressed,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsApp.i.primary,
                      ),
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
