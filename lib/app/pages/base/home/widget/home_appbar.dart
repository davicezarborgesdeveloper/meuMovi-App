import 'package:flutter/material.dart';

import '../../../../core/ui/styles/colors_app.dart';

class HomeAppbar extends AppBar {
  final String name;
  HomeAppbar({super.key, required this.name})
      : super(
          toolbarHeight: 120,
          backgroundColor: ColorsApp.i.bg,
          title: Column(
            children: [
              Center(
                child: Text(
                  'Olá, $name',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'roboto',
                    fontSize: 18,
                    color: ColorsApp.i.black,
                  ),
                ),
              ),
              const SizedBox(
                height: 45,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  'Tarefas',
                  style: TextStyle(
                    fontWeight: FontWeight.w800,
                    fontFamily: 'roboto',
                    fontSize: 18,
                    color: ColorsApp.i.black,
                  ),
                ),
              ),
              // const SizedBox(height: 16),
            ],
          ),
        );
}
