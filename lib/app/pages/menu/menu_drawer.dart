import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';

import '../../controllers/menu_drawer_controller.dart';
import '../../controllers/user_controller.dart';
import '../../core/ui/helpers/size_extensions.dart';
import '../../core/ui/styles/colors_app.dart';
import 'widgets/menu_button.dart';

class MenuDrawer extends StatefulWidget {
  const MenuDrawer({super.key});

  @override
  State<MenuDrawer> createState() => _MenuDrawerState();
}

class _MenuDrawerState extends State<MenuDrawer> {
  final MenuDrawerController drawerController = GetIt.I<MenuDrawerController>();
  @override
  Widget build(BuildContext context) {
    return Observer(
      builder: (_) {
        return ClipRRect(
          borderRadius:
              const BorderRadius.horizontal(right: Radius.circular(50)),
          child: Container(
            color: ColorsApp.i.bg,
            width: context.percentWidth(.65),
            child: Drawer(
              backgroundColor: ColorsApp.i.bg,
              child: ListView.builder(
                shrinkWrap: true,
                itemCount: drawerController.getLength(),
                itemBuilder: ((context, index) {
                  return MenuButton(
                    menu: drawerController.menuCurrent![index],
                    menuSelected: drawerController.page == index,
                    activeColor: drawerController.menuType == 3
                        ? ColorsApp.i.ternary
                        : drawerController.menuType == 1
                            ? ColorsApp.i.secondary
                            : ColorsApp.i.primary,
                    onPressed: () async {
                      if ((drawerController.getLength() - 1) == index) {
                        final navigator = Navigator.of(context);
                        await GetIt.I<UserController>().logout();
                        await navigator.pushReplacementNamed('/auth/login');
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
      },
    );
  }
}
