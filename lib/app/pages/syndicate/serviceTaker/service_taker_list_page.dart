import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../controllers/service_taker_list_controller.dart';
import '../../../controllers/user_controller.dart';
import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../core/widgets/dialog_task_options.dart';
import '../../../models/service_taker_model.dart';
import '../../menu/menu_drawer.dart';
import 'register/service_taker_syndicate_register_page.dart';
import 'widgets/service_taker_tile.dart';

class ServiceTakerListPage extends StatefulWidget {
  final UserController userController;
  const ServiceTakerListPage(this.userController, {super.key});

  @override
  State<ServiceTakerListPage> createState() => _ServiceTakerListPageState();
}

class _ServiceTakerListPageState extends State<ServiceTakerListPage>
    with Loader, Messages {
  final ServiceTakerListController controller = ServiceTakerListController();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case ServiceTakerListStateStatus.initial:
            break;
          case ServiceTakerListStateStatus.loading:
            showLoader();
            break;
          case ServiceTakerListStateStatus.loaded:
            hideLoader();
            break;
          case ServiceTakerListStateStatus.saved:
            hideLoader();
            break;
          case ServiceTakerListStateStatus.deleted:
            hideLoader();
            controller.findServiceTaker(widget.userController.syndicate!.user);
            break;
          case ServiceTakerListStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
      controller.findServiceTaker(widget.userController.syndicate!.user);
    });
    super.initState();
  }

  @override
  void dispose() {
    statusDisposer();
    super.dispose();
  }

  Future<void> _optionOpenDialog(ServiceTakerModel model) async {
    return showDialog(
      context: context,
      builder: (context) => DialogTaskOptions(
        model.fantasyName,
        btDownLabel: 'Cancelar',
        btDownTap: () => Navigator.of(context).pop(),
        btLeftLabel: 'Excluir',
        btLeftTap: () async {
          final navigator = Navigator.of(context);
          await controller.delete(model.user.toString());
          navigator.pop();
        },
        btRightLabel: 'Editar',
        btRightTap: () async {
          Navigator.of(context).pop();
          await Navigator.of(context).push(
            MaterialPageRoute(
              builder: (_) =>
                  ServiceTakerSyndicateRegisterPage(serviceTaker: model),
            ),
          );
          controller.findServiceTaker(widget.userController.syndicate!.user);
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
          'Tomadora de Serviços',
          style: context.textStyles.textBold
              .copyWith(color: ColorsApp.i.primary, fontSize: 16),
        ),
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
        actions: [
          IconButton(
            onPressed: () => controller
                .findServiceTaker(widget.userController.syndicate!.user),
            icon: const Icon(Icons.refresh),
          ),
          IconButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ServiceTakerSyndicateRegisterPage(),
                ),
              );
              controller
                  .findServiceTaker(widget.userController.syndicate!.user);
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
            itemCount: controller.serviceTaker.length,
            itemBuilder: (context, index) => ServiceTakerTile(
              controller.serviceTaker[index],
              () => _optionOpenDialog(controller.serviceTaker[index]),
            ),
          ),
        ),
      ),
    );
  }
}
