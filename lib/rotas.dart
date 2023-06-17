import 'package:flutter/material.dart';

import 'app/pages/auth/login/login_page.dart';
import 'app/pages/auth/remember/remember_me_page.dart';
import 'app/pages/auth/signup/service_taker/service_taker_register_page.dart';
import 'app/pages/auth/signup/signup_menu_page.dart';
import 'app/pages/auth/signup/syndicate/syndicate_register_page.dart';
import 'app/pages/auth/signup/workerRegister/worker_register_page.dart';
import 'app/pages/base/base_page.dart';
import 'app/pages/splash/splash_page.dart';
import 'app/pages/terms_user/terms_use.dart';

class Rotas {
  static Route<dynamic> gerarRota(RouteSettings settings) {
    // final args = settings.arguments;
    switch (settings.name) {
      case '/':
        return MaterialPageRoute(builder: (_) => const SplashPage());
      case '/auth/login':
        return MaterialPageRoute(builder: (_) => const LoginPage());
      case '/auth/signup/menu':
        return MaterialPageRoute(builder: (_) => const SignupMenuPage());
      case '/auth/signup/worker':
        return MaterialPageRoute(builder: (_) => const WorkerRegisterPage());
      case '/auth/signup/serviceTaker':
        return MaterialPageRoute(
          builder: (_) => const ServiceTakerRegisterPage(),
        );
      case '/auth/signup/syndicate':
        return MaterialPageRoute(builder: (_) => const SyndicateRegisterPage());
      case '/auth/signup/termsUse':
        return MaterialPageRoute(builder: (_) => const TermsUse());
      case '/auth/remember':
        return MaterialPageRoute(builder: (_) => const RememberMePage());

      case '/home':
        return MaterialPageRoute(builder: (_) => const BasePage());
      // case '/home/profile/personalData':
      //   return MaterialPageRoute(
      //     builder: (_) => const ProfilePersonalDataPage(),
      //   );
      // case '/home/profile/documents':
      //   return MaterialPageRoute(
      //     builder: (_) => const ProfileMyDocumentsPage(),
      //   );
      // case '/home/profile/address':
      //   return MaterialPageRoute(builder: (_) => const ProfileMyAddressPage());
      // case '/home/profile/bankData':
      //   return MaterialPageRoute(builder: (_) => const ProfileBankDataPage());
      // case '/home/profile/settings':
      //   return MaterialPageRoute(builder: (_) => const ProfileSettingsPage());
    }
    return _erroRota();
  }

  static Route<dynamic> _erroRota() {
    return MaterialPageRoute(
      builder: (_) {
        return Scaffold(
          appBar: AppBar(
            title: const Text('Tela não encontrada!'),
          ),
          body: const Center(
            child: Text('Tela não encontrada!'),
          ),
        );
      },
    );
  }
}
