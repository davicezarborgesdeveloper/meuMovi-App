import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/ui/helpers/loader.dart';
import '../../../../../core/ui/helpers/messages.dart';
import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../models/task_model.dart';
import '../../../../auth/user_controller.dart';
import '../../../../menu/menu_drawer.dart';
import '../../../syndicate/tasks/list/widgets/task_list_tile.dart';
import '../register/task_service_taker_register_page.dart';
import 'task_list_service_taker_controller.dart';

class TaskListServiceTakerPage extends StatefulWidget {
  final UserController userCtrl;
  const TaskListServiceTakerPage(this.userCtrl, {super.key});

  @override
  State<TaskListServiceTakerPage> createState() =>
      _TaskListServiceTakerPageState();
}

class _TaskListServiceTakerPageState extends State<TaskListServiceTakerPage>
    with Loader, Messages {
  final TaskListServiceTakerController controller =
      TaskListServiceTakerController();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case TaskListServiceTakerStateStatus.initial:
            break;
          case TaskListServiceTakerStateStatus.loading:
            showLoader();
            break;
          case TaskListServiceTakerStateStatus.loaded:
            hideLoader();
            break;
          case TaskListServiceTakerStateStatus.saved:
            hideLoader();
            break;
          case TaskListServiceTakerStateStatus.deleted:
            hideLoader();
            await controller.findTask(widget.userCtrl.serviceTaker!.user);
            break;
          case TaskListServiceTakerStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
      await controller.findTask(widget.userCtrl.serviceTaker!.user);
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
            padding: const EdgeInsets.all(24.0),
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
                      onPressed: () async {
                        final navigator = Navigator.of(context);
                        await controller.deleteTask(task.code.toString());
                        navigator.pop();
                      },
                      child: Text(
                        'Excluir',
                        style: context.textStyles.textSemiBold
                            .copyWith(color: Colors.red),
                      ),
                    ),
                    TextButton(
                      onPressed: () async {
                        Navigator.of(context).pop();
                        await Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) =>
                                TaskServiceTakerRegisterPage(task: task),
                          ),
                        );
                        await controller
                            .findTask(widget.userCtrl.serviceTaker!.user);
                      },
                      child: Text(
                        'Editar',
                        style: context.textStyles.textSemiBold
                            .copyWith(color: Colors.blue),
                      ),
                    ),
                    if (task.access == 0)
                      TextButton(
                        onPressed: () async {
                          Navigator.of(context).pop();
                          await controller.sentSyndicate(
                            task.code!,
                            widget.userCtrl.serviceTaker!.employeer!.code,
                          );
                          await controller
                              .findTask(widget.userCtrl.serviceTaker!.user);
                        },
                        child: Text(
                          'Enviar solicitação',
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
          style:
              context.textStyles.textBold.copyWith(color: ColorsApp.i.primary),
        ),
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const TaskServiceTakerRegisterPage(),
                ),
              );
              await controller.findTask(widget.userCtrl.serviceTaker!.user);
            },
            icon: const Icon(Icons.add),
          ),
        ],
      ),
      drawer: const MenuDrawer(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Observer(
          builder: (_) => ListView.builder(
            itemCount: controller.tasks.length,
            itemBuilder: (context, index) => TaskListTile(
              controller.tasks[index],
              () => _optionOpenDialog(controller.tasks[index]),
            ),
          ),
        ),
      ),
    );
  }
}
