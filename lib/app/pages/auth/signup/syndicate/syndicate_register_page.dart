import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../core/widget/movi_stepper.dart';
import 'syndicate_register_controller.dart';
import 'widgets/syndicate_register_address_page.dart';
import 'widgets/syndicate_register_initial_data_page.dart';
import 'widgets/syndicate_register_responsible_contact_page.dart';

class SyndicateRegisterPage extends StatefulWidget {
  const SyndicateRegisterPage({super.key});

  @override
  State<SyndicateRegisterPage> createState() => _SyndicateRegisterPageState();
}

class _SyndicateRegisterPageState extends State<SyndicateRegisterPage>
    with Loader, Messages {
  final SyndicateRegisterController controller = SyndicateRegisterController();
  late final ReactionDisposer statusDisposer;
  int _index = 0;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case SyndicateRegisterStateStatus.initial:
            break;
          case SyndicateRegisterStateStatus.loading:
            showLoader();
            break;
          case SyndicateRegisterStateStatus.loaded:
            hideLoader();
            break;
          case SyndicateRegisterStateStatus.saved:
            hideLoader();
            Navigator.of(context)
                .pushNamedAndRemoveUntil('/home/syndicate', (route) => false);
            break;
          case SyndicateRegisterStateStatus.error:
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
        if (controller.isFormValidInicialData) {
          return () {
            if (_index < 2) {
              setState(() {
                _index += 1;
              });
            }
          };
        }
      case 1:
        if (controller.isFormValidResponsibleContact) {
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
        backgroundColor: Colors.grey[300],
        title: Text(
          'Entidade Sindical',
          style: context.textStyles.textBold
              .copyWith(fontSize: 18, color: ColorsApp.i.primary),
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
                        style: ElevatedButton.styleFrom(
                          backgroundColor: ColorsApp.i.primary,
                        ),
                        onPressed: nextForm,
                        child: Text(
                          _index == 2 ? 'Confirmar cadastro' : 'Proximo passo',
                        ),
                      ),
                    ),
                    steps: [
                      SyndicateRegisterInitialDataPage(controller),
                      SyndicateRegisterResponsibleContactPage(controller),
                      SyndicateRegisterAddressPage(controller),
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
