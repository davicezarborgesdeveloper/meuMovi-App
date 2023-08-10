import 'package:flutter/material.dart';

import 'app/pages/auth/signup/serviceTakerSignup/service_taker_signup_page.dart';
import 'app/pages/auth/signup/syndicateSignup/syndicate_signup_page.dart';
import 'app/pages/auth/signup/workerSignup/worker_signup_page.dart';
import 'app/pages/auth/signup/signup_menu_page.dart';
import 'app/pages/login/login_page.dart';
import 'app/pages/rememberPage/remember_page.dart';
import 'app/pages/serviceTaker/base/base_service_taker_page.dart';
import 'app/pages/serviceTaker/editData/edit_service_taker_edit_data_page.dart';
import 'app/pages/serviceTaker/settings/settings_service_taker_page.dart';
import 'app/pages/splash/splash_page.dart';
import 'app/pages/syndicate/base/base_syndicate_page.dart';
import 'app/pages/syndicate/profile/addressData/address_data_page.dart';
import 'app/pages/syndicate/profile/contactData/contact_data_page.dart';
import 'app/pages/syndicate/profile/legalData/legal_data_page.dart';
import 'app/pages/syndicate/profile/settingsSyndicate/settings_syndicate_page.dart';
import 'app/pages/termUse/term_use_page.dart';
import 'app/pages/worker/baseWorker/base_worker_page.dart';
import 'app/pages/worker/profileWorker/settings/profile_worker_settings_page.dart';

class Routes {
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
        return MaterialPageRoute(builder: (_) => const WorkerSignupPage());
      case '/auth/signup/serviceTaker':
        return MaterialPageRoute(
          builder: (_) => const ServiceTakerSignupPage(),
        );
      case '/auth/signup/syndicate':
        return MaterialPageRoute(builder: (_) => const SyndicateSignupPage());
      case '/auth/signup/termsUse':
        return MaterialPageRoute(builder: (_) => const TermsUsePage());
      case '/auth/remember':
        return MaterialPageRoute(builder: (_) => const RememberPage());
      case '/home/worker':
        return MaterialPageRoute(builder: (_) => const BaseWorkerPage());
      case '/home/serviceTaker':
        return MaterialPageRoute(builder: (_) => const BaseServiceTakerPage());
      case '/home/syndicate':
        return MaterialPageRoute(builder: (_) => const BaseSyndicatePage());
      case '/home/syndicate/legalData':
        return MaterialPageRoute(
          builder: (_) => const LegalDataPage(),
        );
      case '/home/syndicate/contactData':
        return MaterialPageRoute(
          builder: (_) => const ContactDataPage(),
        );
      case '/home/syndicate/addressData':
        return MaterialPageRoute(
          builder: (_) => const AddressDataPage(),
        );
      case '/home/syndicate/settings':
        return MaterialPageRoute(
          builder: (_) => const SettingsSyndicatePage(),
        );
      case '/home/worker/settings':
        return MaterialPageRoute(
          builder: (_) => const ProfileWorkerSettingsPage(),
        );
      case '/home/serviceTaker/data':
        return MaterialPageRoute(
          builder: (_) => const EditServiceTakerEditDataPage(),
        );
      case '/home/serviceTaker/settings':
        return MaterialPageRoute(
          builder: (_) => const SettingsServiceTakerPage(),
        );
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
