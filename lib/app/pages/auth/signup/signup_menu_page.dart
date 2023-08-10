import 'package:flutter/material.dart';

import '../../../core/ui/helpers/size_extensions.dart';
import '../../../core/ui/styles/colors_app.dart';
import '../../../core/widgets/logo_widget.dart';
import 'widgets/signup_menu_button.dart';

class SignupMenuPage extends StatelessWidget {
  const SignupMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    final double height = context.screenHeight - context.appbarHeight;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
          height: height,
          child: Column(
            children: [
              const Spacer(),
              const LogoWidget(width: 0.32),
              const Spacer(),
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
                              'Solicite um trabalhador avulso sindicalizado e formal',
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
