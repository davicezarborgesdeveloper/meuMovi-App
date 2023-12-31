import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../../../core/ui/helpers/size_extensions.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../auth/user_controller.dart';
import '../../../menu/menu_drawer.dart';
import 'profile_worker_controller.dart';
import 'widget/image_widget.dart';
import 'widget/option_button_profile.dart';

class ProfileWorkerPage extends StatefulWidget {
  final UserController userCtrl;
  const ProfileWorkerPage(this.userCtrl, {super.key});

  @override
  State<ProfileWorkerPage> createState() => _ProfileWorkerPageState();
}

class _ProfileWorkerPageState extends State<ProfileWorkerPage>
    with Loader, Messages {
  // final UserController userCtrl = GetIt.I<UserController>();
  final ProfileWorkerController controller = ProfileWorkerController();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case ProfileWorkerStateStatus.initial:
            break;
          case ProfileWorkerStateStatus.loading:
            showLoader();
            break;
          case ProfileWorkerStateStatus.loaded:
            hideLoader();
            break;
          case ProfileWorkerStateStatus.uploadImage:
            hideLoader();
            break;
          case ProfileWorkerStateStatus.error:
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
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight - context.appbarHeight;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      drawer: const MenuDrawer(),
      body: SizedBox(
        height: screenHeight,
        child: Stack(
          children: [
            Observer(
              builder: (_) {
                return Container(
                  color: Colors.black,
                  width: screenWidth,
                  height: context.screenHeight * .3,
                  child: widget.userCtrl.worker != null
                      ? Column(
                          children: [
                            const SizedBox(height: 8),
                            ImageWidget(
                              (image) async {
                                controller.uploadImage(
                                  image,
                                  widget.userCtrl.worker!.user!,
                                );
                              },
                              controller.urlImage ??
                                  widget.userCtrl.worker!.imageUrl,
                              themeColor: ColorsApp.i.ternary,
                            ),
                            const SizedBox(height: 8),
                            Column(
                              children: [
                                Text(
                                  widget.userCtrl.worker!.fullname,
                                  style:
                                      context.textStyles.textRegular.copyWith(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  widget.userCtrl.worker!.personal.email,
                                  style:
                                      context.textStyles.textSemiBold.copyWith(
                                    fontSize: 14,
                                    color: Colors.white,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        )
                      : Container(),
                );
              },
            ),
            Positioned(
              top: context.screenHeight * .25,
              child: Container(
                width: screenWidth,
                height: (context.screenHeight * .70),
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                ),
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 32),
                  child: Column(
                    children: [
                      OptionButtonProfile(
                        onTap: () => Navigator.of(context)
                            .pushNamed('/home/worker/personalData'),
                        icon: Icons.person_outline_rounded,
                        label: 'Dados pessoais',
                        colorIcon: ColorsApp.i.ternary,
                      ),
                      OptionButtonProfile(
                        onTap: () => Navigator.of(context)
                            .pushNamed('/home/profile/documents'),
                        icon: Icons.description_outlined,
                        label: 'Documentos',
                        colorIcon: ColorsApp.i.ternary,
                      ),
                      OptionButtonProfile(
                        onTap: () => Navigator.of(context)
                            .pushNamed('/home/worker/address'),
                        icon: Icons.location_on_outlined,
                        label: 'Endereço',
                        colorIcon: ColorsApp.i.ternary,
                      ),
                      OptionButtonProfile(
                        onTap: () => Navigator.of(context)
                            .pushNamed('/home/worker/bankData'),
                        icon: Icons.credit_card_outlined,
                        label: 'Conta bancária',
                        colorIcon: ColorsApp.i.ternary,
                      ),
                      OptionButtonProfile(
                        onTap: () => Navigator.of(context)
                            .pushNamed('/home/worker/settings'),
                        icon: Icons.settings_outlined,
                        label: 'Configurações',
                        colorIcon: ColorsApp.i.ternary,
                      ),
                      OptionButtonProfile(
                        onTap: () async {
                          final navigator = Navigator.of(context);
                          await GetIt.I<UserController>().logout();
                          await navigator.pushReplacementNamed('/auth/login');
                        },
                        icon: Icons.logout,
                        label: 'Sair',
                        colorIcon: Colors.red,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
