import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../core/widget/movi_stepper.dart';
import 'widgets/worker_register_address_data.dart';
import 'widgets/worker_register_documents_data.dart';
import 'widgets/worker_register_personal_data.dart';
import 'worker_register_controller.dart';

class WorkerRegisterPage extends StatefulWidget {
  const WorkerRegisterPage({Key? key}) : super(key: key);

  @override
  State<WorkerRegisterPage> createState() => _WorkerRegisterPageState();
}

class _WorkerRegisterPageState extends State<WorkerRegisterPage>
    with Loader, Messages {
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
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/home', (route) => false);
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
        if (controller.isFormValidSignup) {
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
            controller.register();
          };
        }
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          'Trabalhador',
          style: context.textStyles.textBold
              .copyWith(fontSize: 18, color: Colors.black),
        ),
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
      ),
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
                      WorkerSignupPersonalData(controller),
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
