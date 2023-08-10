import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../controllers/profile_worker_controller.dart';
import '../../../controllers/user_controller.dart';
import '../../../core/ui/helpers/loader.dart';
import '../../../core/ui/helpers/messages.dart';
import '../../../core/ui/helpers/size_extensions.dart';
import '../../../core/ui/styles/colors_app.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../../core/widgets/image_widget.dart';
import '../../../core/widgets/option_button_profile.dart';
import '../../menu/menu_drawer.dart';
import 'addressData/profile_worker_address_data_page.dart';
import 'bankAccount/profile_worker_bank_account_page.dart';
import 'personalData/profile_worker_personal_data_page.dart';
import 'workerDocuments/profile_worker_documents_page.dart';

class ProfileWorkerPage extends StatefulWidget {
  final UserController userController;
  const ProfileWorkerPage(this.userController, {super.key});

  @override
  State<ProfileWorkerPage> createState() => _ProfileWorkerPageState();
}

class _ProfileWorkerPageState extends State<ProfileWorkerPage>
    with Loader, Messages {
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
                  child: widget.userController.worker != null
                      ? Column(
                          children: [
                            ImageWidget(
                              (image) async {
                                controller.uploadImage(
                                  image,
                                  widget.userController.worker!.user!,
                                );
                              },
                              controller.urlImage ??
                                  widget.userController.worker!.imageUrl,
                              themeColor: ColorsApp.i.ternary,
                            ),
                            const SizedBox(height: 4),
                            Column(
                              children: [
                                Text(
                                  widget.userController.worker!.fullname,
                                  style:
                                      context.textStyles.textRegular.copyWith(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  widget.userController.worker!.personal.email,
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
              top: context.screenHeight * .24,
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
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 16),
                  child: Column(
                    children: [
                      OptionButtonProfile(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ProfileWorkerPersonalDataPage(
                              widget.userController.worker,
                            ),
                          ),
                        ),
                        icon: Icons.person_outline_rounded,
                        label: 'Dados pessoais',
                        colorIcon: ColorsApp.i.ternary,
                      ),
                      OptionButtonProfile(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ProfileWorkerDocumentsPage(
                              widget.userController.worker!,
                            ),
                          ),
                        ),
                        icon: Icons.description_outlined,
                        label: 'Documentos',
                        colorIcon: ColorsApp.i.ternary,
                      ),
                      OptionButtonProfile(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ProfileWorkerAddressDataPage(
                              widget.userController.worker!,
                            ),
                          ),
                        ),
                        icon: Icons.location_on_outlined,
                        label: 'Endereço',
                        colorIcon: ColorsApp.i.ternary,
                      ),
                      OptionButtonProfile(
                        onTap: () => Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => ProfileWorkerBankAccountPage(
                              widget.userController.worker!,
                            ),
                          ),
                        ),
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
