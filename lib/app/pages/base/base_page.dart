import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import '../../core/ui/styles/colors_app.dart';
import '../auth/auth_controller.dart';
import 'extract/extract_page.dart';
import 'home/home_page.dart';
import 'profile/profile_page.dart';

class BasePage extends StatefulWidget {
  const BasePage({Key? key}) : super(key: key);

  @override
  State<BasePage> createState() => _BasePageState();
}

class _BasePageState extends State<BasePage> {
  AuthController authController = GetIt.I<AuthController>();
  int _selectedScreenIndex = 0;

  // List<Widget>? _screens;
  List<Map<String, Object?>>? _screens;

  @override
  void initState() {
    super.initState();
    _screens = [
      {
        // 'appBar': HomeAppbar(name: authController.auth!.displayName),
        'appBar': null,
        'screen': const HomePage()
      },
      {
        'appBar': AppBar(
          title: const Text('Extrato'),
        ),
        'screen': const ExtractPage(),
      },
      {
        'appBar': null,
        'screen': const ProfilePage(),
      },
    ];
  }

  void _selectScreen(int index) {
    setState(() {
      _selectedScreenIndex = index;
    });
    return;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _screens![_selectedScreenIndex]['appBar'] as AppBar?,
      body: Column(
        children: [
          _screens![_selectedScreenIndex]['screen'] as Widget,
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        onTap: _selectScreen,
        selectedItemColor: ColorsApp.i.primary,
        unselectedItemColor: Colors.grey[400],
        currentIndex: _selectedScreenIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Inicio',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.credit_card),
            label: 'Extrato',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Perfil',
          ),
        ],
      ),
    );
  }
}
