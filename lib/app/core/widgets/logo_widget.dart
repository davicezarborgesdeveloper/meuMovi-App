import 'package:flutter/material.dart';

import '../ui/helpers/size_extensions.dart';

class LogoWidget extends StatelessWidget {
  final double width;
  const LogoWidget({Key? key, this.width = .40}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double height = context.percentWidth(width) / 0.775;
    return Center(
      child: SizedBox(
        height: height,
        child: Image.asset('assets/images/logo_color.png'),
      ),
    );
  }
}
