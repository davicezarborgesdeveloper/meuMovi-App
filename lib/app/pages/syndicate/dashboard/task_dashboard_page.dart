import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../controllers/syndicate/task_dashboard_controller.dart';
import '../../../controllers/user_controller.dart';
import '../../../core/extensions/formatter_extensions.dart';
import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../core/ui/helpers/size_extensions.dart';
import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../core/widgets/dialog_task_options.dart';
import '../../../models/task_model.dart';
import '../../menu/menu_drawer.dart';
import '../../serviceTaker/home/widgets/task_button.dart';
import '../../serviceTaker/home/widgets/task_list_tile.dart';
import 'register/task_syndicate_register_page.dart';

class TaskDashboardPage extends StatefulWidget {
  final UserController userController;
  const TaskDashboardPage(this.userController, {super.key});

  @override
  State<TaskDashboardPage> createState() => _TaskDashboardPageState();
}

class _TaskDashboardPageState extends State<TaskDashboardPage>
    with Loader, Messages {
  final TaskDashboardController controller = TaskDashboardController();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case TaskDashboardStateStatus.initial:
            break;
          case TaskDashboardStateStatus.loading:
            showLoader();
            break;
          case TaskDashboardStateStatus.loaded:
            hideLoader();
            break;
          case TaskDashboardStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
      await controller.getTasks(
        widget.userController.syndicate!.user,
      );
    });
    super.initState();
  }

  Future<void> _optionOpenDialog(TaskModel model) async {
    return showDialog(
      context: context,
      builder: (context) => DialogTaskOptions(
        model.descriptionService,
        btDownLabel: 'Enviar para o trabalhador',
        btDownTap: model.access == 2
            ? () async {
                Navigator.of(context).pop();
                await controller.sendWorker(model.code!);
                await controller.getTasks(
                  widget.userController.syndicate!.user,
                );
              }
            : null,
        btLeftLabel: 'Recusar',
        btLeftTap: model.access == 1
            ? () async {
                Navigator.of(context).pop();
                // await controller.returnServiceTaker(task.code!);
                await controller.getTasks(
                  widget.userController.syndicate!.user,
                );
              }
            : null,
        btRightLabel: 'Editar',
        btRightTap: () async {
          Navigator.of(context).pop();
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => TaskSyndicateRegisterPage(task: model),
            ),
          );
          await controller.getTasks(
            widget.userController.syndicate!.user,
          );
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.i.bg,
        title: Text(
          'Tarefas',
          style: context.textStyles.textExtraBold.copyWith(
            color: ColorsApp.i.primary,
            fontSize: 18,
          ),
        ),
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
        actions: [
          IconButton(
            onPressed: () async {
              await controller.getTasks(
                widget.userController.syndicate!.user,
              );
            },
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const TaskSyndicateRegisterPage(),
                ),
              );
              await controller.getTasks(
                widget.userController.syndicate!.user,
              );
            },
            icon: const Icon(Icons.add),
          ),
        ],
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
                  Observer(
                    builder: (_) => SizedBox(
                      height: context.percentWidth(.65),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        crossAxisCount: 3,
                        shrinkWrap: true,
                        children: [
                          TaskButton(
                            label: 'em análise',
                            numberLabel: controller
                                    .tasks!.inAnalysis?.items!.length
                                    .toString() ??
                                '0',
                            option: 0,
                            themeColor: ColorsApp.i.primary,
                            selected: controller.buttonSelected,
                            onPressed: () async {
                              controller.setButtonSelected(0);
                              await controller.getTasks(
                                widget.userController.syndicate!.user,
                              );
                            },
                          ),
                          TaskButton(
                            label: 'em aberto',
                            numberLabel: controller.tasks!.opened?.items!.length
                                    .toString() ??
                                '0',
                            option: 1,
                            themeColor: ColorsApp.i.primary,
                            selected: controller.buttonSelected,
                            onPressed: () async {
                              controller.setButtonSelected(1);
                              await controller.getTasks(
                                widget.userController.syndicate!.user,
                              );
                            },
                          ),
                          TaskButton(
                            label: 'aguardando início',
                            numberLabel: controller
                                    .tasks!.waitStart?.items!.length
                                    .toString() ??
                                '0',
                            option: 2,
                            themeColor: ColorsApp.i.primary,
                            selected: controller.buttonSelected,
                            onPressed: () async {
                              controller.setButtonSelected(2);
                              await controller.getTasks(
                                widget.userController.syndicate!.user,
                              );
                            },
                          ),
                          TaskButton(
                            label: 'em andamento',
                            numberLabel: controller
                                    .tasks!.inProgress?.items!.length
                                    .toString() ??
                                '0',
                            option: 3,
                            themeColor: ColorsApp.i.primary,
                            selected: controller.buttonSelected,
                            onPressed: () async {
                              controller.setButtonSelected(3);
                              await controller.getTasks(
                                widget.userController.syndicate!.user,
                              );
                            },
                          ),
                          TaskButton(
                            label: 'finalizadas',
                            numberLabel: controller
                                    .tasks!.finished?.items!.length
                                    .toString() ??
                                '0',
                            option: 4,
                            themeColor: ColorsApp.i.primary,
                            selected: controller.buttonSelected,
                            onPressed: () async {
                              controller.setButtonSelected(4);
                              await controller.getTasks(
                                widget.userController.syndicate!.user,
                              );
                            },
                          )
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 8),
                  Observer(
                    builder: (_) => Text(
                      controller.buttonSelected == 0
                          ? 'Em análise'
                          : controller.buttonSelected == 1
                              ? 'Em aberto'
                              : controller.buttonSelected == 2
                                  ? 'Aguardando'
                                  : controller.buttonSelected == 3
                                      ? 'Em Andamento'
                                      : 'Finalizadas',
                      style: context.textStyles.textExtraBold
                          .copyWith(color: Colors.black, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Observer(
                    builder: (_) {
                      return controller.selectedDashboard != null &&
                              controller.selectedDashboard!.items!.isNotEmpty
                          ? Column(
                              children: controller.selectedDashboard!.items!
                                  .map(
                                    (tsk) => TaskListTile(
                                      themeColor: ColorsApp.i.primary,
                                      task: tsk,
                                      onPressed: () => _optionOpenDialog(tsk),
                                    ),
                                  )
                                  .toList(),
                            )
                          : Padding(
                              padding: const EdgeInsets.only(top: 24),
                              child: Center(
                                child: Text(
                                  'não há tarefas ${controller.buttonSelected == 0 ? 'em aberto' : controller.buttonSelected == 1 ? 'Confirmadas' : controller.buttonSelected == 2 ? 'Em Andamento' : 'Finalizadas'}',
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
                        controller.selectedDashboard != null
                            ? controller.selectedDashboard!.amount!.currencyPTBR
                            : 0.0.currencyPTBR,
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
