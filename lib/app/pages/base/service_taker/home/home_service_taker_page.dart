import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/ui/helpers/size_extensions.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../auth/auth_controller.dart';
import '../../../auth/user_controller.dart';
import '../../../menu/menu_drawer.dart';
import '../../worker/home/widget/task_button.dart';

class HomeServiceTakerPage extends StatefulWidget {
  const HomeServiceTakerPage({super.key});

  @override
  State<HomeServiceTakerPage> createState() => _HomeServiceTakerPageState();
}

class _HomeServiceTakerPageState extends State<HomeServiceTakerPage> {
  AuthController authController = GetIt.I<AuthController>();
  UserController userCtrl = GetIt.I<UserController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.i.bg,
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
                  SizedBox(
                    height: context.percentHeight(kIsWeb ? 0.56 : 0.45),
                    child: GridView.count(
                      physics: const NeverScrollableScrollPhysics(),
                      primary: false,
                      crossAxisSpacing: 8,
                      mainAxisSpacing: 8,
                      crossAxisCount: 2,
                      children: const [
                        TaskButton(
                          label: 'disponíveis',
                          selected: true,
                        ),
                        TaskButton(
                          label: 'confirmadas',
                          selected: false,
                        ),
                        TaskButton(
                          label: 'em andamento',
                          selected: false,
                        ),
                        TaskButton(
                          label: 'finalizadas',
                          selected: false,
                        )
                      ],
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
                      DropdownButton(
                        value: 25,
                        underline: const SizedBox(),
                        items: const [
                          DropdownMenuItem(
                            value: 25,
                            child: Text('25 km'),
                          ),
                          DropdownMenuItem(
                            value: 50,
                            child: Text('50 km'),
                          ),
                          DropdownMenuItem(
                            value: 75,
                            child: Text('75 km'),
                          ),
                          DropdownMenuItem(
                            value: 100,
                            child: Text('100 km'),
                          ),
                        ],
                        onChanged: (value) {},
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
                  SizedBox(
                    width: context.percentWidth(.8),
                    child: Text(
                      authController.auth!.displayName,
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontFamily: 'roboto',
                        fontSize: 18,
                        color: ColorsApp.i.black,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 36,
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
