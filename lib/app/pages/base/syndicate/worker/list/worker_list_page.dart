import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/ui/helpers/loader.dart';
import '../../../../../core/ui/helpers/messages.dart';
import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../models/worker_model.dart';
import '../../../../auth/user_controller.dart';
import '../../../../menu/menu_drawer.dart';
import '../edit/syndicate_worker_edit_page.dart';
import '../register/worker_syndicate_register_page.dart';
import 'widget/worker_list_tile.dart';
import 'worker_list_controller.dart';

class WorkerListPage extends StatefulWidget {
  final UserController userCtrl;
  const WorkerListPage(this.userCtrl, {super.key});

  @override
  State<WorkerListPage> createState() => _WorkerListPageState();
}

class _WorkerListPageState extends State<WorkerListPage> with Loader, Messages {
  final UserController userController = GetIt.I<UserController>();
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
            controller.findWorkers(userController.syndicate!.user);
            break;
          case WorkerListStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
      controller.findWorkers(userController.syndicate!.user);
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
                await controller.delete(model.user.toString());
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
                    builder: (_) => SyndicateWorkerEditPage(worker: model),
                  ),
                );
                controller.findWorkers(userController.syndicate!.user);
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
          'Trabalhadores',
          style:
              context.textStyles.textBold.copyWith(color: ColorsApp.i.primary),
        ),
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
        actions: [
          // IconButton(onPressed: () {}, icon: const Icon(Icons.filter_alt)),
          IconButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const WorkerSyndicateRegisterPage(),
                ),
              );
              controller.findWorkers(userController.syndicate!.user);
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
