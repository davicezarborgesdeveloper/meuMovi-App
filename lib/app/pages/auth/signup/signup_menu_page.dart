import 'package:flutter/material.dart';

import '../../../core/ui/helpers/size_extensions.dart';
import '../login/widget/logo_widget.dart';

class SignupMenuPage extends StatelessWidget {
  const SignupMenuPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          const SizedBox(
            height: 42,
          ),
          LogoWidget(
            width: context.percentWidth(.32),
          ),
          // Column(
          //   children: [
          //     SignupMenuButton(),
          //     SignupMenuButton(),
          //     SignupMenuButton(),
          //   ],
          // )
        ],
      ),
    );
  }
}
