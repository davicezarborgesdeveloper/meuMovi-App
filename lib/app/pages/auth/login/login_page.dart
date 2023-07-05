import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx/mobx.dart';

import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../core/widget/text_field_widget.dart';
import 'login_controller.dart';
import 'widget/logo_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with Loader, Messages {
  final LoginController controller = LoginController();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case LoginStateStatus.initial:
            break;
          case LoginStateStatus.loading:
            showLoader();
            break;
          case LoginStateStatus.success:
            hideLoader();

            Navigator.of(context).pushReplacementNamed(
              controller.loginType == 0
                  ? '/home/serviceTaker'
                  : controller.loginType == 1
                      ? '/home/syndicate'
                      : '/home/worker',
            );
            break;
          case LoginStateStatus.error:
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (_, constraints) {
          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  const LogoWidget(),
                  const SizedBox(
                    height: 40,
                  ),
                  Observer(
                    builder: (_) => TextFieldWidget(
                      label: 'Usuário',
                      hintText: 'Digite seu usuário',
                      errorText: controller.userLoginError,
                      onChanged: controller.setUserLogin,
                      keyboardType: TextInputType.number,
                      inputFormatters: [
                        FilteringTextInputFormatter.digitsOnly,
                        if (controller.userLogin != null &&
                            controller.userLogin!.length >= 14)
                          CnpjInputFormatter()
                        else
                          CpfInputFormatter(),
                      ],
                    ),
                  ),
                  Observer(
                    builder: (_) => TextFieldWidget(
                      label: 'Senha',
                      hintText: 'Digite sua senha',
                      errorText: controller.passwordError,
                      onChanged: controller.setPassword,
                      obscure: true,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Observer(
                            builder: (_) => Checkbox(
                              value: controller.rememberMe,
                              activeColor: ColorsApp.i.neutralDark,
                              onChanged: (value) =>
                                  controller.setRememberMe(value!),
                            ),
                          ),
                          const Text('Lembrar-me'),
                        ],
                      ),
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          'Esqueci minha senha',
                          style: context.textStyles.textRegular
                              .copyWith(color: Colors.grey[900]),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  Observer(
                    builder: (_) => SizedBox(
                      width: double.infinity,
                      height: 50,
                      child: GestureDetector(
                        onTap: controller.invalidSendPressed,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: ColorsApp.i.neutralDark,
                          ),
                          onPressed: controller.sendPressed,
                          child: const Text('Login'),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 32),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RichText(
                      text: TextSpan(
                        text: 'Não tem uma conta?',
                        style: context.textStyles.textRegular
                            .copyWith(color: Colors.grey[900]),
                        children: [
                          TextSpan(
                            text: ' Cadastre-se',
                            style: context.textStyles.textMedium
                                .copyWith(color: ColorsApp.i.neutralDark),
                            recognizer: TapGestureRecognizer()
                              ..onTap = () => Navigator.of(context)
                                  .pushNamed('/auth/signup/menu'),
                          ),
                        ],
                      ),
                    ),
                  )
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
