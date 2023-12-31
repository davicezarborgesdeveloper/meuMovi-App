import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../../core/extensions/formatter_extensions.dart';
import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../../../core/ui/helpers/size_extensions.dart';
import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../auth/user_controller.dart';
import '../../../menu/menu_drawer.dart';
import '../../worker/profile/widget/image_widget.dart';
import '../../worker/profile/widget/option_button_profile.dart';
import 'profile_syndicate_controller.dart';

class ProfileSyndicatePage extends StatefulWidget {
  final UserController userCtrl;
  const ProfileSyndicatePage(this.userCtrl, {super.key});

  @override
  State<ProfileSyndicatePage> createState() => _ProfileSyndicatePageState();
}

class _ProfileSyndicatePageState extends State<ProfileSyndicatePage>
    with Loader, Messages {
  final ProfileSyndicateController controller = ProfileSyndicateController();
  late final ReactionDisposer statusDisposer;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      statusDisposer = reaction((_) => controller.status, (status) {
        switch (status) {
          case ProfileSyndicateStateStatus.initial:
            break;
          case ProfileSyndicateStateStatus.loading:
            showLoader();
            break;
          case ProfileSyndicateStateStatus.loaded:
            hideLoader();
            break;
          case ProfileSyndicateStateStatus.uploadImage:
            hideLoader();
            break;
          case ProfileSyndicateStateStatus.error:
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
                  child: widget.userCtrl.syndicate != null
                      ? Column(
                          children: [
                            const SizedBox(height: 8),
                            ImageWidget(
                              (image) async {
                                controller.uploadImage(
                                  image,
                                  widget.userCtrl.syndicate!.user,
                                );
                              },
                              controller.urlImage ??
                                  widget.userCtrl.syndicate!.imageUrl,
                              themeColor: ColorsApp.i.primary,
                            ),
                            const SizedBox(height: 8),
                            Column(
                              children: [
                                Text(
                                  widget.userCtrl.syndicate!.user.formattedCNPJ,
                                  style:
                                      context.textStyles.textRegular.copyWith(
                                    color: Colors.white,
                                    fontSize: 12,
                                  ),
                                ),
                                Text(
                                  widget.userCtrl.syndicate!.companyData
                                      .fantasyName,
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
                            .pushNamed('/home/syndicate/legalData'),
                        icon: Icons.person_outline_rounded,
                        label: 'Dados Juridicos',
                        colorIcon: ColorsApp.i.primary,
                      ),
                      OptionButtonProfile(
                        onTap: () => Navigator.of(context)
                            .pushNamed('/home/syndicate/contactData'),
                        icon: Icons.description_outlined,
                        label: 'Contato',
                        colorIcon: ColorsApp.i.primary,
                      ),
                      OptionButtonProfile(
                        onTap: () => Navigator.of(context)
                            .pushNamed('/home/syndicate/addressData'),
                        icon: Icons.location_on_outlined,
                        label: 'Endereço',
                        colorIcon: ColorsApp.i.primary,
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
