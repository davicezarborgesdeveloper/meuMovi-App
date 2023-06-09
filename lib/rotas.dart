import 'package:flutter/material.dart';

import 'app/pages/auth/login/login_page.dart';
import 'app/pages/auth/register/register_page.dart';
import 'app/pages/auth/remember/remember_me_page.dart';
import 'app/pages/auth/signup/signup_menu_page.dart';
import 'app/pages/base/base_page.dart';
import 'app/pages/base/profile/profile_bank_data/profile_bank_data_page.dart';
import 'app/pages/base/profile/profile_my_address/profile_my_address_page.dart';
import 'app/pages/base/profile/profile_my_documents/profile_my_documents_page.dart';
import 'app/pages/base/profile/profile_personal_data/profile_personal_data_page.dart';
import 'app/pages/base/profile/profile_settings/profile_settings_page.dart';
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
      case '/auth/register':
        return MaterialPageRoute(builder: (_) => const RegisterPage());
      case '/auth/signup':
        return MaterialPageRoute(builder: (_) => const SignupMenuPage());
      case '/auth/remember':
        return MaterialPageRoute(builder: (_) => const RememberMePage());
      case '/auth/register/termsUse':
        return MaterialPageRoute(builder: (_) => const TermsUse());
      case '/home':
        return MaterialPageRoute(builder: (_) => const BasePage());
      case '/home/profile/personalData':
        return MaterialPageRoute(
          builder: (_) => const ProfilePersonalDataPage(),
        );
      case '/home/profile/documents':
        return MaterialPageRoute(
          builder: (_) => const ProfileMyDocumentsPage(),
        );
      case '/home/profile/address':
        return MaterialPageRoute(builder: (_) => const ProfileMyAddressPage());
      case '/home/profile/bankData':
        return MaterialPageRoute(builder: (_) => const ProfileBankDataPage());
      case '/home/profile/settings':
        return MaterialPageRoute(builder: (_) => const ProfileSettingsPage());
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
