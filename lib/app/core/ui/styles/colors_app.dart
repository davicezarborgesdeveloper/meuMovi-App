import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;
  // Avoid self isntance
  ColorsApp._();
  static ColorsApp get i {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  Color get primaryLight => const Color(0XFF0DD464);
  Color get primary => const Color(0XFF088840);
  Color get primaryDark => const Color(0XFF006400);

  Color get secondaryLight => const Color(0XFFff4046);
  Color get secondary => const Color(0XFFE81820);
  Color get secondaryDark => const Color(0XFFA60004);

  Color get ternaryLight => const Color(0XFFe48b55);
  Color get ternary => const Color(0XFFc76b34);
  Color get ternaryDark => const Color(0XFF8b4216);

  Color get black => const Color(0XFF1C1F22);
  Color get bg => Colors.grey.shade100;
}

extension ColorsAppExtensions on BuildContext {
  ColorsApp get colors => ColorsApp.i;
}
