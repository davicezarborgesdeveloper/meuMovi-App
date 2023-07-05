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
import '../register/task_syndicate_register_page.dart';
import 'task_list_controller.dart';
import 'widgets/task_list_tile.dart';

class TaskListPage extends StatefulWidget {
  final UserController userCtrl;
  const TaskListPage(this.userCtrl, {super.key});

  @override
  State<TaskListPage> createState() => _TaskListPageState();
}

class _TaskListPageState extends State<TaskListPage> with Loader, Messages {
  final TaskListController controller = TaskListController();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case TaskListStateStatus.initial:
            break;
          case TaskListStateStatus.loading:
            showLoader();
            break;
          case TaskListStateStatus.loaded:
            hideLoader();
            break;
          case TaskListStateStatus.saved:
            hideLoader();
            break;
          case TaskListStateStatus.deleted:
            hideLoader();
            await controller.findTask(widget.userCtrl.syndicate!.user);
            break;
          case TaskListStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
      controller.findTask(widget.userCtrl.syndicate!.user);
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
        return AlertDialog(
          title: const Text('Atenção!!!'),
          content: const Text('Qual ação deseja realizar?'),
          actions: [
            TextButton(
              onPressed: () => Navigator.of(context).pop(),
              child: Text(
                'Cancelar',
                style: context.textStyles.textSemiBold
                    .copyWith(color: Colors.grey),
              ),
            ),
            TextButton(
              onPressed: () async {
                final navigator = Navigator.of(context);
                await controller.deleteTask(task.code.toString());
                navigator.pop();
              },
              child: Text(
                'Excluir',
                style:
                    context.textStyles.textSemiBold.copyWith(color: Colors.red),
              ),
            ),
            TextButton(
              onPressed: () async {
                Navigator.of(context).pop();
                await Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (_) => TasksSyndicateRegisterPage(task: task),
                  ),
                );
                controller.findTask(widget.userCtrl.syndicate!.user);
              },
              child: Text(
                'Editar',
                style: context.textStyles.textSemiBold
                    .copyWith(color: Colors.blue),
              ),
            ),
          ],
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
          // IconButton(onPressed: () {}, icon: const Icon(Icons.filter_alt)),
          // IconButton(onPressed: () {}, icon: const Icon(Icons.dashboard)),
          IconButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const TasksSyndicateRegisterPage(),
                ),
              );
              controller.findTask(widget.userCtrl.syndicate!.user);
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
              themeColor: ColorsApp.i.primary,
            ),
          ),
        ),
      ),
    );
  }
}
