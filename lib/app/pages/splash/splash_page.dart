import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:mobx/mobx.dart';

import '../../controllers/user_controller.dart';
import '../../core/ui/helpers/size_extensions.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({Key? key}) : super(key: key);

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  UserController userCtrl = GetIt.I<UserController>();
  late ReactionDisposer statusDisposed;
  late int timeInit;
  late int timeEnd;

  bool _logged = false;
  String url = '/auth/login';

  @override
  void initState() {
    timeInit = DateTime.now().millisecondsSinceEpoch;
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await userCtrl.loadCurrentUser();
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
    timeEnd = DateTime.now().millisecondsSinceEpoch;
    final int timeResult = timeEnd - timeInit;
    int timeDiff = 0;
    if (timeResult < 3000) {
      timeDiff = 3000 - timeResult;
    }
    final Duration duration = Duration(milliseconds: timeDiff);
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
