import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../auth/user_controller.dart';
import '../menu/menu_drawer_controller.dart';
import 'worker/extract/extract_worker_page.dart';
import 'worker/home/home_worker_page.dart';
import 'worker/profile/profile_worker_page.dart';

class BaseWorkerPage extends StatefulWidget {
  const BaseWorkerPage({super.key});

  @override
  State<BaseWorkerPage> createState() => _BaseWorkerPageState();
}

class _BaseWorkerPageState extends State<BaseWorkerPage> {
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
          Observer(
            builder: (_) => HomeWorkerPage(userController),
          ),
          const ExtractWorkerPage(),
          Observer(builder: (_) => ProfileWorkerPage(userController))
        ],
      ),
    );
  }
}
