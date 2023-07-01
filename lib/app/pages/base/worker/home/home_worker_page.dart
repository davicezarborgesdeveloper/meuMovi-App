import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../../../core/ui/helpers/size_extensions.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../auth/user_controller.dart';
import '../../../menu/menu_drawer.dart';
import 'home_worker_controller.dart';
import 'widget/task_button.dart';
import 'widget/task_list_tile_.dart';

class HomeWorkerPage extends StatefulWidget {
  final UserController userController;
  const HomeWorkerPage(this.userController, {super.key});

  @override
  State<HomeWorkerPage> createState() => _HomeWorkerPageState();
}

class _HomeWorkerPageState extends State<HomeWorkerPage> with Loader, Messages {
  final HomeWorkerController controller = HomeWorkerController();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case HomeWorkerStateStatus.initial:
            break;
          case HomeWorkerStateStatus.loading:
            showLoader();
            break;
          case HomeWorkerStateStatus.loaded:
            hideLoader();
            break;
          case HomeWorkerStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
      controller.getTasks(
        widget.userController.worker!.documents.employeer!.code,
        status: 0,
      );
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
        title: Observer(
          builder: (_) => Text(
            'Olá, ${widget.userController.worker != null ? widget.userController.worker!.fullname : ''}',
            style: context.textStyles.textBold
                .copyWith(fontSize: 18, color: ColorsApp.i.black),
            // ),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 60,
                  ),
                  Observer(
                    builder: (_) => SizedBox(
                      height: context.percentHeight(kIsWeb ? 0.56 : 0.45),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        primary: false,
                        crossAxisSpacing: 12,
                        mainAxisSpacing: 12,
                        crossAxisCount: 2,
                        children: [
                          TaskButton(
                            label: 'disponíveis',
                            numberLabel: controller.tasks.length.toString(),
                            option: 0,
                            selected: controller.buttonSelected,
                            onPressed: () {
                              controller.setButtonSelected(0);
                              controller.getTasks(
                                widget.userController.worker!.documents
                                    .employeer!.code,
                                status: 0,
                              );
                            },
                          ),
                          TaskButton(
                            label: 'confirmadas',
                            option: 1,
                            selected: controller.buttonSelected,
                            onPressed: () {
                              controller.setButtonSelected(1);
                              controller.getTasks(
                                widget.userController.worker!.documents
                                    .employeer!.code,
                                status: 1,
                              );
                            },
                          ),
                          TaskButton(
                            label: 'em andamento',
                            option: 2,
                            selected: controller.buttonSelected,
                            onPressed: () {
                              controller.setButtonSelected(2);
                              controller.getTasks(
                                widget.userController.worker!.documents
                                    .employeer!.code,
                                status: 2,
                              );
                            },
                          ),
                          TaskButton(
                            label: 'finalizadas',
                            option: 3,
                            selected: controller.buttonSelected,
                            onPressed: () {
                              controller.setButtonSelected(3);
                              controller.getTasks(
                                widget.userController.worker!.documents
                                    .employeer!.code,
                                status: 3,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Text(
                    controller.buttonSelected == 0
                        ? 'Disponíveis'
                        : controller.buttonSelected == 1
                            ? 'Confirmadas'
                            : controller.buttonSelected == 2
                                ? 'Em Andamento'
                                : 'Finalizadas',
                    style: context.textStyles.textExtraBold
                        .copyWith(color: ColorsApp.i.black, fontSize: 18),
                  ),
                  const SizedBox(height: 16),
                  Observer(
                    builder: (_) => Column(
                      children: controller.tasks
                          .map(
                            (task) => TaskListTile(
                              task: task,
                              onPressed: () {},
                            ),
                          )
                          .toList(),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            height: 60,
            color: ColorsApp.i.bg,
            child: Padding(
              padding: const EdgeInsets.only(left: 8),
              child: Column(
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Tarefas',
                      style: context.textStyles.textExtraBold
                          .copyWith(color: ColorsApp.i.black, fontSize: 18),
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
