import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../../core/ui/helpers/size_extensions.dart';
import '../../../core/ui/styles/text_styles.dart';
import '../../auth/auth_controller.dart';
import '../../auth/user_controller.dart';
import 'profile_controller.dart';
import 'widget/image_widget.dart';
import 'widget/option_button_profile.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  final UserController userCtrl = GetIt.I<UserController>();
  final ProfileController controller = ProfileController();

  @override
  Widget build(BuildContext context) {
    final screenWidth = context.screenWidth;
    final screenHeight = context.screenHeight - 60;
    return SizedBox(
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
                          Text(
                            '${userCtrl.user?.fullName}',
                            style: context.textStyles.textBold
                                .copyWith(fontSize: 18, color: Colors.white),
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
                          controller.uploadImage(image, userCtrl.user!.id!);
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
                      onTap: () => Navigator.of(context)
                          .pushNamed('/home/profile/personalData'),
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
                          .pushNamed('/home/profile/address'),
                      icon: Icons.location_on_outlined,
                      label: 'Endereço',
                    ),
                    OptionButtonProfile(
                      onTap: () => Navigator.of(context)
                          .pushNamed('/home/profile/bankData'),
                      icon: Icons.credit_card_outlined,
                      label: 'Conta bancária',
                    ),
                    OptionButtonProfile(
                      onTap: () => Navigator.of(context)
                          .pushNamed('/home/profile/settings'),
                      icon: Icons.settings_outlined,
                      label: 'Configurações',
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
    );
  }
}
