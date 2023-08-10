import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../controllers/extract_worker_controller.dart';
import '../../../controllers/user_controller.dart';
import '../../../core/extensions/formatter_extensions.dart';
import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../core/widgets/period_button.dart';
import '../../menu/menu_drawer.dart';

class ExtractWorkerPage extends StatefulWidget {
  final UserController userController;
  const ExtractWorkerPage(this.userController, {super.key});

  @override
  State<ExtractWorkerPage> createState() => _ExtractWorkerPageState();
}

class _ExtractWorkerPageState extends State<ExtractWorkerPage>
    with Loader, Messages {
  ExtractWorkerController controller = ExtractWorkerController();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case ExtractWorkerStateStatus.initial:
            break;
          case ExtractWorkerStateStatus.loading:
            showLoader();
            break;
          case ExtractWorkerStateStatus.loaded:
            hideLoader();
            break;
          case ExtractWorkerStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
      // await controller.getPayments(
      //   widget.userController.worker!.user!,
      // );
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.i.bg,
        title: const Text('asdas'),
        iconTheme: IconThemeData(color: ColorsApp.i.ternary),
      ),
      drawer: const MenuDrawer(),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 24, right: 16, top: 32),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Observer(
                  builder: (_) => Text(
                    controller.amount!.currencyPTBR,
                    style: context.textStyles.textSemiBold
                        .copyWith(fontSize: 28, color: ColorsApp.i.ternary),
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  'Total de valores recebidos periodo',
                  style: context.textStyles.textRegular
                      .copyWith(color: Colors.grey),
                )
              ],
            ),
          ),
          const SizedBox(height: 32),
          Container(
            width: double.infinity,
            // height: 50,
            color: Colors.grey.shade300,
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Observer(
              builder: (_) => Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  PeriodButton(
                    themeColor: ColorsApp.i.ternary,
                    label: '7 dias',
                    option: 7,
                    selected: controller.buttonSelected,
                    onPressed: () => controller.setButtonSelected(7),
                  ),
                  PeriodButton(
                    themeColor: ColorsApp.i.ternary,
                    label: '15 dias',
                    option: 15,
                    selected: controller.buttonSelected,
                    onPressed: () => controller.setButtonSelected(15),
                  ),
                  PeriodButton(
                    themeColor: ColorsApp.i.ternary,
                    label: '30 dias',
                    option: 30,
                    selected: controller.buttonSelected,
                    onPressed: () => controller.setButtonSelected(30),
                  ),
                  PeriodButton(
                    themeColor: ColorsApp.i.ternary,
                    label: '60 dias',
                    option: 60,
                    selected: controller.buttonSelected,
                    onPressed: () => controller.setButtonSelected(60),
                  ),
                ],
              ),
            ),
          ),
          // Expanded(
          //     child: Padding(
          //       padding: const EdgeInsets.symmetric(vertical: 8.0),
          //       child: Observer(
          //         builder: (_) => ListView.builder(
          //           itemCount: controller.orders.length,
          //           itemBuilder: (context, index) {
          //             return PeriodExtractTile(
          //               controller.orders[index],
          //               index.isEven,
          //             );
          //           },
          //         ),
          //       ),
          //     ),
          //   ),
        ],
      ),
    );
  }
}
