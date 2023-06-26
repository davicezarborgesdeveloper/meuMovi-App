import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../auth/auth_controller.dart';
import '../menu/menu_drawer_controller.dart';
import 'service_taker/extract/extract_service_taker_page.dart';
import 'service_taker/home/home_service_taker_page.dart';
import 'service_taker/profile/profile_service_taker_page.dart';
import 'syndicate/profile/profile_syndicate_page.dart';
import 'syndicate/service_taker/list/service_taker_list_page.dart';
import 'syndicate/tasks/list/task_list_page.dart';
import 'syndicate/worker/list/worker_list_page.dart';
import 'worker/extract/extract_worker_page.dart';
import 'worker/home/home_worker_page.dart';
import 'worker/profile/profile_worker_page.dart';

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
    GetIt.I<MenuDrawerController>().setPage(0);
    reaction(
      (_) => menuController.page,
      (page) => pageController.jumpToPage(page),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        controller: pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: authController.auth!.profileType == 0
            ? [
                const HomeWorkerPage(),
                const ExtractWorkerPage(),
                const ProfileWorkerPage(),
              ]
            : authController.auth!.profileType == 1
                ? [
                    const HomeServiceTakerPage(),
                    const ExtractServiceTakerPage(),
                    const ProfileServiceTakerPage(),
                  ]
                : [
                    const ProfileSyndicatePage(),
                    const TaskListPage(),
                    const WorkerListPage(),
                    const ServiceTakerListPage(),
                  ],
      ),
    );
  }
}
