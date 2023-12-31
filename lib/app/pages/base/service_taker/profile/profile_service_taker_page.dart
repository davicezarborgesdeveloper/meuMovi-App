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
import '../../worker/profile/widget/image_widget.dart';
import '../../worker/profile/widget/option_button_profile.dart';
import 'profile_service_taker_controller.dart';

class ProfileServiceTakerPage extends StatefulWidget {
  final UserController userCtrl;
  const ProfileServiceTakerPage(this.userCtrl, {super.key});

  @override
  State<ProfileServiceTakerPage> createState() =>
      _ProfileServiceTakerPageState();
}

class _ProfileServiceTakerPageState extends State<ProfileServiceTakerPage>
    with Loader, Messages {
  final ProfileServiceTakerController controller =
      ProfileServiceTakerController();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case ProfileServiceTakerStateStatus.initial:
            break;
          case ProfileServiceTakerStateStatus.loading:
            showLoader();
            break;
          case ProfileServiceTakerStateStatus.loaded:
            hideLoader();
            break;
          case ProfileServiceTakerStateStatus.uploadImage:
            hideLoader();
            break;
          case ProfileServiceTakerStateStatus.error:
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
                  child: widget.userCtrl.serviceTaker != null
                      ? Column(
                          children: [
                            const SizedBox(height: 8),
                            ImageWidget(
                              (image) async {
                                controller.uploadImage(
                                  image,
                                  widget.userCtrl.serviceTaker!.user,
                                );
                              },
                              controller.urlImage ??
                                  widget.userCtrl.serviceTaker!.imageUrl,
                              themeColor: ColorsApp.i.secondary,
                            ),
                            const SizedBox(height: 8),
                            Column(
                              children: [
                                Text(
                                  widget.userCtrl.serviceTaker!.cnpj,
                                  style:
                                      context.textStyles.textRegular.copyWith(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  widget.userCtrl.serviceTaker!.companyName,
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
                            .pushNamed('/home/serviceTaker/data'),
                        icon: Icons.person_outline_rounded,
                        label: 'Editar Dados',
                        colorIcon: ColorsApp.i.secondary,
                      ),
                      OptionButtonProfile(
                        onTap: () => Navigator.of(context)
                            .pushNamed('/home/serviceTaker/settings'),
                        icon: Icons.settings_outlined,
                        label: 'Configurações',
                        colorIcon: ColorsApp.i.secondary,
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
