import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get_it/get_it.dart';

import 'app/controllers/http_controller.dart';
import 'app/controllers/menu_drawer_controller.dart';
import 'app/controllers/user_controller.dart';
import 'app/core/env.dart';
import 'meu_movi_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await setups();
  runApp(MeuMoviApp());
}

Future<void> setups() async {
  await Env.i.load();
  await SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  await setupLocators();
}

Future<void> setupLocators() async {
  GetIt.I.registerSingleton(HttpController());
  GetIt.I.registerSingleton(MenuDrawerController());
  GetIt.I.registerSingleton(UserController());
}
