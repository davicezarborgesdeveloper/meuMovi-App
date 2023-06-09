import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../core/ui/helpers/size_extensions.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../auth/auth_controller.dart';
import 'widget/task_button.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  AuthController authController = GetIt.I<AuthController>();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
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
                  style: context.textStyles.textBold.copyWith(fontSize: 16),
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
    );
    // child: SingleChildScrollView(
    //   child: Column(
    //     children: [
    //       SizedBox(
    //         height: context.percentHeight(.50),
    //         child: Expanded(
    //           child: GridView(
    //             gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
    //               mainAxisExtent: 165,
    //               mainAxisSpacing: 20,
    //               maxCrossAxisExtent: 180,
    //               crossAxisSpacing: 10,
    //             ),
    // children: const [
    // TaskButton(
    //   label: 'disponíveis',
    //   selected: true,
    // ),
    // TaskButton(
    //   label: 'confirmadas',
    //   selected: false,
    // ),
    // TaskButton(
    //   label: 'em andamento',
    //   selected: false,
    // ),
    // TaskButton(
    //   label: 'finalizadas',
    //   selected: false,
    // )
    //             ],
    //           ),
    //         ),
    //       ),
    //       // Row(
    //       //   children: [
    //       //     Text('Distância da tarefa'),
    //       //   ],
    //       // )
    //     ],
    //   ),
    // ),
    // );
  }
}
