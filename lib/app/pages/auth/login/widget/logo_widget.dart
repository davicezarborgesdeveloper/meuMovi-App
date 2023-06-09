import 'package:flutter/widgets.dart';

class LogoWidget extends StatelessWidget {
  final double width;
  const LogoWidget({Key? key, this.width = 175}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SizedBox(
        width: width,
        child: Image.asset('assets/images/logo_color.png'),
      ),
    );
  }
}
