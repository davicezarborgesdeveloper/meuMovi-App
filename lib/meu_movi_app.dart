import 'package:flutter/material.dart';

import 'app/core/ui/helpers/size_extensions.dart';
import 'app/core/ui/theme/theme_config.dart';
import 'app/core/global/global_context.dart';
import 'routes.dart';

class MeuMoviApp extends StatelessWidget {
  final _navKey = GlobalKey<NavigatorState>();

  MeuMoviApp({super.key}) {
    GlobalContext.instance.navigatorKey = _navKey;
  }

  @override
  Widget build(BuildContext context) {
    print('${context.screenWidth} x ${context.screenHeight}');
    return MaterialApp(
      title: 'Meu Movi',
      debugShowCheckedModeBanner: false,
      theme: ThemeConfig.theme,
      navigatorKey: _navKey,
      initialRoute: '/',
      onGenerateRoute: Routes.gerarRota,
    );
  }
}
