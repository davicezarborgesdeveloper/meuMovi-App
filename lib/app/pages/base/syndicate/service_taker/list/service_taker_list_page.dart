import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/ui/helpers/loader.dart';
import '../../../../../core/ui/helpers/messages.dart';
import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../models/service_taker_model.dart';
import '../../../../auth/user_controller.dart';
import '../../../../menu/menu_drawer.dart';
import '../register/service_taker_syndicate_register_page.dart';
import 'service_Taker_tile.dart';
import 'service_taker_list_controller.dart';

class ServiceTakerListPage extends StatefulWidget {
  final UserController userCtrl;
  const ServiceTakerListPage(this.userCtrl, {super.key});

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
            controller.findServiceTaker(widget.userCtrl.syndicate!.user);
            break;
          case ServiceTakerListStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
      controller.findServiceTaker(widget.userCtrl.syndicate!.user);
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
                    builder: (_) =>
                        ServiceTakerSyndicateRegisterPage(serviceTaker: model),
                  ),
                );
                controller.findServiceTaker(widget.userCtrl.syndicate!.user);
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
          'Tomadoras de Serviços',
          style:
              context.textStyles.textBold.copyWith(color: ColorsApp.i.primary),
        ),
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
        actions: [
          IconButton(
            onPressed: () async {
              await Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (_) => const ServiceTakerSyndicateRegisterPage(),
                ),
              );
              controller.findServiceTaker(widget.userCtrl.syndicate!.user);
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
