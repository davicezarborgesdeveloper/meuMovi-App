import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app/pages/auth/user_controller.dart';
import 'app/pages/menu/menu_drawer_controller.dart';
import 'meu_movi_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setupLocators();
  runApp(const MeuMoviApp());
}

Future<void> setupLocators() async {
  GetIt.I.registerSingleton(MenuDrawerController());
  GetIt.I.registerSingleton(UserController());
}
