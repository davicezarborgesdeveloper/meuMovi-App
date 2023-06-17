import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../../core/ui/helpers/loader.dart';
import '../../../../core/ui/helpers/messages.dart';
import '../../../../core/ui/helpers/size_extensions.dart';
import '../../../../core/ui/styles/text_styles.dart';
import '../../../../models/syndicate_model.dart';
import '../../../auth/auth_controller.dart';
import '../../../auth/user_controller.dart';
import '../../../menu/menu_drawer.dart';
import '../../worker/profile/widget/image_widget.dart';
import '../../worker/profile/widget/option_button_profile.dart';
import 'profile_syndicate_controller.dart';

class ProfileSyndicatePage extends StatefulWidget {
  const ProfileSyndicatePage({super.key});

  @override
  State<ProfileSyndicatePage> createState() => _ProfileSyndicatePageState();
}

class _ProfileSyndicatePageState extends State<ProfileSyndicatePage>
    with Loader, Messages {
  final UserController userCtrl = GetIt.I<UserController>();
  final ProfileSyndicateController controller = ProfileSyndicateController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight - 60;
    return Scaffold(
      appBar: AppBar(backgroundColor: Colors.black),
      drawer: MenuDrawer(),
      body: SizedBox(
        height: screenHeight,
        child: Stack(
          children: [
            Observer(
              builder: (_) {
                return Container(
                  color: Colors.black,
                  width: screenWidth,
                  height: context.screenHeight * .25,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            if (userCtrl.user != null)
                              Text(
                                (userCtrl.user as SyndicateModel)
                                    .companyData
                                    .corporateName,
                                style: context.textStyles.textBold.copyWith(
                                  fontSize: 18,
                                  color: Colors.white,
                                ),
                              ),
                            Row(
                              children: [
                                Text(
                                  '0 tarefas',
                                  style: context.textStyles.textMedium
                                      .copyWith(color: Colors.white),
                                ),
                                const SizedBox(width: 8),
                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star,
                                      color: Colors.amber,
                                      size: 18,
                                    ),
                                    const SizedBox(width: 4),
                                    Text(
                                      '5.00',
                                      style: context.textStyles.textMedium
                                          .copyWith(color: Colors.white),
                                    ),
                                  ],
                                )
                              ],
                            )
                          ],
                        ),
                        ImageWidget(
                          (image) async {
                            // controller.uploadImage(image, userCtrl.user!.id!);
                          },
                          controller.urlImage,
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            Positioned(
              top: context.screenHeight * .23,
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
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      OptionButtonProfile(
                        onTap: () => {},
                        icon: Icons.person_outline_rounded,
                        label: 'Dados Juridicos',
                      ),
                      OptionButtonProfile(
                        onTap: () => {},
                        icon: Icons.description_outlined,
                        label: 'Contato',
                      ),
                      OptionButtonProfile(
                        onTap: () {},
                        icon: Icons.location_on_outlined,
                        label: 'Endereço',
                      ),
                      OptionButtonProfile(
                        onTap: () async {
                          final navigator = Navigator.of(context);
                          await navigator.pushReplacementNamed('/auth/login');
                          await GetIt.I<AuthController>().logout();
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
