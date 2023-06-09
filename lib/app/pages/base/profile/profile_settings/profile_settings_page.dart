import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/ui/styles/text_styles.dart';
import '../../../auth/auth_controller.dart';
import '../widget/option_button_profile.dart';

class ProfileSettingsPage extends StatelessWidget {
  const ProfileSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey[300],
        title: Text(
          'Configurações',
          style: context.textStyles.textBold.copyWith(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: OptionButtonProfile(
          onTap: () async {
            final navigator = Navigator.of(context);
            await navigator.pushReplacementNamed('/auth/login');
            await GetIt.I<AuthController>().deleteUser();
          },
          icon: Icons.info_outline,
          label: 'Encerrar conta na MeuMovi',
        ),
      ),
    );
  }
}
