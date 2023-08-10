import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../controllers/user_controller.dart';
import '../../../controllers/worker_list_controller.dart';
import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../core/widgets/dialog_task_options.dart';
import '../../../models/worker_model.dart';
import '../../menu/menu_drawer.dart';
import 'edit/syndicate_worker_edit_page.dart';
import 'register/syndicate_worker_register_page.dart';
import 'widgets/worker_list_tile.dart';

class WorkerListPage extends StatefulWidget {
  final UserController userController;
  const WorkerListPage(this.userController, {super.key});

  @override
  State<WorkerListPage> createState() => _WorkerListPageState();
}

class _WorkerListPageState extends State<WorkerListPage> with Loader, Messages {
  final WorkerListController controller = WorkerListController();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case WorkerListStateStatus.initial:
            break;
          case WorkerListStateStatus.loading:
            showLoader();
            break;
          case WorkerListStateStatus.loaded:
            hideLoader();
            break;
          case WorkerListStateStatus.saved:
            hideLoader();
            break;
          case WorkerListStateStatus.deleted:
            hideLoader();
            controller.findWorkers(widget.userController.syndicate!.user);
            break;
          case WorkerListStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
      controller.findWorkers(widget.userController.syndicate!.user);
    });
    super.initState();
  }

  @override
  void dispose() {
    statusDisposer();
    super.dispose();
  }

  Future<void> _optionOpenDialog(WorkerModel model) async {
    return showDialog(
      context: context,
      builder: (context) => DialogTaskOptions(
        model.fullname,
        btDownLabel: 'Cancelar',
        btDownTap: () => Navigator.of(context).pop(),
        btLeftLabel: 'Excluir',
        btLeftTap: () async {
          final navigator = Navigator.of(context);
          await controller.delete(model.user.toString());
          controller.findWorkers(widget.userController.syndicate!.user);
          navigator.pop();
        },
        btRightLabel: 'Editar',
        btRightTap: () async {
          Navigator.of(context).pop();
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => SyndicateWorkerEditPage(worker: model),
            ),
          );
          controller.findWorkers(widget.userController.syndicate!.user);
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
          'Trabalhadores',
          style:
              context.textStyles.textBold.copyWith(color: ColorsApp.i.primary),
        ),
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
        actions: [
          IconButton(
            onPressed: () =>
                controller.findWorkers(widget.userController.syndicate!.user),
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const SyndicateWorkerRegisterPage(),
                ),
              );
              controller.findWorkers(widget.userController.syndicate!.user);
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
            itemCount: controller.workers.length,
            itemBuilder: (context, index) => WorkerListTile(
              controller.workers[index],
              () => _optionOpenDialog(controller.workers[index]),
            ),
          ),
        ),
      ),
    );
  }
}
