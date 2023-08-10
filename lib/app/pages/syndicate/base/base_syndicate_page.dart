import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../../controllers/menu_drawer_controller.dart';
import '../../../controllers/user_controller.dart';
import '../dashboard/task_dashboard_page.dart';
import '../profile/profile_syndicate_page.dart';
import '../serviceTaker/service_taker_list_page.dart';
import '../worker/worker_list_page.dart';

class BaseSyndicatePage extends StatefulWidget {
  const BaseSyndicatePage({super.key});

  @override
  State<BaseSyndicatePage> createState() => _BaseSyndicatePageState();
}

class _BaseSyndicatePageState extends State<BaseSyndicatePage> {
  UserController userController = GetIt.I<UserController>();
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
        children: [
          ProfileSyndicatePage(userController),
          TaskDashboardPage(userController),
          WorkerListPage(userController),
          ServiceTakerListPage(userController),
        ],
      ),
    );
  }
}
