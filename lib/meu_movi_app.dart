import 'package:flutter/material.dart';

import 'app/core/ui/theme/theme_config.dart';
import 'rotas.dart';

class MeuMoviApp extends StatelessWidget {
  const MeuMoviApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Meu Movi',
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.theme,
      initialRoute: '/',
      onGenerateRoute: Rotas.gerarRota,
    );
  }
}
