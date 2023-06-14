import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'app/pages/auth/auth_controller.dart';
import 'app/pages/auth/user_controller.dart';
import 'app/core/env/env.dart';
import 'firebase_options.dart';
import 'meu_movi_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Env.instance.load();

  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  await setupLocators();
  runApp(const MeuMoviApp());
}

Future<void> setupLocators() async {
  GetIt.I.registerSingleton(AuthController());
  GetIt.I.registerSingleton(UserController());
}
