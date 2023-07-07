import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../core/ui/helpers/size_extensions.dart';
import '../auth/user_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  UserController userCtrl = GetIt.I<UserController>();
  late ReactionDisposer statusDisposed;

  bool _logged = false;
  String url = '/auth/login';

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposed = when((_) => userCtrl.isLoggedInKeep, () async {
        if (userCtrl.worker != null) {
          url = '/home/worker';
        } else if (userCtrl.serviceTaker != null) {
          url = '/home/serviceTaker';
        } else if (userCtrl.syndicate != null) {
          url = '/home/syndicate';
        }
        _logged = true;
      });
      startSplashScreenTimer();
    });
    super.initState();
  }

  @override
  void dispose() {
    statusDisposed();
    super.dispose();
  }

  Timer startSplashScreenTimer() {
    const duration = Duration(seconds: 1);
    return Timer(duration, navigationToNextPage);
  }

  void navigationToNextPage() {
    Navigator.of(context).pushReplacementNamed(_logged ? url : '/auth/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 32.0),
        child: Center(
          child: SizedBox(
            width: context.percentWidth(.37),
            child: Image.asset(
              'assets/images/logo_color.png',
            ),
          ),
        ),
      ),
    );
  }
}
