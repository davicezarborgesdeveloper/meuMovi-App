import 'package:flutter/material.dart';

import '../../../../core/extensions/formatter_extensions.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../menu/menu_drawer.dart';
import '../../worker/extract/widget/period_button.dart';
import 'extract_service_taker_controller.dart';

class ExtractServiceTakerPage extends StatefulWidget {
  const ExtractServiceTakerPage({super.key});

  @override
  State<ExtractServiceTakerPage> createState() =>
      _ExtractServiceTakerPageState();
}

class _ExtractServiceTakerPageState extends State<ExtractServiceTakerPage> {
  ExtractServiceTakerController controller = ExtractServiceTakerController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.i.bg,
        iconTheme: IconThemeData(color: ColorsApp.i.secondary),
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
                      .copyWith(fontSize: 28, color: ColorsApp.i.secondary),
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
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PeriodButton(
                  themeColor: ColorsApp.i.secondary,
                  label: '7 dias',
                  option: 7,
                  selected: controller.buttonSelected,
                  onPressed: () => controller.setButtonSelected(7),
                ),
                PeriodButton(
                  themeColor: ColorsApp.i.secondary,
                  label: '15 dias',
                  option: 15,
                  selected: controller.buttonSelected,
                  onPressed: () => controller.setButtonSelected(15),
                ),
                PeriodButton(
                  themeColor: ColorsApp.i.secondary,
                  label: '30 dias',
                  option: 30,
                  selected: controller.buttonSelected,
                  onPressed: () => controller.setButtonSelected(30),
                ),
                PeriodButton(
                  themeColor: ColorsApp.i.secondary,
                  label: '60 dias',
                  option: 60,
                  selected: controller.buttonSelected,
                  onPressed: () => controller.setButtonSelected(60),
                ),
              ],
            ),
          ),
          // ListView(
          //   children: [],
          // ),
        ],
      ),
    );
  }
}
