import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../core/widget/movi_stepper.dart';
import '../../../../core/widget/register_success.dart';
import '../../../auth/signup/workerRegister/widgets/worker_register_address_data.dart';
import '../../../auth/signup/workerRegister/widgets/worker_register_documents_data.dart';
import '../../../auth/signup/workerRegister/worker_register_controller.dart';
import '../../../menu/menu_drawer.dart';
import 'widgets/worker_register_personal_data.dart';

class WorkerSyndicateRegisterPage extends StatefulWidget {
  const WorkerSyndicateRegisterPage({super.key});

  @override
  State<WorkerSyndicateRegisterPage> createState() =>
      _WorkerSyndicateRegisterPageState();
}

class _WorkerSyndicateRegisterPageState
    extends State<WorkerSyndicateRegisterPage> with Loader, Messages {
  final WorkerRegisterController controller = WorkerRegisterController();
  late final ReactionDisposer statusDisposer;
  int _index = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case WorkerRegisterStateStatus.initial:
            break;
          case WorkerRegisterStateStatus.loading:
            showLoader();
            break;
          case WorkerRegisterStateStatus.loaded:
            hideLoader();
            break;
          case WorkerRegisterStateStatus.saved:
            hideLoader();
            showDialog(
              context: context,
              builder: (_) => const RegisterSuccess(),
            );
            break;
          case WorkerRegisterStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    statusDisposer();
    super.dispose();
  }

  dynamic get nextForm {
    switch (_index) {
      case 0:
        if (controller.isFormValidRegister) {
          return () {
            if (_index < 2) {
              setState(() {
                _index += 1;
              });
            }
          };
        }
      case 1:
        if (controller.isFormValid2) {
          return () {
            if (_index < 2) {
              setState(() {
                _index += 1;
              });
            }
          };
        }
        break;
      default:
        if (controller.isFormValid3) {
          return () {
            controller.setDefaultPassword();
          };
        }
    }
    return null;
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
      ),
      drawer: const MenuDrawer(),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Observer(
                builder: (_) {
                  return MoviStepper(
                    currentStep: _index,
                    buttonCancel: _index != 0
                        ? OutlinedButton(
                            onPressed: () {
                              if (_index > 0) {
                                setState(() {
                                  _index -= 1;
                                });
                              }
                            },
                            style: OutlinedButton.styleFrom(
                              side: const BorderSide(color: Colors.red),
                            ),
                            child: Text(
                              'voltar',
                              style: context.textStyles.textBold
                                  .copyWith(color: Colors.red),
                            ),
                          )
                        : null,
                    buttonContinue: GestureDetector(
                      onTap: controller.invalidSendPressed,
                      child: ElevatedButton(
                        onPressed: nextForm,
                        child: Text(
                          _index == 2 ? 'Confirmar cadastro' : 'Proximo passo',
                        ),
                      ),
                    ),
                    steps: [
                      WorkerRegisterPersonalData(controller),
                      WorkerRegisterDocumentsData(controller),
                      WorkerRegisterAddressData(controller),
                    ],
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
