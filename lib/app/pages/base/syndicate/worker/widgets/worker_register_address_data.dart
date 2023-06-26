import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

import '../../../../../core/ui/helpers/size_extensions.dart';
import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../../core/widget/text_field_changed_widget.dart';
import '../../../../../core/widget/text_field_widget.dart';
import '../register/worker_syndicate_register_controller.dart';

class WorkerRegisterAddressData extends StatefulWidget {
  final WorkerSyndicateRegisterController controller;
  final List<TextEditingController> textControllers;
  const WorkerRegisterAddressData(
    this.controller,
    this.textControllers, {
    Key? key,
  }) : super(key: key);

  @override
  State<WorkerRegisterAddressData> createState() =>
      _WorkerRegisterAddressDataState();
}

class _WorkerRegisterAddressDataState extends State<WorkerRegisterAddressData> {
  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                'Informe seu endereço',
                style: context.textStyles.textBold,
              ),
              const SizedBox(height: 12),
              Text(
                'Para finalizar, informe o seu endereço',
                style: context.textStyles.textRegular
                    .copyWith(color: Colors.grey.shade700),
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
        Observer(
          builder: (_) => TextFieldWidget(
            label: 'CEP',
            hintText: 'Digite seu CEP',
            errorText: widget.controller.zipError,
            onChanged: (value) async {
              widget.controller.setZip(value);
              if (value.length >= 10) {
                await widget.controller.searchZip(value);
                widget.textControllers[1].text = widget.controller.city!;
                widget.textControllers[2].text = widget.controller.state!;
                widget.textControllers[3].text = widget.controller.street!;
                widget.textControllers[4].text = widget.controller.district!;
              }
            },
            initialValue: widget.controller.zip,
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
              controller: widget.textControllers[1],
              label: 'Cidade',
              hintText: 'Cidade',
              readOnly: true,
              initialValue: widget.controller.city,
              onChanged: widget.controller.setCity,
            );
          },
        ),
        Observer(
          builder: (_) {
            return TextFieldChangedWidget(
              controller: widget.textControllers[2],
              label: 'Estado',
              hintText: 'Estado',
              readOnly: true,
              initialValue: widget.controller.state,
              onChanged: widget.controller.setState,
            );
          },
        ),
        Observer(
          builder: (_) {
            return TextFieldChangedWidget(
              controller: widget.textControllers[3],
              label: 'Rua',
              hintText: 'Digite o nome da sua rua',
              readOnly: false,
              initialValue: widget.controller.street,
              onChanged: widget.controller.setStreet,
            );
          },
        ),
        Observer(
          builder: (_) {
            return TextFieldChangedWidget(
              controller: widget.textControllers[4],
              label: 'Bairro',
              hintText: 'Digite o nome do seu bairro',
              readOnly: false,
              initialValue: widget.controller.district,
              onChanged: widget.controller.setDistrict,
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
                      controller: widget.textControllers[5],
                      onChanged: widget.controller.setNumber,
                      decoration: const InputDecoration(hintText: 'Número'),
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
                      controller: widget.textControllers[6],
                      onChanged: widget.controller.setComplement,
                      decoration:
                          const InputDecoration(hintText: 'Bloco, apto...'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
        Observer(
          builder: (_) => TextFieldWidget(
            controller: widget.textControllers[7],
            label: 'Ponto de referência',
            hintText: 'Digite um ponto de referência',
            onChanged: widget.controller.setReferencePoint,
            initialValue: widget.controller.referencePoint,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 16, bottom: 32),
          child: Row(
            children: [
              Observer(
                builder: (_) => Checkbox(
                  value: widget.controller.termsAccepted,
                  onChanged: (value) =>
                      widget.controller.setTermsAccepted(value!),
                ),
              ),
              SizedBox(
                width: context.percentWidth(.78),
                child: RichText(
                  softWrap: true,
                  text: TextSpan(
                    text: '',
                    style: context.textStyles.textRegular
                        .copyWith(color: Colors.grey[900]),
                    children: [
                      TextSpan(
                        text: 'Termo de uso ',
                        style: context.textStyles.textRegular
                            .copyWith(color: ColorsApp.i.secondary),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () => Navigator.of(context)
                              .pushNamed('/auth/signup/termsUse'),
                      ),
                      const TextSpan(
                        text:
                            'Eu li e aceito as condições de uso, as políticas de privacidade, políticas de cookies e sou maior de 18 anos.',
                      )
                    ],
                  ),
                ),
              ),
              // Text(
              //     'Termo de uso Eu li e aceito as condições de uso, as políticas de privacidade, políticas de cookies e sou maior de 18 anos.')
            ],
          ),
        ),
      ],
    );
  }
}
