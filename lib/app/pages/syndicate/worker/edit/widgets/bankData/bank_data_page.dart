import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../controllers/syndicate/syndicate_worker_bank_controller.dart';
import '../../../../../../core/ui/helpers/loader.dart';
import '../../../../../../core/ui/helpers/messages.dart';
import '../../../../../../core/ui/styles/colors_app.dart';
import '../../../../../../core/ui/styles/text_styles.dart';
import '../../../../../../models/worker_model.dart';
import '../../../../../worker/profileWorker/bankAccount/widgets/bank_account_page.dart';
import '../../../../../worker/profileWorker/bankAccount/widgets/pix_account_page.dart';
import 'card_bank.dart';

class BankDataPage extends StatefulWidget {
  final WorkerModel? worker;
  const BankDataPage({super.key, required this.worker});

  @override
  State<BankDataPage> createState() => _BankDataPageState();
}

class _BankDataPageState extends State<BankDataPage> with Loader, Messages {
  final SyndicateWorkerBankController controller =
      SyndicateWorkerBankController();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case SyndicateWorkerBankStateStatus.initial:
            break;
          case SyndicateWorkerBankStateStatus.loading:
            showLoader();
            break;
          case SyndicateWorkerBankStateStatus.loaded:
            hideLoader();
            break;
          case SyndicateWorkerBankStateStatus.update:
            hideLoader();
            Navigator.pop(context, controller.workerModel);
            break;
          case SyndicateWorkerBankStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
      controller.getBankReceipt(widget.worker!);
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
        backgroundColor: Colors.grey[100],
        title: Text(
          'Dados bancários',
          style: context.textStyles.textBold
              .copyWith(color: ColorsApp.i.primaryDark),
        ),
        iconTheme: IconThemeData(color: ColorsApp.i.primaryDark),
      ),
      body: Padding(
        padding: const EdgeInsets.fromLTRB(24, 32, 24, 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Observer(
              builder: (_) => Text(
                controller.bankData != null
                    ? 'Minha conta cadastrada para recebimentos'
                    : 'Cadastre uma conta bancária ativa ou chave Pix para recebimentos.',
                style: context.textStyles.textRegular
                    .copyWith(fontSize: 15, color: Colors.grey.shade500),
              ),
            ),
            const SizedBox(height: 32),
            Observer(
              builder: (_) => controller.bankData != null
                  ? CardBank(controller)
                  : Column(
                      children: [
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const PixAccountPage(),
                                ),
                              );
                              await controller.getBankReceipt(widget.worker!);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.pix,
                                    color: ColorsApp.i.ternary,
                                  ),
                                  const SizedBox(width: 16),
                                  Text(
                                    'Cadastre sua chave Pix',
                                    style: context.textStyles.textBold.copyWith(
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        SizedBox(
                          height: 60,
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () async {
                              await Navigator.of(context).push(
                                MaterialPageRoute(
                                  builder: (_) => const BankAccountPage(),
                                ),
                              );
                              await controller.getBankReceipt(widget.worker!);
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.white,
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  Icon(
                                    Icons.credit_card,
                                    color: ColorsApp.i.ternary,
                                  ),
                                  const SizedBox(width: 16),
                                  Text(
                                    'Cadastre sua conta bancária',
                                    style: context.textStyles.textBold.copyWith(
                                      color: Colors.grey.shade600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
