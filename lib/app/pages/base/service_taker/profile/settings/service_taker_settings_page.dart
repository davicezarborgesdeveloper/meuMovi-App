import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../../../../core/ui/styles/text_styles.dart';
import '../../../../auth/user_controller.dart';
import '../../../worker/profile/widget/option_button_profile.dart';

class ServiceTakerSettingsPage extends StatelessWidget {
  const ServiceTakerSettingsPage({super.key});

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
            await GetIt.I<UserController>().deleteUser();
            await navigator.pushReplacementNamed('/auth/login');
          },
          icon: Icons.info_outline,
          label: 'Encerrar conta na MeuMovi',
        ),
      ),
    );
  }
}
