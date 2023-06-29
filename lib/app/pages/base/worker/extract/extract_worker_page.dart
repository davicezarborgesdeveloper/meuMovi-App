import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../core/extensions/formatter_extensions.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../menu/menu_drawer.dart';
import 'extract_worker_controller.dart';
import 'widget/period_button.dart';

class ExtractWorkerPage extends StatefulWidget {
  const ExtractWorkerPage({Key? key}) : super(key: key);

  @override
  State<ExtractWorkerPage> createState() => _ExtractWorkerPageState();
}

class _ExtractWorkerPageState extends State<ExtractWorkerPage> {
  ExtractWorkerController controller = ExtractWorkerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.i.bg,
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
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
                Text(
                  0.00.currencyPTBR,
                  style: context.textStyles.textSemiBold
                      .copyWith(fontSize: 28, color: ColorsApp.i.primary),
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
                    label: '7 dias',
                    option: 7,
                    selected: controller.buttonSelected,
                    onPressed: () => controller.setButtonSelected(7),
                  ),
                  PeriodButton(
                    label: '15 dias',
                    option: 15,
                    selected: controller.buttonSelected,
                    onPressed: () => controller.setButtonSelected(15),
                  ),
                  PeriodButton(
                    label: '30 dias',
                    option: 30,
                    selected: controller.buttonSelected,
                    onPressed: () => controller.setButtonSelected(30),
                  ),
                  PeriodButton(
                    label: '60 dias',
                    option: 60,
                    selected: controller.buttonSelected,
                    onPressed: () => controller.setButtonSelected(60),
                  ),
                ],
              ),
            ),
            // child: const Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     PeriodButton(label: '7 dias', selected: false),
            //     PeriodButton(label: '15 dias', selected: false),
            //     PeriodButton(label: '30 dias', selected: true),
            //     PeriodButton(label: '60 dias', selected: false),
            //   ],
            // ),
          ),
          // ListView(
          //   children: [],
          // ),
        ],
      ),
    );
  }
}
