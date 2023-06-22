import 'package:flutter/material.dart';

import 'app/pages/auth/login/login_page.dart';
import 'app/pages/auth/remember/remember_me_page.dart';
import 'app/pages/auth/signup/service_taker/service_taker_register_page.dart';
import 'app/pages/auth/signup/signup_menu_page.dart';
import 'app/pages/auth/signup/syndicate/syndicate_register_page.dart';
import 'app/pages/auth/signup/workerRegister/worker_register_page.dart';
import 'app/pages/base/base_page.dart';
import 'app/pages/base/service_taker/profile/edit_data/service_taker_edit_data_page.dart';
import 'app/pages/base/service_taker/profile/settings/service_taker_settings_page.dart';
import 'app/pages/base/syndicate/profile/address_data/address_data_syndicate_page.dart';
import 'app/pages/base/syndicate/profile/contact_data/contact_data_syndicate_page.dart';
import 'app/pages/base/syndicate/profile/legal_data/legal_data_page.dart';
import 'app/pages/base/worker/profile/address/profile_worker_address_data_page.dart';
import 'app/pages/base/worker/profile/bank_account/profile_worker_bank_account_page.dart';
import 'app/pages/base/worker/profile/documents/profile_worker_documents_page.dart';
import 'app/pages/base/worker/profile/personal/profile_worker_personal_data_page.dart';
import 'app/pages/base/worker/profile/settings/profile_worker_settings_page.dart';
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
      case '/home/syndicate/legalData':
        return MaterialPageRoute(
          builder: (_) => const LegalDataPage(),
        );
      case '/home/syndicate/contactData':
        return MaterialPageRoute(
          builder: (_) => const ContactDataSyndicatePage(),
        );
      case '/home/syndicate/addressData':
        return MaterialPageRoute(
          builder: (_) => const AddressDataSyndicatePage(),
        );
      case '/home/worker/personalData':
        return MaterialPageRoute(
          builder: (_) => const ProfileWorkerPersonalDataPage(),
        );
      case '/home/profile/documents':
        return MaterialPageRoute(
          builder: (_) => const ProfileWorkerDocumentsPage(),
        );
      case '/home/worker/address':
        return MaterialPageRoute(
          builder: (_) => const ProfileWorkerAddressDataPage(),
        );
      case '/home/worker/bankData':
        return MaterialPageRoute(
          builder: (_) => const ProfileWorkerBankAccountPage(),
        );
      case '/home/worker/settings':
        return MaterialPageRoute(
          builder: (_) => const ProfileWorkerSettingsPage(),
        );
      case '/home/serviceTaker/data':
        return MaterialPageRoute(
          builder: (_) => const ServiceTakerEditDataPage(),
        );
      case '/home/serviceTaker/settings':
        return MaterialPageRoute(
          builder: (_) => const ServiceTakerSettingsPage(),
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
