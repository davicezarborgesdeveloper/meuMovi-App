import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;
  // Avoid self isntance
  ColorsApp._();
  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primary => const Color(0XFF088840);
  Color get primaryDark => const Color(0XFF006400);
  Color get secondary => const Color(0XFFE81820);

  Color get black => const Color(0XFF1C1F22);
  Color get bg => Colors.grey.shade100;
}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
