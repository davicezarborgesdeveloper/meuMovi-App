import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../controllers/home_worker_controller.dart';
import '../../../controllers/user_controller.dart';
import '../../../core/extensions/formatter_extensions.dart';
import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../core/ui/helpers/size_extensions.dart';
import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../models/task_model.dart';
import '../../menu/menu_drawer.dart';
import '../../serviceTaker/home/widgets/task_button.dart';
import '../../serviceTaker/home/widgets/task_list_tile.dart';

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
      );
    });
    super.initState();
  }

  @override
  void dispose() {
    statusDisposer();
    super.dispose();
  }

  Future<void> _optionOpenDialog(TaskModel model) async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorsApp.i.bg,
        title: Text(
          'Tarefas',
          style: context.textStyles.textBold
              .copyWith(fontSize: 18, color: ColorsApp.i.ternary),
        ),
        actions: [
          IconButton(
            onPressed: () async {
              await controller.getTasks(
                widget.userController.worker!.documents.employeer!.code,
              );
            },
            icon: const Icon(Icons.refresh),
          )
        ],
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
                    height: 40,
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
                            label: 'disponíveis',
                            numberLabel: controller.selectedDashboard == null
                                ? '0'
                                : controller.tasks!.available!.items!.length
                                    .toString(),
                            option: 0,
                            selected: controller.buttonSelected,
                            themeColor: ColorsApp.i.ternaryLight,
                            onPressed: () async {
                              controller.setButtonSelected(0);
                              await controller.getTasks(
                                widget.userController.worker!.user,
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
                            themeColor: ColorsApp.i.ternaryLight,
                            onPressed: () async {
                              controller.setButtonSelected(1);
                              await controller.getTasks(
                                widget.userController.worker!.user,
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
                            themeColor: ColorsApp.i.ternaryLight,
                            onPressed: () async {
                              controller.setButtonSelected(2);
                              await controller.getTasks(
                                widget.userController.worker!.user,
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
                            themeColor: ColorsApp.i.ternaryLight,
                            onPressed: () async {
                              controller.setButtonSelected(3);
                              await controller.getTasks(
                                widget.userController.worker!.user,
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
                          ? 'disponíveis'
                          : controller.buttonSelected == 1
                              ? 'Confirmadas'
                              : controller.buttonSelected == 2
                                  ? 'Em Andamento'
                                  : 'Finalizadas',
                      style: context.textStyles.textExtraBold.copyWith(
                        color: ColorsApp.i.ternary,
                        fontSize: 18,
                      ),
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
                                  'não há tarefas ${controller.buttonSelected == 0 ? 'disponíveis' : controller.buttonSelected == 1 ? 'Confirmadas' : controller.buttonSelected == 2 ? 'Em Andamento' : 'Finalizadas'}',
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
            padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            color: ColorsApp.i.bg,
            child: SizedBox(
              width: context.percentHeight(.8),
              child: AutoSizeText(
                'Olá, ${widget.userController.worker != null ? widget.userController.worker!.fullname : ''}',
                style: context.textStyles.textBold.copyWith(
                  fontSize: 16,
                  color: ColorsApp.i.ternary,
                ),
                maxFontSize: 28,
                minFontSize: 16,
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                textAlign: TextAlign.left,
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Material(
              elevation: 4,
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
                      style: context.textStyles.textBold.copyWith(
                        fontSize: 16,
                        color: ColorsApp.i.ternaryDark,
                      ),
                    ),
                    Observer(
                      builder: (_) {
                        return Text(
                          controller.selectedDashboard != null
                              ? controller
                                  .selectedDashboard!.amount!.currencyPTBR
                              : 0.0.currencyPTBR,
                          style: context.textStyles.textExtraBold.copyWith(
                            fontSize: 18,
                            color: ColorsApp.i.ternaryDark,
                          ),
                        );
                      },
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
