import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../auth/auth_controller.dart';
import '../menu/menu_drawer_controller.dart';
import 'syndicate/profile/profile_syndicate_page.dart';
import 'syndicate/service_taker/register/service_taker_syndicate_register_page.dart';
import 'syndicate/tasks/register/task_syndicate_register_page.dart';
import 'syndicate/worker/worker_syndicate_register_page.dart';
import 'worker/extract/extract_page.dart';
import 'worker/home/home_page.dart';
import 'worker/profile/profile_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  AuthController authController = GetIt.I<AuthController>();
  MenuDrawerController menuController = GetIt.I<MenuDrawerController>();
  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    reaction(
      (_) => menuController.page,
      (page) => pageController.jumpToPage(page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: authController.auth!.profileType == 0
            ? [
                const HomePage(),
                const ExtractPage(),
                const ProfilePage(),
              ]
            : authController.auth!.profileType == 1
                ? []
                : [
                    const TasksSyndicateRegisterPage(),
                    const WorkerSyndicateRegisterPage(),
                    const ProfileSyndicatePage(),
                    const ServiceTakerSyndicateRegisterPage(),
                  ],
      ),
    );
  }
}
