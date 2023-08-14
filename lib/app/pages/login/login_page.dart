import 'package:brasil_fields/brasil_fields.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:mobx/mobx.dart';

import '../../controllers/login_controller.dart';
import '../../core/ui/helpers/loader.dart';
import '../../core/ui/helpers/messages.dart';
import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_styles.dart';
import '../../core/widgets/logo_widget.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import '../../core/widgets/text_field_widget.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

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
            hideLoader();
            break;
          case LoginStateStatus.loading:
            showLoader();
            break;
          case LoginStateStatus.success:
            hideLoader();
            Navigator.of(context).pushReplacementNamed(
              controller.loginType == 1
                  ? '/home/serviceTaker'
                  : controller.loginType == 2
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 32),
            height: context.screenHeight - context.appbarHeight / 2,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Spacer(),
                const LogoWidget(width: 0.45),
                const Spacer(),
                Column(
                  children: [
                    Observer(
                      builder: (_) => TextFieldWidget(
                        label: 'Usuário',
                        hintText: 'Digite seu usuário',
                        errorText: controller.userLoginError,
                        onChanged: controller.setUserLogin,
                        keyboardType: TextInputType.number,
                        textInputAction: TextInputAction.next,
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
                        textInputAction: TextInputAction.done,
                        onFieldSubmitted: (value) => !controller.isFormValid
                            ? controller.invalidSendPressed()
                            : controller.sendPressed(),
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
                    const SizedBox(height: 16),
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
                    const SizedBox(height: 16),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Não tem uma conta?',
                            style: context.textStyles.textRegular
                                .copyWith(color: Colors.grey[900]),
                          ),
                          TextButton(
                            onPressed: () => Navigator.of(context)
                                .pushNamed('/auth/signup/menu'),
                            child: Text(
                              ' Cadastre-se',
                              style: context.textStyles.textMedium
                                  .copyWith(color: ColorsApp.i.neutralDark),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
