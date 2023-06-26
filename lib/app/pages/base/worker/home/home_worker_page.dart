import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/ui/helpers/enums.dart';
import '../../../../core/ui/helpers/size_extensions.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../auth/auth_controller.dart';
import '../../../menu/menu_drawer.dart';
import 'home_worker_controller.dart';
import 'widget/task_button.dart';

class HomeWorkerPage extends StatefulWidget {
  const HomeWorkerPage({super.key});

  @override
  State<HomeWorkerPage> createState() => _HomeWorkerPageState();
}

class _HomeWorkerPageState extends State<HomeWorkerPage> {
  AuthController authController = GetIt.I<AuthController>();
  HomeWorkerController controller = HomeWorkerController();

  // int buttonSelected = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.i.bg,
        title: Text(
          'Olá, ${authController.auth!.displayName}',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontFamily: 'roboto',
            fontSize: 18,
            color: ColorsApp.i.black,
          ),
        ),
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
      ),
      drawer: const MenuDrawer(),
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  Observer(
                    builder: (_) => SizedBox(
                      height: context.percentHeight(kIsWeb ? 0.56 : 0.45),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        primary: false,
                        crossAxisSpacing: 8,
                        mainAxisSpacing: 8,
                        crossAxisCount: 2,
                        children: [
                          TaskButton(
                            label: 'disponíveis',
                            option: 0,
                            selected: controller.buttonSelected,
                            onPressed: () => controller.setButtonSelected(0),
                          ),
                          TaskButton(
                            label: 'confirmadas',
                            option: 1,
                            selected: controller.buttonSelected,
                            onPressed: () => controller.setButtonSelected(1),
                          ),
                          TaskButton(
                            label: 'em andamento',
                            option: 2,
                            selected: controller.buttonSelected,
                            onPressed: () => controller.setButtonSelected(2),
                          ),
                          TaskButton(
                            label: 'finalizadas',
                            option: 3,
                            selected: controller.buttonSelected,
                            onPressed: () => controller.setButtonSelected(3),
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Row(
                    children: [
                      Text(
                        'Distância da tarefa',
                        style:
                            context.textStyles.textBold.copyWith(fontSize: 16),
                      ),
                      const SizedBox(
                        width: 12,
                      ),
                      Observer(
                        builder: (_) {
                          return DropdownButton(
                            value: controller.optionDistance,
                            underline: const SizedBox(),
                            items: OptionDistance.values
                                .map(
                                  (o) => DropdownMenuItem(
                                    value: o,
                                    child: Text(o.name),
                                  ),
                                )
                                .toList(),
                            onChanged: (value) {
                              controller.setOptionDistance(value!);
                            },
                          );
                        },
                      ),
                      Expanded(
                        child: Container(
                          color: Colors.green,
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 80,
            color: ColorsApp.i.bg,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  const SizedBox(
                    height: 45,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Tarefas',
                      style: TextStyle(
                        fontWeight: FontWeight.w800,
                        fontFamily: 'roboto',
                        fontSize: 18,
                        color: ColorsApp.i.black,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
