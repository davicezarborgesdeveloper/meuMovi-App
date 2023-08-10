import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../../../controllers/syndicate/syndicate_worker_address_controller.dart';
import '../../../../../core/ui/helpers/loader.dart';
import '../../../../../core/ui/helpers/messages.dart';
import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../core/widgets/text_field_changed_widget.dart';
import '../../../../../core/widgets/text_field_widget.dart';
import '../../../../../models/worker_model.dart';

class AddressDataPage extends StatefulWidget {
  final WorkerModel? worker;
  const AddressDataPage({this.worker, super.key});

  @override
  State<AddressDataPage> createState() => _AddressDataPageState();
}

class _AddressDataPageState extends State<AddressDataPage>
    with Loader, Messages {
  final SyndicateWorkerAddressController controller =
      SyndicateWorkerAddressController();
  late final ReactionDisposer statusDisposer;
  final zipEC = TextEditingController();
  final cityEC = TextEditingController();
  final stateEC = TextEditingController();
  final streetEC = TextEditingController();
  final districtEC = TextEditingController();
  final numberEC = TextEditingController();
  final complementEC = TextEditingController();

  @override
  void initState() {
    controller.getData(widget.worker!);
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case SyndicateWorkerAddressStateStatus.initial:
            break;
          case SyndicateWorkerAddressStateStatus.loading:
            showLoader();
            break;
          case SyndicateWorkerAddressStateStatus.loaded:
            hideLoader();
            break;
          case SyndicateWorkerAddressStateStatus.saved:
            hideLoader();
            Navigator.pop(context, controller.workerModel);
            break;
          case SyndicateWorkerAddressStateStatus.error:
            hideLoader();
            showError(controller.errorMessage ?? 'Erro');
            break;
        }
      });
    });
    numberEC.text = controller.number!;
    complementEC.text = controller.complement!;
    super.initState();
  }

  @override
  void dispose() {
    zipEC.dispose();
    cityEC.dispose();
    stateEC.dispose();
    streetEC.dispose();
    districtEC.dispose();
    numberEC.dispose();
    complementEC.dispose();
    statusDisposer();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        title: Text(
          'Endereço',
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
                builder: (_) => TextFieldWidget(
                  controller: zipEC,
                  label: 'CEP',
                  hintText: 'Digite seu CEP',
                  errorText: controller.zipError,
                  onChanged: (value) async {
                    controller.setZip(value);
                    if (value.length >= 10) {
                      await controller.searchZip(value);
                      cityEC.text = controller.city!;
                      stateEC.text = controller.state!;
                      streetEC.text = controller.street!;
                      districtEC.text = controller.district!;
                    }
                  },
                  initialValue: controller.zip,
                  keyboardType: TextInputType.number,
                  inputFormatters: [
                    FilteringTextInputFormatter.digitsOnly,
                    CepInputFormatter(),
                  ],
                ),
              ),
              Observer(
                builder: (_) {
                  return TextFieldChangedWidget(
                    controller: cityEC,
                    label: 'Cidade',
                    hintText: 'Cidade',
                    readOnly: true,
                    initialValue: controller.city,
                    onChanged: controller.setCity,
                  );
                },
              ),
              Observer(
                builder: (_) {
                  return TextFieldChangedWidget(
                    controller: stateEC,
                    label: 'Estado',
                    hintText: 'Estado',
                    readOnly: true,
                    initialValue: controller.state,
                    onChanged: controller.setState,
                  );
                },
              ),
              Observer(
                builder: (_) {
                  return TextFieldChangedWidget(
                    controller: streetEC,
                    label: 'Rua',
                    hintText: 'Digite o nome da sua rua',
                    readOnly: false,
                    initialValue: controller.street,
                    onChanged: controller.setStreet,
                  );
                },
              ),
              Observer(
                builder: (_) {
                  return TextFieldChangedWidget(
                    controller: districtEC,
                    label: 'Bairro',
                    hintText: 'Digite o nome do seu bairro',
                    readOnly: false,
                    initialValue: controller.district,
                    onChanged: controller.setDistrict,
                  );
                },
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 8, 8, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Número',
                            style: context.textStyles.textBold,
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: numberEC,
                            onChanged: controller.setNumber,
                            decoration:
                                const InputDecoration(hintText: 'Número'),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(8, 8, 0, 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Complemento',
                            style: context.textStyles.textBold,
                          ),
                          const SizedBox(height: 8),
                          TextFormField(
                            controller: complementEC,
                            onChanged: controller.setComplement,
                            decoration: const InputDecoration(
                              hintText: 'Bloco, apto...',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(
                height: 16,
              ),
              Observer(
                builder: (_) => SizedBox(
                  width: double.infinity,
                  height: 50,
                  child: GestureDetector(
                    onTap: controller.invalidSendPressed,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: ColorsApp.i.primary,
                      ),
                      onPressed: controller.sendPressed,
                      child: const Text(
                        'Salvar Informações',
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
