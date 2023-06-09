import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:intl/intl.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/ui/helpers/enums.dart';
import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../core/widget/dropdown_widget.dart';
import '../../../../core/widget/text_field_changed_widget.dart';
import '../../../../core/widget/text_field_widget.dart';
import 'profile_personal_data_controller.dart';

class ProfilePersonalDataPage extends StatefulWidget {
  const ProfilePersonalDataPage({Key? key}) : super(key: key);

  @override
  State<ProfilePersonalDataPage> createState() =>
      _ProfilePersonalDataPageState();
}

class _ProfilePersonalDataPageState extends State<ProfilePersonalDataPage>
    with Loader, Messages {
  final ProfilePersonalDataController controller =
      ProfilePersonalDataController();
  late final ReactionDisposer statusDisposer;

  final nameEC = TextEditingController();
  final lastnameEC = TextEditingController();
  final surnameEC = TextEditingController();
  final birthdateEC = TextEditingController();
  final motherNameEC = TextEditingController();
  final phoneEC = TextEditingController();
  final emailEC = TextEditingController();

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case ProfilePersonalStateStatus.initial:
            break;
          case ProfilePersonalStateStatus.loading:
            showLoader();
            break;
          case ProfilePersonalStateStatus.loaded:
            hideLoader();
            break;
          case ProfilePersonalStateStatus.saved:
            hideLoader();
            Navigator.pop(context);
            break;
          case ProfilePersonalStateStatus.error:
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
    lastnameEC.dispose();
    surnameEC.dispose();
    birthdateEC.dispose();
    motherNameEC.dispose();
    phoneEC.dispose();
    emailEC.dispose();
    statusDisposer();
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
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          'Dados Pessoais',
          style: context.textStyles.textBold.copyWith(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: nameEC,
                  label: 'Nome',
                  hintText: 'Digite seu primeiro nome',
                  errorText: controller.nameError,
                  onChanged: controller.setName,
                  initialValue: controller.name,
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: lastnameEC,
                  label: 'Sobrenome',
                  hintText: 'Digite seu sobrenome',
                  errorText: controller.lastnameError,
                  onChanged: controller.setLastname,
                  initialValue: controller.lastname,
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: surnameEC,
                  label: 'Apelido',
                  hintText: 'Digite um apelido',
                  errorText: controller.surnameError,
                  onChanged: controller.setSurname,
                  initialValue: controller.surname,
                ),
              ),
              Observer(
                builder: (_) => TextFieldChangedWidget(
                  controller: birthdateEC,
                  label: 'Data de Nascimento',
                  hintText: 'Data de Nascimento',
                  readOnly: true,
                  initialValue: controller.birthdate,
                  errorText: controller.birthdateError,
                  onTap: () async {
                    final result = await showDateDialog(controller.birthdate);
                    if (result != null) {
                      birthdateEC.text = result;
                      controller.setBirthdate(result);
                    }
                  },
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: motherNameEC,
                  label: 'Nome da Mãe',
                  hintText: 'Digite o nome da sua mãe',
                  errorText: controller.motheNameError,
                  onChanged: controller.setMotherName,
                  initialValue: controller.motherName,
                ),
              ),
              DropdownWidget(
                label: 'Estado Civil',
                statusSelected: controller.maritalStatus,
                onSave: controller.setMaritalStatus,
                errorText: controller.maritalStatusError,
                listOptions: MaritalStatus.values,
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  controller: phoneEC,
                  label: 'Telefone',
                  hintText: 'Digite seu telefone',
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
                  controller: emailEC,
                  label: 'E-mail',
                  hintText: 'Digite seu e-mail',
                  errorText: controller.emailError,
                  onChanged: controller.setEmail,
                  keyboardType: TextInputType.emailAddress,
                  initialValue: controller.email,
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
