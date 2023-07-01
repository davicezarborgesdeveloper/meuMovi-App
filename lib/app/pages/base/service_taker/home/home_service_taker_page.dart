import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:meu_movi/app/pages/base/service_taker/home/register/task_service_taker_register_page.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../../../core/ui/helpers/size_extensions.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../models/task_model.dart';
import '../../../auth/user_controller.dart';
import '../../../menu/menu_drawer.dart';
import '../../worker/home/widget/task_button.dart';
import '../../worker/home/widget/task_list_tile_.dart';
import 'home_service_taker_controller.dart';

class HomeServiceTakerPage extends StatefulWidget {
  final UserController userController;
  const HomeServiceTakerPage(this.userController, {super.key});

  @override
  State<HomeServiceTakerPage> createState() => _HomeServiceTakerPageState();
}

class _HomeServiceTakerPageState extends State<HomeServiceTakerPage>
    with Loader, Messages {
  final HomeServiceTakerController controller = HomeServiceTakerController();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case HomeServiceTakerStateStatus.initial:
            break;
          case HomeServiceTakerStateStatus.loading:
            showLoader();
            break;
          case HomeServiceTakerStateStatus.loaded:
            hideLoader();
            break;
          case HomeServiceTakerStateStatus.deleted:
            hideLoader();
            await controller.getTasks(
              widget.userController.serviceTaker!.user,
            );
            break;
          case HomeServiceTakerStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
      await controller.getTasks(
        widget.userController.serviceTaker!.user,
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
                      onPressed: task.access == 0
                          ? () async {
                              final navigator = Navigator.of(context);
                              await controller.deleteTask(task.code.toString());
                              navigator.pop();
                            }
                          : null,
                      child: Text(
                        'Excluir',
                        style: context.textStyles.textSemiBold.copyWith(
                          color: task.access == 0
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
                                TaskServiceTakerRegisterPage(task: task),
                          ),
                        );
                        await controller.getTasks(
                          widget.userController.serviceTaker!.user,
                        );
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
                            widget.userController.serviceTaker!.employeer!.code,
                          );
                          await controller.getTasks(
                            widget.userController.serviceTaker!.user,
                          );
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
  void dispose() {
    statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.i.bg,
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const TaskServiceTakerRegisterPage(),
                ),
              );
              await controller.getTasks(
                widget.userController.serviceTaker!.user,
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
                  const SizedBox(
                    height: 60,
                  ),
                  Observer(
                    builder: (_) => SizedBox(
                      height: context.percentHeight(kIsWeb ? 0.56 : 0.45),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 4,
                        mainAxisSpacing: 4,
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        children: [
                          TaskButton(
                            label: 'em aberto',
                            numberLabel:
                                controller.tasks!.opened.length.toString(),
                            option: 0,
                            selected: controller.buttonSelected,
                            onPressed: () async {
                              controller.setButtonSelected(0);
                              await controller.getTasks(
                                widget.userController.serviceTaker!.user,
                              );
                            },
                          ),
                          TaskButton(
                            label: 'confirmadas',
                            numberLabel:
                                controller.tasks!.confirmed.length.toString(),
                            option: 1,
                            selected: controller.buttonSelected,
                            onPressed: () {
                              controller.setButtonSelected(1);
                              controller.getTasks(
                                widget.userController.serviceTaker!.user,
                              );
                            },
                          ),
                          TaskButton(
                            label: 'em andamento',
                            numberLabel:
                                controller.tasks!.inProgress.length.toString(),
                            option: 2,
                            selected: controller.buttonSelected,
                            onPressed: () {
                              controller.setButtonSelected(2);
                              controller.getTasks(
                                widget.userController.serviceTaker!.user,
                              );
                            },
                          ),
                          TaskButton(
                            label: 'finalizadas',
                            numberLabel:
                                controller.tasks!.finished.length.toString(),
                            option: 3,
                            selected: controller.buttonSelected,
                            onPressed: () {
                              controller.setButtonSelected(3);
                              controller.getTasks(
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
                          ? 'em aberto'
                          : controller.buttonSelected == 1
                              ? 'Confirmadas'
                              : controller.buttonSelected == 2
                                  ? 'Em Andamento'
                                  : 'Finalizadas',
                      style: context.textStyles.textExtraBold
                          .copyWith(color: ColorsApp.i.black, fontSize: 18),
                    ),
                  ),
                  const SizedBox(height: 16),
                  Observer(
                    builder: (_) {
                      final list = controller.buttonSelected == 0
                          ? controller.tasks!.opened
                          : controller.buttonSelected == 1
                              ? controller.tasks!.confirmed
                              : controller.buttonSelected == 2
                                  ? controller.tasks!.inProgress
                                  : controller.tasks!.finished;

                      return list.isNotEmpty
                          ? Column(
                              children: list
                                  .map(
                                    (tsk) => TaskListTile(
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
                  SizedBox(
                    width: context.percentWidth(.8),
                    child: Text(
                      widget.userController.serviceTaker!.fantasyName,
                      style: context.textStyles.textBold
                          .copyWith(fontSize: 18, color: ColorsApp.i.black),
                      textAlign: TextAlign.center,
                    ),
                  ),
                  const SizedBox(
                    height: 18,
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
