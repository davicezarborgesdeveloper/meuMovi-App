import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/extensions/formatter_extensions.dart';
import '../../../../../core/ui/helpers/enums.dart';
import '../../../../../core/ui/helpers/loader.dart';
import '../../../../../core/ui/helpers/messages.dart';
import '../../../../../core/ui/helpers/size_extensions.dart';
import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../models/worker_model.dart';
import '../../../worker/profile/widget/image_widget.dart';
import 'address_data/address_data_page.dart';
import 'document_data/document_data_page.dart';
import 'personal_data/personal_data_page.dart';
import 'syndicate_worker_edit_controller.dart';
import 'widgets/personal_tile.dart';

// ignore: must_be_immutable
class SyndicateWorkerEditPage extends StatefulWidget {
  WorkerModel worker;
  SyndicateWorkerEditPage({super.key, required this.worker});

  @override
  State<SyndicateWorkerEditPage> createState() =>
      _SyndicateWorkerEditPageState();
}

class _SyndicateWorkerEditPageState extends State<SyndicateWorkerEditPage>
    with Loader, Messages {
  // WorkerModel get worker => widget.worker;
  // final UserController userCtrl = GetIt.I<UserController>();
  final SyndicateWorkerEditController controller =
      SyndicateWorkerEditController();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    controller.getData(widget.worker);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case ProfileWorkerStateStatus.initial:
            break;
          case ProfileWorkerStateStatus.loading:
            showLoader();
            break;
          case ProfileWorkerStateStatus.loaded:
            hideLoader();
            break;
          case ProfileWorkerStateStatus.error:
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
            Observer(
              builder: (_) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Stack(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            ImageWidget(
                              null,
                              widget.worker.imageUrl,
                              size: 100,
                            ),
                            const SizedBox(width: 12),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.workerModel!.fullname,
                                  style: context.textStyles.textBold.copyWith(
                                    fontSize: 28,
                                    color: ColorsApp.i.primaryDark,
                                  ),
                                ),
                                const SizedBox(
                                  height: 8,
                                ),
                                Text(
                                  'Trabalhador Avulso',
                                  style: context.textStyles.textSemiBold
                                      .copyWith(
                                          color: Colors.grey, fontSize: 12),
                                ),
                              ],
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              PersonalTile(
                                icon: Icons.cake,
                                text:
                                    controller.workerModel!.personal.birthdate,
                              ),
                              PersonalTile(
                                icon: Icons.email,
                                text: controller.workerModel!.personal.email,
                              ),
                              PersonalTile(
                                icon: Icons.phone,
                                text: controller.workerModel!.personal.phone ??
                                    '',
                              ),
                              PersonalTile(
                                urlIcon: 'assets/images/ic-marital-status.png',
                                text: controller.workerModel!.personal
                                        .maritalStatus?.name ??
                                    '',
                              ),
                              PersonalTile(
                                icon: Icons.woman,
                                text: controller
                                        .workerModel!.personal.motherName ??
                                    '',
                              ),
                              // Text(),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () async {
                          final result = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) =>
                                  PersonalDataPage(controller.workerModel!),
                            ),
                          );
                          if (result != null) {
                            controller.setWorkerModel(result);
                          }
                        },
                        icon: Icon(
                          Icons.edit,
                          color: ColorsApp.i.primary,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),

            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Observer(
              builder: (_) => Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Stack(
                  children: [
                    Column(
                      children: [
                        PersonalTile(
                          icon: Icons.file_copy,
                          text: controller
                              .workerModel!.documents.cpf.formattedCPF,
                          // text: widget.worker.documents.cpf.formattedCPF,
                        ),
                        PersonalTile(
                          icon: Icons.crop_landscape,
                          text:
                              '${controller.workerModel!.documents.rg} ${controller.workerModel!.documents.orgaoEmissor ?? ''} ',
                        ),
                        PersonalTile(
                          icon: Icons.factory_outlined,
                          text:
                              controller.workerModel!.documents.employeer!.name,
                        ),
                      ],
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: IconButton(
                        onPressed: () async {
                          final result = await Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (_) =>
                                  DocumentDataPage(controller.workerModel!),
                            ),
                          );
                          if (result != null) {
                            controller.setWorkerModel(result);
                          }
                        },
                        icon: Icon(
                          Icons.edit,
                          color: ColorsApp.i.primary,
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            Observer(
              builder: (_) {
                return Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                  child: Stack(
                    children: [
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Icon(Icons.pin_drop),
                          const SizedBox(width: 16),
                          SizedBox(
                            width: context.percentWidth(.7),
                            child: Text(
                              controller.workerModel!.address.toString(),
                              style: context.textStyles.textRegular
                                  .copyWith(fontSize: 16),
                            ),
                          ),
                        ],
                      ),
                      Align(
                        alignment: Alignment.topRight,
                        child: IconButton(
                          onPressed: () async {
                            final result = await Navigator.of(context).push(
                              MaterialPageRoute(
                                builder: (_) =>
                                    AddressDataPage(controller.workerModel!),
                              ),
                            );
                            if (result != null) {
                              controller.setWorkerModel(result);
                            }
                          },
                          icon: Icon(
                            Icons.edit,
                            color: ColorsApp.i.primary,
                          ),
                        ),
                      )
                    ],
                  ),
                );
              },
            ),
            const Padding(
              padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
              child: Divider(
                color: Colors.grey,
              ),
            ),
            // if (widget.worker.bankData != null)
            if (widget.worker.bankData != null)
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
                child: Stack(
                  children: [
                    widget.worker.bankData!.bankReceiptType ==
                            BankReceiptType.bank
                        ? Row(
                            children: [
                              const Icon(Icons.credit_card),
                              const SizedBox(width: 8),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.worker.bankData!.cardholderName!,
                                    style: context.textStyles.textBold
                                        .copyWith(fontSize: 16),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(widget.worker.bankData!.bankName!),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Ag. ${widget.worker.bankData!.agency!}',
                                    style: context.textStyles.textRegular,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    'Conta ${widget.worker.bankData!.account}-${widget.worker.bankData!.verifyingDigit}',
                                    style: context.textStyles.textRegular,
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    widget.worker.bankData!.accountType ==
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
                              const Icon(Icons.pix),
                              const SizedBox(width: 16),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.worker.bankData!.pixKeyType!.name,
                                    style: context.textStyles.textBold
                                        .copyWith(fontSize: 18),
                                  ),
                                  const SizedBox(height: 4),
                                  Text(
                                    widget.worker.bankData!.pixKey.toString(),
                                    style: context.textStyles.textRegular
                                        .copyWith(fontSize: 16),
                                  )
                                ],
                              ),
                            ],
                          ),
                    // Row(
                    //   crossAxisAlignment: CrossAxisAlignment.start,
                    //   children: [
                    //     const Icon(Icons.pin_drop),
                    //     const SizedBox(width: 8),
                    //     SizedBox(
                    //       width: context.percentWidth(.7),
                    //       child: Text(
                    //         widget.worker.address.toString(),
                    //         style: context.textStyles.textRegular
                    //             .copyWith(fontSize: 16),
                    //       ),
                    //     ),
                    //   ],
                    // ),
                    // Align(
                    //   alignment: Alignment.topRight,
                    //   child: IconButton(
                    //     onPressed: () {},
                    //     icon: Icon(
                    //       Icons.edit,
                    //       color: ColorsApp.i.primary,
                    //     ),
                    //   ),
                    // )
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
