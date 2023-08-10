import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../controllers/syndicate_worker_register_controller.dart';
import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../models/worker_model.dart';
import '../../../auth/signup/widgets/movi_stepper.dart';
import '../../../registerSuccess/register_success_page.dart';
import 'widgets/syndicate_worker_register_address.dart';
import 'widgets/syndicate_worker_register_document.dart';
import 'widgets/syndicate_worker_register_personal.dart';

class SyndicateWorkerRegisterPage extends StatefulWidget {
  final WorkerModel? worker;
  const SyndicateWorkerRegisterPage({this.worker, super.key});

  @override
  State<SyndicateWorkerRegisterPage> createState() =>
      _SyndicateWorkerRegisterPageState();
}

class _SyndicateWorkerRegisterPageState
    extends State<SyndicateWorkerRegisterPage> with Loader, Messages {
  final SyndicateWorkerRegisterController controller =
      SyndicateWorkerRegisterController();
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
    // if (widget.worker != null) {
    //   controller.loadData(widget.worker!);
    // }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) async {
        switch (status) {
          case SyndicateWorkerRegisterStateStatus.initial:
            break;
          case SyndicateWorkerRegisterStateStatus.loading:
            showLoader();
            break;
          case SyndicateWorkerRegisterStateStatus.loaded:
            hideLoader();
            break;
          case SyndicateWorkerRegisterStateStatus.saved:
            hideLoader();
            final navigator = Navigator.of(context);
            hideLoader();
            await showDialog(
              context: context,
              barrierDismissible: false,
              builder: (_) => const RegisterSuccessPage(),
            );
            navigator.pop();
            break;
          case SyndicateWorkerRegisterStateStatus.error:
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
        if (controller.isFormValidPersonal) {
          return () {
            if (_index < 2) {
              setState(() {
                _index += 1;
              });
            }
          };
        }
      case 1:
        if (controller.isFormValidDocuments) {
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
        if (controller.isFormValidAddress) {
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
          child: Observer(
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
                      _index == 2 ? 'Cadastrar' : 'Proximo passo',
                    ),
                  ),
                ),
                steps: [
                  SyndicateWorkerRegisterPersonal(controller, [
                    nameEC,
                    lastnameEC,
                    birthDateEC,
                    phoneEC,
                    emailEC,
                  ]),
                  SyndicateWorkerRegisterDocument(controller, [
                    cpfEC,
                    rgEC,
                    employeeEC,
                  ]),
                  SyndicateWorkerRegisterAddress(controller, [
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
        ),
      ),
    );
  }
}
