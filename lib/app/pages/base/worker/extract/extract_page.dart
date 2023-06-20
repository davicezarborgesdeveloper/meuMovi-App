import 'package:flutter/material.dart';

import '../../../../core/extensions/formatter_extensions.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../menu/menu_drawer.dart';
import 'widget/period_button.dart';

class ExtractPage extends StatelessWidget {
  const ExtractPage({Key? key}) : super(key: key);

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
            child: const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                PeriodButton(label: '7 dias', selected: false),
                PeriodButton(label: '15 dias', selected: false),
                PeriodButton(label: '30 dias', selected: true),
                PeriodButton(label: '60 dias', selected: false),
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
