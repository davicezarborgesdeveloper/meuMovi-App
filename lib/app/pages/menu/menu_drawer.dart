import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/ui/styles/colors_app.dart';
import '../auth/auth_controller.dart';
import 'menu_button.dart';
import 'menu_drawer_controller.dart';
import 'menu_enum.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  final MenuDrawerController drawerController = GetIt.I<MenuDrawerController>();

  final AuthController authController = GetIt.I<AuthController>();

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: const BorderRadius.horizontal(right: Radius.circular(50)),
      child: Container(
        color: ColorsApp.i.bg,
        width: MediaQuery.of(context).size.width * 0.65,
        child: Drawer(
          backgroundColor: ColorsApp.i.bg,
          child: ListView.builder(
            shrinkWrap: true,
            itemCount: authController.auth!.profileType == 0
                ? MenuWorker.values.length
                : MenuSyndicate.values.length,
            itemBuilder: ((context, index) {
              final menu = authController.auth!.profileType == 0
                  ? MenuWorker.values[index]
                  : MenuSyndicate.values[index];
              final length = authController.auth!.profileType == 0
                  ? MenuWorker.values.length
                  : MenuSyndicate.values.length;
              return MenuButton(
                menu: menu,
                menuSelected: drawerController.page == index,
                onPressed: () {
                  if ((length - 1) == index) {
                    Navigator.of(context).pushReplacementNamed('/auth/login');
                  } else {
                    drawerController.setPage(index);
                    Navigator.of(context).pop();
                  }
                },
              );
            }),
          ),
        ),
      ),
    );
  }
}
