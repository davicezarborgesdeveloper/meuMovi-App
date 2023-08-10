import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../controllers/syndicate_worker_edit_controller.dart';
import '../../../../core/extensions/formatter_extensions.dart';
import '../../../../core/ui/helpers/enums.dart';
import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../../../core/ui/helpers/size_extensions.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../core/widgets/image_widget.dart';
import '../../../../models/worker_model.dart';
import 'widgets/address_data_page.dart';
import 'widgets/bankData/bank_data_page.dart';
import 'widgets/document_data_page.dart';
import 'widgets/personal_data_page.dart';
import 'widgets/personal_tile.dart';
import 'widgets/title_bar_form_edit.dart';

class SyndicateWorkerEditPage extends StatefulWidget {
  final WorkerModel worker;
  const SyndicateWorkerEditPage({required this.worker, super.key});

  @override
  State<SyndicateWorkerEditPage> createState() =>
      _SyndicateWorkerEditPageState();
}

class _SyndicateWorkerEditPageState extends State<SyndicateWorkerEditPage>
    with Loader, Messages {
  final SyndicateWorkerEditController controller =
      SyndicateWorkerEditController();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    controller.getData(widget.worker);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case SyndicateWorkerEditStateStatus.initial:
            break;
          case SyndicateWorkerEditStateStatus.loading:
            showLoader();
            break;
          case SyndicateWorkerEditStateStatus.loaded:
            hideLoader();
            break;
          case SyndicateWorkerEditStateStatus.saved:
            hideLoader();
            break;
          case SyndicateWorkerEditStateStatus.error:
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
    statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.i.bg,
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            TitleBarFormEdit(
              title: 'Pessoal',
              titleColor: ColorsApp.i.primaryDark,
              padding: 16,
              onPressed: () async {
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => PersonalDataPage(controller.workerModel!),
                  ),
                );
                if (result != null) {
                  controller.setWorkerModel(result);
                }
              },
            ),
            Observer(
              builder: (_) => Padding(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 8),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        ImageWidget(
                          null,
                          widget.worker.imageUrl,
                          size: .25,
                          themeColor: ColorsApp.i.primary,
                        ),
                        const SizedBox(width: 12),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: context.percentWidth(.55),
                              child: Text(
                                controller.workerModel!.fullname,
                                style: context.textStyles.textBold.copyWith(
                                  fontSize: 24,
                                  color: ColorsApp.i.primaryDark,
                                ),
                              ),
                            ),
                            const SizedBox(
                              height: 8,
                            ),
                            Text(
                              'Trabalhador Avulso',
                              style: context.textStyles.textSemiBold.copyWith(
                                color: Colors.grey,
                                fontSize: 12,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        PersonalTile(
                          icon: Icons.cake,
                          text: controller.workerModel!.personal.birthdate,
                        ),
                        PersonalTile(
                          icon: Icons.email,
                          text: controller.workerModel!.personal.email,
                        ),
                        PersonalTile(
                          icon: Icons.phone,
                          text: controller.workerModel!.personal.phone != null
                              ? controller
                                  .workerModel!.personal.phone!.formattedPhone
                              : '',
                        ),
                        PersonalTile(
                          urlIcon: 'assets/images/ic-marital-status.png',
                          text: controller
                                  .workerModel!.personal.maritalStatus?.name ??
                              '',
                        ),
                        PersonalTile(
                          icon: Icons.woman,
                          text:
                              controller.workerModel!.personal.motherName ?? '',
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            TitleBarFormEdit(
              title: 'Documentos',
              titleColor: ColorsApp.i.primaryDark,
              padding: 16,
              onPressed: () async {
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => DocumentDataPage(controller.workerModel!),
                  ),
                );
                if (result != null) {
                  controller.setWorkerModel(result);
                }
              },
            ),
            Observer(
              builder: (_) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Column(
                  children: [
                    PersonalTile(
                      icon: Icons.file_copy,
                      text: controller.workerModel!.documents.cpf.formattedCPF,
                    ),
                    PersonalTile(
                      icon: Icons.crop_landscape,
                      text:
                          '${controller.workerModel!.documents.rg} ${controller.workerModel!.documents.orgaoEmissor ?? ''} ',
                    ),
                    PersonalTile(
                      icon: Icons.factory_outlined,
                      text: controller.workerModel!.documents.employeer!.name,
                    ),
                  ],
                ),
              ),
            ),
            TitleBarFormEdit(
              title: 'Endereço',
              titleColor: ColorsApp.i.primaryDark,
              padding: 16,
              onPressed: () async {
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => AddressDataPage(
                      worker: controller.workerModel,
                    ),
                  ),
                );
                if (result != null) {
                  controller.setWorkerModel(result);
                }
              },
            ),
            Observer(
              builder: (_) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.pin_drop,
                        color: ColorsApp.i.primaryLight.withAlpha(150),
                      ),
                      const SizedBox(width: 16),
                      SizedBox(
                        width: context.percentWidth(.7),
                        child: Text(
                          controller.workerModel!.address.toString(),
                          style: context.textStyles.textRegular
                              .copyWith(fontSize: 14),
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            TitleBarFormEdit(
              title: 'Dados Bancários',
              titleColor: ColorsApp.i.primaryDark,
              padding: 16,
              onPressed: () async {
                final result = await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => BankDataPage(
                      worker: controller.workerModel,
                    ),
                  ),
                );
                if (result != null) {
                  controller.setWorkerModel(result);
                }
              },
            ),
            Observer(
              builder: (_) {
                return controller.workerModel!.bankData != null
                    ? Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 16,
                        ),
                        child: controller
                                    .workerModel!.bankData!.bankReceiptType ==
                                BankReceiptType.bank
                            ? Row(
                                children: [
                                  Icon(
                                    Icons.credit_card,
                                    color:
                                        ColorsApp.i.primaryLight.withAlpha(150),
                                  ),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.workerModel!.bankData!
                                            .cardholderName!,
                                        style: context.textStyles.textBold
                                            .copyWith(fontSize: 16),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        controller
                                            .workerModel!.bankData!.bankName!,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Ag. ${controller.workerModel!.bankData!.agency!}',
                                        style: context.textStyles.textRegular,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        'Conta ${controller.workerModel!.bankData!.account}-${controller.workerModel!.bankData!.verifyingDigit}',
                                        style: context.textStyles.textRegular,
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        controller.workerModel!.bankData!
                                                    .accountType ==
                                                AccountType.corrente
                                            ? 'Conta Corrente'
                                            : 'Conta Poupança',
                                        style: context.textStyles.textRegular,
                                      ),
                                    ],
                                  ),
                                ],
                              )
                            : Row(
                                children: [
                                  Icon(
                                    Icons.pix,
                                    color:
                                        ColorsApp.i.primaryLight.withAlpha(150),
                                  ),
                                  const SizedBox(width: 16),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        controller.workerModel!.bankData!
                                            .pixKeyType!.name,
                                        style: context.textStyles.textBold
                                            .copyWith(fontSize: 18),
                                      ),
                                      const SizedBox(height: 4),
                                      Text(
                                        controller.workerModel!.bankData!.pixKey
                                            .toString(),
                                        style: context.textStyles.textRegular
                                            .copyWith(fontSize: 16),
                                      )
                                    ],
                                  ),
                                ],
                              ),
                      )
                    : Container();
              },
            ),
            const SizedBox(height: 32),
          ],
        ),
      ),
    );
  }
}
