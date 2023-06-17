import 'package:flutter/material.dart';

import '../../../../core/ui/helpers/size_extensions.dart';
import 'widgets/my_tasks_button.dart';

class MyTasksPage extends StatelessWidget {
  const MyTasksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double width = context.screenWidth / 2.5;
    const height = 90.0;
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 16),
        child: Column(
          children: [
            SizedBox(
              height: context.percentHeight(.15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: height + 6,
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      children: [
                        const SizedBox(
                          width: 16,
                        ),
                        MyTasksButton(
                          label: 'Em Análise',
                          selected: true,
                          width: width,
                          height: height,
                        ),
                        MyTasksButton(
                          label: 'Em Aberto',
                          selected: false,
                          width: width,
                          height: height,
                        ),
                        MyTasksButton(
                          label: 'Aguardando Início',
                          selected: false,
                          width: width,
                          height: height,
                        ),
                        MyTasksButton(
                          label: 'Em Andamento',
                          selected: false,
                          width: width,
                          height: height,
                        ),
                        MyTasksButton(
                          label: 'Finalizadas',
                          selected: false,
                          width: width,
                          height: height,
                        ),
                        const SizedBox(
                          width: 16,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            const Text('oi')
          ],
        ),
      ),
    );
  }
}
