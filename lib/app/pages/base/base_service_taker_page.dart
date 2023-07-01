import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../auth/user_controller.dart';
import '../menu/menu_drawer_controller.dart';
import 'service_taker/extract/extract_service_taker_page.dart';
import 'service_taker/home/home_service_taker_page.dart';
import 'service_taker/profile/profile_service_taker_page.dart';
import 'service_taker/task/list/task_list_service_taker_page.dart';

class BaseServiceTakerPage extends StatefulWidget {
  const BaseServiceTakerPage({super.key});

  @override
  State<BaseServiceTakerPage> createState() => _BaseServiceTakerPageState();
}

class _BaseServiceTakerPageState extends State<BaseServiceTakerPage> {
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
          HomeServiceTakerPage(userController),
          const ExtractServiceTakerPage(),
          TaskListServiceTakerPage(userController),
          ProfileServiceTakerPage(userController),
        ],
      ),
    );
  }
}
