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
import 'bank_controller.dart';

class BankAccountPage extends StatefulWidget {
  const BankAccountPage({super.key});

  @override
  State<BankAccountPage> createState() => _BankAccountPageState();
}

class _BankAccountPageState extends State<BankAccountPage>
    with Loader, Messages {
  final BankController controller = BankController();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case BankStateStatus.initial:
            break;
          case BankStateStatus.loading:
            showLoader();
            break;
          case BankStateStatus.loaded:
            hideLoader();
            break;
          case BankStateStatus.saved:
            hideLoader();
            Navigator.pop(context);
            break;
          case BankStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
      controller.findBanks();
    });
    super.initState();
  }

  @override
  void dispose() {
    statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          'Conta Bancária',
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
                'Cadastre uma conta bancária ativa para recebimentos.',
                style:
                    context.textStyles.textRegular.copyWith(color: Colors.grey),
              ),
              const SizedBox(height: 32),
              Observer(
                builder: (_) => TextFieldWidget(
                  label: 'Nome do titular',
                  hintText: 'Digite o nome do titular',
                  errorText: controller.cardholderNameError,
                  onChanged: controller.setCardholderName,
                  initialValue: controller.cardholderName,
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  label: 'CPF do titular',
                  hintText: 'Digite o CPF do titular',
                  errorText: controller.holdersCPFError,
                  onChanged: controller.setHoldersCPF,
                  initialValue: controller.holdersCPF,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CpfInputFormatter(),
                  ],
                ),
              ),
              Observer(
                builder: (_) => DropdownWidget(
                  label: 'Banco',
                  selected: controller.bank,
                  onSave: controller.setBank,
                  errorText: controller.bankError,
                  listOptions: controller.bankList,
                ),
              ),
              Observer(
                builder: (_) => TextFieldWidget(
                  label: 'Agência',
                  hintText: 'Digite a agencia',
                  errorText: controller.agencyError,
                  onChanged: controller.setAgency,
                  initialValue: controller.agency,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                  ],
                ),
              ),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Conta',
                            style: context.textStyles.textBold,
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: 'Digite sua conta',
                              errorText: controller.accountError,
                            ),
                            onChanged: controller.setAccount,
                            keyboardType: TextInputType.number,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Dígito',
                            style: context.textStyles.textBold,
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            decoration: InputDecoration(
                              hintText: '0',
                              errorText: controller.verifyingDigitError,
                            ),
                            onChanged: controller.setVerifyingDigit,
                            keyboardType: TextInputType.number,
                            inputFormatters: [
                              LengthLimitingTextInputFormatter(1),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              DropdownWidget(
                label: 'Tipo de conta',
                statusSelected: controller.accountType,
                onSave: controller.setAccountType,
                errorText: controller.accountTypeError,
                listOptions: AccountType.values,
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
