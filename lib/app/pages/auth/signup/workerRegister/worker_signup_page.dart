import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../core/widget/movi_stepper.dart';
import 'widgets/worker_signup_address_data.dart';
import 'widgets/worker_signup_documents_data.dart';
import 'widgets/worker_signup_personal_data.dart';
import 'worker_signup_controller.dart';

class WorkerSignupPage extends StatefulWidget {
  const WorkerSignupPage({Key? key}) : super(key: key);

  @override
  State<WorkerSignupPage> createState() => _WorkerSignupPageState();
}

class _WorkerSignupPageState extends State<WorkerSignupPage>
    with Loader, Messages {
  final WorkerSignupController controller = WorkerSignupController();
  late final ReactionDisposer statusDisposer;
  int _index = 0;
  final nameEC = TextEditingController();
  final lastnameEC = TextEditingController();
  final birthDateEC = TextEditingController();
  final emailEC = TextEditingController();
  final phoneEC = TextEditingController();
  final passEC = TextEditingController();
  final repassEC = TextEditingController();
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
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case WorkerSignupStateStatus.initial:
            break;
          case WorkerSignupStateStatus.loading:
            showLoader();
            break;
          case WorkerSignupStateStatus.loaded:
            hideLoader();
            break;
          case WorkerSignupStateStatus.saved:
            hideLoader();
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/home/worker', (route) => false);
            break;
          case WorkerSignupStateStatus.error:
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
    passEC.dispose();
    repassEC.dispose();
    cpfEC.dispose();
    rgEC.dispose();
    employeeEC.dispose();
    zipEC.dispose();
    cityEC.dispose();
    stateEC.dispose();
    phoneEC.dispose();
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
              .copyWith(fontSize: 18, color: ColorsApp.i.ternary),
        ),
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorsApp.i.ternary),
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsApp.i.ternary,
                        ),
                        child: Text(
                          _index == 2 ? 'Confirmar cadastro' : 'Proximo passo',
                        ),
                      ),
                    ),
                    steps: [
                      WorkerSignupPersonalData(controller, [
                        nameEC,
                        lastnameEC,
                        birthDateEC,
                        phoneEC,
                        emailEC,
                        passEC,
                        repassEC,
                      ]),
                      WorkerSignupDocumentsData(controller, [
                        cpfEC,
                        rgEC,
                        employeeEC,
                      ]),
                      WorkerSignupAddressData(controller, [
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
