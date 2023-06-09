import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../core/ui/helpers/size_extensions.dart';
import '../auth/auth_controller.dart';
import '../auth/user_controller.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  AuthController authCtrl = GetIt.I<AuthController>();
  ReactionDisposer? statusDisposed;

  bool _logged = false;

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      statusDisposed = when((_) => authCtrl.isLoggedInKeep, () async {
        _logged = true;
        GetIt.I<UserController>().getCurrentUser(authCtrl.auth!.uid);
      });
    });
    super.initState();
    startSplashScreenTimer();
  }

  Timer startSplashScreenTimer() {
    const duration = Duration(seconds: 1);
    return Timer(duration, navigationToNextPage);
  }

  void navigationToNextPage() {
    Navigator.of(context)
        .pushReplacementNamed(_logged ? '/home' : '/auth/login');

    // Navigator.of(context)
    //     .pushReplacementNamed(_logged ? '/home' : '/auth/signup');
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
