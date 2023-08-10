import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../controllers/syndicate_signup_controller.dart';
import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../widgets/movi_stepper.dart';
import 'widgets/syndicate_signup_address_page.dart';
import 'widgets/syndicate_signup_initial_data_page.dart';
import 'widgets/syndicate_signup_responsible_contact_page.dart';

class SyndicateSignupPage extends StatefulWidget {
  const SyndicateSignupPage({super.key});

  @override
  State<SyndicateSignupPage> createState() => _SyndicateSignupPageState();
}

class _SyndicateSignupPageState extends State<SyndicateSignupPage>
    with Loader, Messages {
  final SyndicateSignupController controller = SyndicateSignupController();
  late final ReactionDisposer statusDisposer;
  int _index = 0;
  final companyNameEC = TextEditingController();
  final fantasyNameEC = TextEditingController();
  final cnpjEC = TextEditingController();
  final passEC = TextEditingController();
  final retypassEC = TextEditingController();
  final nameEC = TextEditingController();
  final emailEC = TextEditingController();
  final phoneEC = TextEditingController();
  final mobileEC = TextEditingController();
  final zipyEC = TextEditingController();
  final cityEC = TextEditingController();
  final stateEC = TextEditingController();
  final streetEC = TextEditingController();
  final districtEC = TextEditingController();
  final numberEC = TextEditingController();
  final complementEC = TextEditingController();

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
    companyNameEC.dispose();
    fantasyNameEC.dispose();
    cnpjEC.dispose();
    passEC.dispose();
    retypassEC.dispose();
    nameEC.dispose();
    emailEC.dispose();
    phoneEC.dispose();
    mobileEC.dispose();
    zipyEC.dispose();
    cityEC.dispose();
    stateEC.dispose();
    streetEC.dispose();
    districtEC.dispose();
    numberEC.dispose();
    complementEC.dispose();
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
        backgroundColor: Colors.grey[100],
        title: Text(
          'Entidade Sindical',
          style: context.textStyles.textBold
              .copyWith(fontSize: 18, color: ColorsApp.i.primary),
        ),
        automaticallyImplyLeading: false,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          IconButton(
            onPressed: () => Navigator.pop(context),
            icon: const Icon(
              Icons.close,
              color: Colors.red,
            ),
          ),
        ],
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
                      SyndicateSignupInitialDataPage(controller, [
                        companyNameEC,
                        fantasyNameEC,
                        cnpjEC,
                        passEC,
                        retypassEC,
                      ]),
                      SyndicateSignupResponsibleContactPage(controller, [
                        nameEC,
                        emailEC,
                        phoneEC,
                        mobileEC,
                      ]),
                      SyndicateSignupAddressPage(controller, [
                        zipyEC,
                        cityEC,
                        stateEC,
                        streetEC,
                        districtEC,
                        numberEC,
                        complementEC,
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
