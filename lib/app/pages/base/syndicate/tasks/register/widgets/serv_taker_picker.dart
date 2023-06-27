import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../../../core/ui/helpers/loader.dart';
import '../../../../../../core/ui/helpers/messages.dart';
import '../../../../../../core/ui/helpers/size_extensions.dart';
import '../../../../../../core/ui/styles/colors_app.dart';
import '../../../../../../core/ui/styles/text_styles.dart';
import '../../../../../../models/task_model.dart';
import '../../../../../auth/auth_controller.dart';
import 'serv_taker_picker_controller.dart';

class ServTakerPicker extends StatefulWidget {
  const ServTakerPicker({super.key});

  @override
  State<ServTakerPicker> createState() => _ServTakerPickerState();
}

class _ServTakerPickerState extends State<ServTakerPicker>
    with Loader, Messages {
  final AuthController authController = GetIt.I<AuthController>();
  final ServTakerPickerController controller = ServTakerPickerController();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case ServTakerPickerStateStatus.initial:
            break;
          case ServTakerPickerStateStatus.loading:
            showLoader();
            break;
          case ServTakerPickerStateStatus.loaded:
            hideLoader();
            break;
          case ServTakerPickerStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
      controller.findServiceTaker(authController.auth!.userId);
    });
    super.initState();
  }

  @override
  void dispose() {
    statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 16),
                  child: Text(
                    'Selecione a tomadora',
                    style: context.textStyles.textBold.copyWith(fontSize: 18),
                  ),
                ),
                IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: const Icon(Icons.close),
                ),
              ],
            ),
          ),
          Container(
            height: context.percentHeight(.3),
            width: context.percentWidth(.65),
            margin: const EdgeInsets.symmetric(vertical: 16),
            child: Observer(
              builder: (_) => ListView.builder(
                itemBuilder: (context, index) => Container(
                  margin: const EdgeInsets.symmetric(vertical: 4),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: ColorsApp.i.primary.withAlpha(100),
                  ),
                  child: ListTile(
                    onTap: () => Navigator.pop(
                      context,
                      ServTakerModel(
                        code: controller.serviceTakerList[index].user,
                        name: controller.serviceTakerList[index].companyName,
                      ),
                    ),
                    title: Text(
                      controller.serviceTakerList[index].companyName,
                      style: context.textStyles.textSemiBold,
                    ),
                    trailing: const Icon(Icons.arrow_forward_ios),
                  ),
                ),
                itemCount: controller.serviceTakerList.length,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
