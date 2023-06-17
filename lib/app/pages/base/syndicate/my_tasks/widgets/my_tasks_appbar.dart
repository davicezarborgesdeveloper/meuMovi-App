import 'package:flutter/material.dart';

import '../../../../../core/ui/styles/colors_app.dart';

class MyTasksAppbar extends AppBar {
  final String? label;
  final List<Widget>? buttons;
  MyTasksAppbar({super.key, this.buttons, this.label})
      : super(
          backgroundColor: ColorsApp.i.bg,
          title: Text(
            label!,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontFamily: 'roboto',
              fontSize: 18,
              color: ColorsApp.i.primary,
            ),
          ),
          actions: buttons,
        );
}
