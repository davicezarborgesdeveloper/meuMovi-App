import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/ui/helpers/loader.dart';
import '../../../../../core/ui/helpers/messages.dart';
import '../../../../../core/ui/helpers/size_extensions.dart';
import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../models/task_model.dart';
import '../../../../auth/user_controller.dart';
import '../../../../menu/menu_drawer.dart';
import '../../../worker/home/widget/task_button.dart';
import '../list/widgets/task_list_tile.dart';
import '../register/task_syndicate_register_page.dart';
import 'task_dashboard_controller.dart';

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
                  children: [
                    TextButton(
                      onPressed: task.access == 1
                          ? () async {
                              Navigator.of(context).pop();
                              await controller.returnServiceTaker(task.code!);
                              await controller.getTasks(
                                widget.userController.syndicate!.user,
                              );
                            }
                          : null,
                      child: Text(
                        'Recusar',
                        style: context.textStyles.textSemiBold.copyWith(
                          color: task.access == 1
                              ? Colors.red
                              : Colors.grey.shade400,
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                TasksSyndicateRegisterPage(task: task),
                          ),
                        );

                        await controller.getTasks(
                          widget.userController.syndicate!.user,
                        );
                      },
                      child: Text(
                        'Editar',
                        style: context.textStyles.textSemiBold
                            .copyWith(color: Colors.blue),
                      ),
                    ),
                    if (task.access == 1)
                      TextButton(
                        onPressed: () async {
                          Navigator.of(context).pop();
                          await controller.sendWorker(task.code!);
                          await controller.getTasks(
                            widget.userController.syndicate!.user,
                          );
                        },
                        child: Text(
                          'Disponibilizar',
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
        title: Text(
          'Tarefas',
          style: context.textStyles.textExtraBold.copyWith(
            color: ColorsApp.i.primary,
            fontSize: 18,
          ),
        ),
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Observer(
                builder: (_) => SizedBox(
                  height: context.percentHeight(kIsWeb ? 0.56 : 0.30),
                  child: GridView.count(
                    physics: const NeverScrollableScrollPhysics(),
                    crossAxisSpacing: 4,
                    mainAxisSpacing: 4,
                    crossAxisCount: 3,
                    shrinkWrap: true,
                    children: [
                      TaskButton(
                        label: 'em análise',
                        numberLabel:
                            controller.tasks!.inAnalysis!.length.toString(),
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
                        numberLabel:
                            controller.tasks!.opened!.length.toString(),
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
                        numberLabel:
                            controller.tasks!.waitStart!.length.toString(),
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
                        numberLabel:
                            controller.tasks!.inProgress.length.toString(),
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
                        numberLabel:
                            controller.tasks!.finished.length.toString(),
                        option: 4,
                        themeColor: ColorsApp.i.primary,
                        selected: controller.buttonSelected,
                        onPressed: () async {
                          controller.setButtonSelected(4);
                          await controller.getTasks(
                            widget.userController.serviceTaker!.user,
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
                      ? 'Em análise'
                      : controller.buttonSelected == 1
                          ? 'Em aberto'
                          : controller.buttonSelected == 2
                              ? 'Aguardando início'
                              : controller.buttonSelected == 3
                                  ? 'Em andamento'
                                  : 'Finalizadas',
                  style: context.textStyles.textExtraBold
                      .copyWith(color: Colors.black, fontSize: 18),
                ),
              ),
              const SizedBox(height: 16),
              Observer(
                builder: (_) {
                  final list = controller.buttonSelected == 0
                      ? controller.tasks!.inAnalysis
                      : controller.buttonSelected == 1
                          ? controller.tasks!.opened
                          : controller.buttonSelected == 2
                              ? controller.tasks!.waitStart
                              : controller.buttonSelected == 3
                                  ? controller.tasks!.inProgress
                                  : controller.tasks!.finished;
                  return list!.isNotEmpty
                      ? Column(
                          children: list
                              .map(
                                (tsk) => TaskListTile(
                                  tsk,
                                  () => _optionOpenDialog(tsk),
                                  themeColor: ColorsApp.i.primary,
                                ),
                              )
                              .toList(),
                        )
                      : Padding(
                          padding: const EdgeInsets.only(top: 24),
                          child: Center(
                            child: Text(
                              'não há tarefas ${controller.buttonSelected == 0 ? 'em análise' : controller.buttonSelected == 1 ? 'em aberto' : controller.buttonSelected == 2 ? 'aguardando inicio' : controller.buttonSelected == 3 ? 'em andamento' : 'finalizadas'}',
                              style: context.textStyles.textRegular.copyWith(
                                color: Colors.grey,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
