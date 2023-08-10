import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../controllers/home_service_taker_controller.dart';
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
import '../task/task_service_taker_register_page.dart';
import 'widgets/task_button.dart';
import 'widgets/task_list_tile.dart';

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

  Future<void> _optionOpenDialog(TaskModel model) async {
    return showDialog(
      context: context,
      builder: (context) => DialogTaskOptions(
        model.descriptionService,
        btDownLabel: 'Enviar para o Sindicato',
        btDownTap: model.access == 1
            ? () async {
                Navigator.of(context).pop();
                await controller.sentSyndicate(
                  model.code!,
                );
                await controller.getTasks(
                  widget.userController.serviceTaker!.user,
                );
              }
            : null,
        btLeftLabel: 'Excluir',
        btLeftTap: model.access == 1
            ? () async {
                final navigator = Navigator.of(context);
                await controller.deleteTask(model.code!);
                navigator.pop();
              }
            : null,
        btRightLabel: 'Editar',
        btRightTap: () async {
          Navigator.of(context).pop();
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) => TaskServiceTakerRegisterPage(task: model),
            ),
          );
          await controller.getTasks(
            widget.userController.serviceTaker!.user,
          );
        },
      ),
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
        title: Text(
          'Tarefas',
          style: context.textStyles.textBold.copyWith(
            color: Colors.grey.shade900,
            fontSize: 16,
          ),
        ),
        backgroundColor: ColorsApp.i.bg,
        iconTheme: IconThemeData(color: ColorsApp.i.secondary),
        actions: [
          IconButton(
            onPressed: () async {
              await controller.getTasks(
                widget.userController.serviceTaker!.user,
              );
            },
            icon: const Icon(Icons.refresh),
          ),
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
                    height: 30,
                  ),
                  Observer(
                    builder: (_) => SizedBox(
                      height: context.percentWidth(.95),
                      child: GridView.count(
                        physics: const NeverScrollableScrollPhysics(),
                        crossAxisSpacing: 16,
                        mainAxisSpacing: 16,
                        crossAxisCount: 2,
                        shrinkWrap: true,
                        children: [
                          TaskButton(
                            label: 'em aberto',
                            numberLabel: controller.selectedDashboard == null
                                ? '0'
                                : controller.tasks!.opened!.items!.length
                                    .toString(),
                            option: 0,
                            selected: controller.buttonSelected,
                            themeColor: ColorsApp.i.secondary,
                            onPressed: () async {
                              controller.setButtonSelected(0);
                              await controller.getTasks(
                                widget.userController.serviceTaker!.user,
                              );
                            },
                          ),
                          TaskButton(
                            label: 'confirmadas',
                            numberLabel: controller.selectedDashboard == null
                                ? '0'
                                : controller.tasks!.confirmed!.items!.length
                                    .toString(),
                            option: 1,
                            selected: controller.buttonSelected,
                            themeColor: ColorsApp.i.secondary,
                            onPressed: () async {
                              controller.setButtonSelected(1);
                              await controller.getTasks(
                                widget.userController.serviceTaker!.user,
                              );
                            },
                          ),
                          TaskButton(
                            label: 'em andamento',
                            numberLabel: controller.selectedDashboard == null
                                ? '0'
                                : controller.tasks!.inProgress!.items!.length
                                    .toString(),
                            option: 2,
                            selected: controller.buttonSelected,
                            themeColor: ColorsApp.i.secondary,
                            onPressed: () async {
                              controller.setButtonSelected(2);
                              await controller.getTasks(
                                widget.userController.serviceTaker!.user,
                              );
                            },
                          ),
                          TaskButton(
                            label: 'finalizadas',
                            numberLabel: controller.selectedDashboard == null
                                ? '0'
                                : controller.tasks!.finished!.items!.length
                                    .toString(),
                            option: 3,
                            selected: controller.buttonSelected,
                            themeColor: ColorsApp.i.secondary,
                            onPressed: () async {
                              controller.setButtonSelected(3);
                              await controller.getTasks(
                                widget.userController.serviceTaker!.user,
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
                          ? 'em aberto'
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
                      return controller.selectedDashboard != null &&
                              controller.selectedDashboard!.items!.isNotEmpty
                          ? Column(
                              children: controller.selectedDashboard!.items!
                                  .map(
                                    (tsk) => TaskListTile(
                                      themeColor: ColorsApp.i.secondary,
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
          Container(
            width: context.screenWidth,
            color: ColorsApp.i.bg,
            padding: const EdgeInsets.symmetric(vertical: 8),
            child: SizedBox(
              width: context.percentWidth(.8),
              child: AutoSizeText(
                widget.userController.serviceTaker!.fantasyName,
                style: context.textStyles.textBold.copyWith(
                  fontSize: 16,
                  color: Colors.grey.shade900,
                ),
                maxFontSize: 28,
                minFontSize: 16,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.center,
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
