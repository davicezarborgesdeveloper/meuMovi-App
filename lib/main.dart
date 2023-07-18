import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'app/core/controllers/http_controller.dart';
import 'app/core/env/env.dart';
import 'app/pages/auth/user_controller.dart';
import 'app/pages/menu/menu_drawer_controller.dart';
import 'meu_movi_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.i.load();
  await setupLocators();
  runApp(MeuMoviApp());
}

Future<void> setupLocators() async {
  GetIt.I.registerSingleton(HttpController());
  GetIt.I.registerSingleton(MenuDrawerController());
  GetIt.I.registerSingleton(UserController());
}
