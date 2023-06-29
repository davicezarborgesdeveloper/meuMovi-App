import 'package:flutter/material.dart';

import '../../../../../../core/ui/helpers/enums.dart';
import '../../../../../../core/ui/styles/colors_app.dart';
import '../../../../../../core/ui/styles/text_styles.dart';
import '../profile_worker_bank_account_controller.dart';

class CardBank extends StatelessWidget {
  final ProfileWorkerBankAccountController controller;
  const CardBank(this.controller, {super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: [
            Container(
              width: double.infinity,
              height: 50,
              decoration: BoxDecoration(
                color: ColorsApp.i.primary,
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(12),
                  topRight: Radius.circular(12),
                ),
              ),
              child: Center(
                child: Text(
                  controller.bankData!.bankReceiptType == BankReceiptType.bank
                      ? 'Conta bancária'
                      : 'Chave Pix',
                  style: context.textStyles.textBold.copyWith(
                    color: Colors.white,
                    fontSize: 14,
                  ),
                ),
              ),
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.only(
                left: 24,
                right: 8,
                top: 16,
              ),
              decoration: BoxDecoration(
                color: Colors.grey.shade300,
                borderRadius: const BorderRadius.only(
                  bottomLeft: Radius.circular(12),
                  bottomRight: Radius.circular(12),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    controller.bankData!.bankReceiptType == BankReceiptType.bank
                        ? controller.bankData!.cardholderName!
                        : controller.bankData!.pixKeyType!.name,
                    style: context.textStyles.textBold.copyWith(fontSize: 16),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    controller.bankData!.bankReceiptType == BankReceiptType.bank
                        ? controller.bankData!.bankName!
                        : controller.bankData!.pixKey!,
                    style:
                        context.textStyles.textRegular.copyWith(fontSize: 12),
                  ),
                  if (controller.bankData!.bankReceiptType ==
                      BankReceiptType.bank)
                    const SizedBox(height: 4),
                  if (controller.bankData!.bankReceiptType ==
                      BankReceiptType.bank)
                    Text(
                      'Ag. ${controller.bankData!.agency!}',
                      style:
                          context.textStyles.textRegular.copyWith(fontSize: 12),
                    ),
                  if (controller.bankData!.bankReceiptType ==
                      BankReceiptType.bank)
                    const SizedBox(height: 4),
                  if (controller.bankData!.bankReceiptType ==
                      BankReceiptType.bank)
                    Text(
                      'Conta ${controller.bankData!.account}-${controller.bankData!.verifyingDigit}',
                      style:
                          context.textStyles.textRegular.copyWith(fontSize: 12),
                    ),
                  Align(
                    alignment: Alignment.bottomRight,
                    child: TextButton(
                      onPressed: () => controller.clearBankReceipt(),
                      child: Text(
                        'Excluir',
                        style: context.textStyles.textBold.copyWith(
                          color: Colors.red,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
        const SizedBox(height: 24),
        Padding(
          padding: const EdgeInsets.all(16.0),
          child: Text(
            controller.bankData!.bankReceiptType == BankReceiptType.bank
                ? 'Se preferir, você pode cadastrar uma chave Pix. Exclua a conta bancária cadastrada acima e selecione a opção "Cadastre sua chave pix"'
                : 'Se preferir, você pode cadastrar uma conta bancária. Exclua a chave Pix cadastrada acima e selecione a opção "Cadastre sua conta bancária"',
            style: context.textStyles.textRegular.copyWith(
              fontSize: 14,
              color: Colors.grey.shade500,
            ),
          ),
        )
      ],
    );
  }
}
