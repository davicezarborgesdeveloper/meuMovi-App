import 'package:flutter/material.dart';

import 'app/core/global/global_context.dart';
import 'app/core/ui/theme/theme_config.dart';
import 'rotas.dart';

class MeuMoviApp extends StatelessWidget {
  final _navKey = GlobalKey<NavigatorState>();

  MeuMoviApp({super.key}) {
    GlobalContext.instance.navigatorKey = _navKey;
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Movi',
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.theme,
      navigatorKey: _navKey,
      initialRoute: '/',
      onGenerateRoute: Rotas.gerarRota,
    );
  }
}
