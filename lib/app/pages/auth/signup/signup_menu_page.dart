import 'package:flutter/material.dart';

import '../../../core/ui/helpers/size_extensions.dart';
import '../../../core/ui/styles/colors_app.dart';
import '../login/widget/logo_widget.dart';
import 'widget/signup_menu_button.dart';

class SignupMenuPage extends StatelessWidget {
  const SignupMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 32),
          child: Column(
            children: [
              LogoWidget(
                width: context.percentWidth(.32),
              ),
              const SizedBox(
                height: 24,
              ),
              SizedBox(
                height: context.percentHeight(.55),
                child: LayoutBuilder(
                  builder: (context, constraints) {
                    final height = constraints.maxHeight * .3;
                    final width = constraints.maxWidth;
                    return Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        SignupMenuButton(
                          icon: Icons.factory_outlined,
                          title: 'ENTIDADE SINDICAL',
                          description:
                              'Gerencie de forma ágil e inteligente a intermediação de serviços avulsos',
                          onTap: () => Navigator.of(context)
                              .pushNamed('/auth/signup/syndicate'),
                          height: height,
                          width: width,
                          color: ColorsApp.i.primary,
                        ),
                        SignupMenuButton(
                          icon: Icons.business_outlined,
                          title: 'TOMADORA DE SERVIÇOS',
                          description:
                              'Solicite um trabalhador avulson sindicalizado e formal',
                          onTap: () => Navigator.of(context)
                              .pushNamed('/auth/signup/serviceTaker'),
                          height: height,
                          width: width,
                          color: ColorsApp.i.secondary,
                        ),
                        SignupMenuButton(
                          icon: Icons.engineering,
                          title: 'TRABALHADOR',
                          description:
                              'Tenha mais oportunidades de trabalho sendo vinculado a um sindicato',
                          onTap: () => Navigator.of(context)
                              .pushNamed('/auth/signup/worker'),
                          height: height,
                          width: width,
                          color: ColorsApp.i.ternary,
                        ),
                      ],
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
