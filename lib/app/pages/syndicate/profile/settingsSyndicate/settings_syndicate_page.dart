import 'package:flutter/material.dart';
import 'package:mobx/mobx.dart';

import '../../../../controllers/user_controller.dart';
import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../core/widgets/option_button_profile.dart';

class SettingsSyndicatePage extends StatefulWidget {
  const SettingsSyndicatePage({super.key});

  @override
  State<SettingsSyndicatePage> createState() => _SettingsSyndicatePageState();
}

class _SettingsSyndicatePageState extends State<SettingsSyndicatePage>
    with Loader, Messages {
  final UserController controller = UserController();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case UserStateStatus.initial:
            break;
          case UserStateStatus.loading:
            showLoader();
            break;
          case UserStateStatus.loaded:
            hideLoader();
            break;
          case UserStateStatus.success:
            hideLoader();
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, '/auth/login');
            break;
          case UserStateStatus.error:
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
      appBar: AppBar(
        backgroundColor: Colors.grey[50],
        title: Text(
          'Configurações',
          style:
              context.textStyles.textBold.copyWith(color: ColorsApp.i.primary),
        ),
        iconTheme: IconThemeData(color: ColorsApp.i.primary),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
        child: OptionButtonProfile(
          onTap: () => controller.deleteUser(),
          icon: Icons.info_outline,
          label: 'Encerrar conta na MeuMovi',
          colorIcon: ColorsApp.i.secondary,
        ),
      ),
    );
  }
}
