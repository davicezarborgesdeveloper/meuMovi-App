import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/extensions/formatter_extensions.dart';
import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../../../core/ui/helpers/size_extensions.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../models/task_model.dart';
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
      await controller.getTasks(
        widget.userController.worker!.documents.employeer!.code,
        widget.userController.worker!.user!,
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    statusDisposer();
    super.dispose();
  }

  Future<void> _optionOpenDialog(TaskModel task) async {
    return showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Padding(
            padding: const EdgeInsets.fromLTRB(24, 0, 24, 16),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      'Atenção!!!',
                      style: context.textStyles.textBold.copyWith(fontSize: 20),
                    ),
                    IconButton(
                      onPressed: () => Navigator.of(context).pop(),
                      icon: const Icon(Icons.close),
                    ),
                  ],
                ),
                const SizedBox(height: 16),
                Text(
                  'Qual ação deseja realizar sobre  "${task.descriptionService}?"',
                  style: context.textStyles.textRegular.copyWith(fontSize: 16),
                ),
                const SizedBox(height: 24),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                        await controller.acceptTask(
                          task,
                          widget.userController.worker!.user!,
                        );
                        await controller.getTasks(
                          widget
                              .userController.worker!.documents.employeer!.code,
                          widget.userController.worker!.user!,
                        );
                      },
                      child: Text(
                        'Aceitar tarefa',
                        style: context.textStyles.textSemiBold
                            .copyWith(color: ColorsApp.i.primary),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
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
                .copyWith(fontSize: 18, color: ColorsApp.i.ternary),
            // ),
          ),
        ),
        iconTheme: IconThemeData(color: ColorsApp.i.ternary),
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
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        crossAxisCount: 2,
                        children: [
                          TaskButton(
                            label: 'disponíveis',
                            numberLabel: controller
                                .tasks!.available!.list!.length
                                .toString(),
                            option: 0,
                            themeColor: ColorsApp.i.ternary,
                            selected: controller.buttonSelected,
                            onPressed: () async {
                              controller.setButtonSelected(0);
                              await controller.getTasks(
                                widget.userController.worker!.documents
                                    .employeer!.code,
                                widget.userController.worker!.user!,
                              );
                            },
                          ),
                          TaskButton(
                            label: 'confirmadas',
                            numberLabel: controller
                                .tasks!.confirmed!.list!.length
                                .toString(),
                            option: 1,
                            themeColor: ColorsApp.i.ternary,
                            selected: controller.buttonSelected,
                            onPressed: () async {
                              controller.setButtonSelected(1);
                              await controller.getTasks(
                                widget.userController.worker!.documents
                                    .employeer!.code,
                                widget.userController.worker!.user!,
                              );
                            },
                          ),
                          TaskButton(
                            label: 'em andamento',
                            option: 2,
                            themeColor: ColorsApp.i.ternary,
                            numberLabel: controller
                                .tasks!.inProgress.list!.length
                                .toString(),
                            selected: controller.buttonSelected,
                            onPressed: () async {
                              controller.setButtonSelected(2);
                              await controller.getTasks(
                                widget.userController.worker!.documents
                                    .employeer!.code,
                                widget.userController.worker!.user!,
                              );
                            },
                          ),
                          TaskButton(
                            label: 'finalizadas',
                            numberLabel: controller.tasks!.finished.list!.length
                                .toString(),
                            option: 3,
                            themeColor: ColorsApp.i.ternary,
                            selected: controller.buttonSelected,
                            onPressed: () async {
                              controller.setButtonSelected(3);
                              await controller.getTasks(
                                widget.userController.worker!.documents
                                    .employeer!.code,
                                widget.userController.worker!.user!,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Observer(
                    builder: (_) => Text(
                      controller.buttonSelected == 0
                          ? 'Disponíveis'
                          : controller.buttonSelected == 1
                              ? 'Confirmadas'
                              : controller.buttonSelected == 2
                                  ? 'Em Andamento'
                                  : 'Finalizadas',
                      style: context.textStyles.textExtraBold
                          .copyWith(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Observer(
                    builder: (_) {
                      final list = controller.buttonSelected == 0
                          ? controller.tasks!.available
                          : controller.buttonSelected == 1
                              ? controller.tasks!.confirmed
                              : controller.buttonSelected == 2
                                  ? controller.tasks!.inProgress
                                  : controller.tasks!.finished;
                      return controller.selectedDashboard!.list!.isNotEmpty
                          ? Column(
                              children: controller.selectedDashboard!.list!
                                  .map(
                                    (tsk) => TaskListTile(
                                      task: tsk,
                                      onPressed: controller.buttonSelected == 0
                                          ? () {
                                              _optionOpenDialog(tsk);
                                            }
                                          : null,
                                      themeColor: ColorsApp.i.ternary,
                                    ),
                                  )
                                  .toList(),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: Center(
                                child: Text(
                                  'não há tarefas ${controller.buttonSelected == 0 ? 'em análise' : controller.buttonSelected == 1 ? 'em aberto' : controller.buttonSelected == 2 ? 'aguardando inicio' : controller.buttonSelected == 3 ? 'em andamento' : 'finalizadas'}',
                                  style:
                                      context.textStyles.textRegular.copyWith(
                                    color: Colors.grey,
                                    fontSize: 16,
                                  ),
                                ),
                              ),
                            );
                    },
                  ),
                  const SizedBox(height: 60),
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
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Tarefas',
                      style: context.textStyles.textExtraBold
                          .copyWith(color: ColorsApp.i.ternary, fontSize: 18),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              width: double.infinity,
              height: 50,
              color: Colors.white,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Total',
                    style: context.textStyles.textBold.copyWith(fontSize: 16),
                  ),
                  Observer(
                    builder: (_) {
                      return Text(
                        controller.selectedDashboard!.amountValue!.currencyPTBR,
                        style: context.textStyles.textExtraBold
                            .copyWith(fontSize: 18),
                      );
                    },
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
