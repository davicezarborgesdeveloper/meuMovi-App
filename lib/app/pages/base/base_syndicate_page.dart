import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../auth/user_controller.dart';
import '../menu/menu_drawer_controller.dart';
import 'syndicate/profile/profile_syndicate_page.dart';
import 'syndicate/service_taker/list/service_taker_list_page.dart';
import 'syndicate/tasks/list/task_list_page.dart';
import 'syndicate/worker/list/worker_list_page.dart';

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
          TaskListPage(userController),
          WorkerListPage(userController),
          ServiceTakerListPage(userController),
        ],
      ),
    );
  }
}
