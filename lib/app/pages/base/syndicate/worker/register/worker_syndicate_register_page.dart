import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../../core/ui/helpers/loader.dart';
import '../../../../../core/ui/helpers/messages.dart';
import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../core/widget/movi_stepper.dart';
import '../../../../../core/widget/register_success.dart';
import '../../../../../models/worker_model.dart';
import '../widgets/worker_register_address_data.dart';
import '../widgets/worker_register_documents_data.dart';
import '../widgets/worker_register_personal_data.dart';
import 'worker_syndicate_register_controller.dart';

class WorkerSyndicateRegisterPage extends StatefulWidget {
  final WorkerModel? worker;
  const WorkerSyndicateRegisterPage({this.worker, super.key});

  @override
  State<WorkerSyndicateRegisterPage> createState() =>
      _WorkerSyndicateRegisterPageState();
}

class _WorkerSyndicateRegisterPageState
    extends State<WorkerSyndicateRegisterPage> with Loader, Messages {
  final WorkerSyndicateRegisterController controller =
      WorkerSyndicateRegisterController();
  late final ReactionDisposer statusDisposer;
  int _index = 0;
  final nameEC = TextEditingController();
  final lastnameEC = TextEditingController();
  final birthDateEC = TextEditingController();
  final phoneEC = TextEditingController();
  final emailEC = TextEditingController();
  final cpfEC = TextEditingController();
  final rgEC = TextEditingController();
  final employeeEC = TextEditingController();
  final zipEC = TextEditingController();
  final cityEC = TextEditingController();
  final stateEC = TextEditingController();
  final streetEC = TextEditingController();
  final districtEC = TextEditingController();
  final numberEC = TextEditingController();
  final complentEC = TextEditingController();
  final referencePointEC = TextEditingController();

  @override
  void initState() {
    if (widget.worker != null) {
      controller.loadData(widget.worker!);
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case WorkerSyndicateRegisterStateStatus.initial:
            break;
          case WorkerSyndicateRegisterStateStatus.loading:
            showLoader();
            break;
          case WorkerSyndicateRegisterStateStatus.loaded:
            hideLoader();
            break;
          case WorkerSyndicateRegisterStateStatus.saved:
            hideLoader();
            final navigator = Navigator.of(context);
            hideLoader();
            await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const RegisterSuccess(),
            );
            navigator.pop();
            break;
          case WorkerSyndicateRegisterStateStatus.error:
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
    nameEC.dispose();
    lastnameEC.dispose();
    birthDateEC.dispose();
    emailEC.dispose();
    cpfEC.dispose();
    rgEC.dispose();
    phoneEC.dispose();
    employeeEC.dispose();
    zipEC.dispose();
    cityEC.dispose();
    stateEC.dispose();
    streetEC.dispose();
    districtEC.dispose();
    numberEC.dispose();
    complentEC.dispose();
    referencePointEC.dispose();
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
                      WorkerRegisterPersonalData(controller, [
                        nameEC,
                        lastnameEC,
                        birthDateEC,
                        phoneEC,
                        emailEC,
                      ]),
                      WorkerRegisterDocumentsData(controller, [
                        cpfEC,
                        rgEC,
                        employeeEC,
                      ]),
                      WorkerRegisterAddressData(controller, [
                        zipEC,
                        cityEC,
                        stateEC,
                        streetEC,
                        districtEC,
                        numberEC,
                        complentEC,
                        referencePointEC,
                      ]),
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
