import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../controllers/employeer_picker_controller.dart';
import '../../models/task_model.dart';
import '../ui/helpers/loader.dart';
import '../ui/helpers/messages.dart';
import '../ui/helpers/size_extensions.dart';
import '../ui/styles/colors_app.dart';
import '../ui/styles/text_styles.dart';

class ServiceTakerPicker extends StatefulWidget {
  final String? syndicate;
  const ServiceTakerPicker({this.syndicate, super.key});

  @override
  State<ServiceTakerPicker> createState() => _ServiceTakerPickerState();
}

class _ServiceTakerPickerState extends State<ServiceTakerPicker>
    with Loader, Messages {
  final EmployeerPickerController controller = EmployeerPickerController();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case EmployeerPickerStateStatus.initial:
            break;
          case EmployeerPickerStateStatus.loading:
            showLoader();
            break;
          case EmployeerPickerStateStatus.loaded:
            hideLoader();
            break;
          case EmployeerPickerStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
      await controller.findServiceTaker(widget.syndicate!);
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
                Container(
                  width: context.percentWidth(.6),
                  padding: const EdgeInsets.only(left: 16),
                  child: AutoSizeText(
                    'Selecione a empregadora',
                    style: context.textStyles.textBold.copyWith(fontSize: 20),
                    overflow: TextOverflow.ellipsis,
                    maxFontSize: 20,
                    minFontSize: 14,
                    maxLines: 1,
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
                  // child: Text(index.toString()),
                  child: ListTile(
                    onTap: () => Navigator.pop(
                      context,
                      ServTakerModel(
                        code: controller.serviceTakerList[index].user,
                        name: controller.serviceTakerList[index].fantasyName,
                      ),
                    ),
                    title: Text(
                      controller.serviceTakerList[index].fantasyName,
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
