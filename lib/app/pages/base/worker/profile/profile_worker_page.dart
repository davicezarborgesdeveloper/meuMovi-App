import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../../../core/ui/helpers/size_extensions.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../models/worker_model.dart';
import '../../../auth/auth_controller.dart';
import '../../../auth/user_controller.dart';
import '../../../menu/menu_drawer.dart';
import 'profile_worker_controller.dart';
import 'widget/image_widget.dart';
import 'widget/option_button_profile.dart';

class ProfileWorkerPage extends StatefulWidget {
  const ProfileWorkerPage({super.key});

  @override
  State<ProfileWorkerPage> createState() => _ProfileWorkerPageState();
}

class _ProfileWorkerPageState extends State<ProfileWorkerPage>
    with Loader, Messages {
  final UserController userCtrl = GetIt.I<UserController>();
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
                  child: userCtrl.user != null
                      ? Column(
                          children: [
                            const SizedBox(height: 8),
                            ImageWidget(
                              (image) async {
                                controller.uploadImage(
                                  image,
                                  (userCtrl.user as WorkerModel).user!,
                                );
                              },
                              controller.urlImage ??
                                  (userCtrl.user as WorkerModel).imageUrl,
                            ),
                            const SizedBox(height: 8),
                            Column(
                              children: [
                                Text(
                                  (userCtrl.user as WorkerModel).fullname,
                                  style:
                                      context.textStyles.textRegular.copyWith(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  (userCtrl.user as WorkerModel).personal.email,
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
                      ),
                      OptionButtonProfile(
                        onTap: () => Navigator.of(context)
                            .pushNamed('/home/profile/documents'),
                        icon: Icons.description_outlined,
                        label: 'Documentos',
                      ),
                      OptionButtonProfile(
                        onTap: () => Navigator.of(context)
                            .pushNamed('/home/worker/address'),
                        icon: Icons.location_on_outlined,
                        label: 'Endereço',
                      ),
                      OptionButtonProfile(
                        onTap: () => Navigator.of(context)
                            .pushNamed('/home/worker/bankData'),
                        icon: Icons.credit_card_outlined,
                        label: 'Conta bancária',
                      ),
                      OptionButtonProfile(
                        onTap: () => Navigator.of(context)
                            .pushNamed('/home/worker/settings'),
                        icon: Icons.settings_outlined,
                        label: 'Configurações',
                      ),
                      OptionButtonProfile(
                        onTap: () async {
                          final navigator = Navigator.of(context);
                          await GetIt.I<AuthController>().logout();
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
