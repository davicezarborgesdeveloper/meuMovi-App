import 'package:flutter/material.dart';

enum MenuSyndicate {
  perfil(
    Icons.person,
    'Perfil',
  ),
  tarefas(
    Icons.filter_alt_sharp,
    'Tarefas',
  ),
  trabalhador(
    Icons.construction_outlined,
    'Trabalhador',
  ),
  tomadora(
    Icons.business_outlined,
    'Tomadora',
  ),
  sair(
    Icons.exit_to_app,
    'Sair',
  );

  final IconData assetIcon;
  final String label;
  const MenuSyndicate(
    this.assetIcon,
    this.label,
  );
}

enum MenuWorker {
  inicio(
    Icons.home,
    'Inicio',
  ),
  extrato(
    Icons.credit_card,
    'Extrato',
  ),
  perfil(
    Icons.person,
    'Perfil',
  ),
  sair(
    Icons.exit_to_app,
    'Sair',
  );

  final IconData assetIcon;
  final String label;
  const MenuWorker(
    this.assetIcon,
    this.label,
  );
}

enum MenuServiceTaker {
  inicio(
    Icons.home,
    'Inicio',
  ),
  extrato(
    Icons.credit_card,
    'Extrato',
  ),
  // tarefas(
  //   Icons.filter_alt_sharp,
  //   'Tarefas',
  // ),
  perfil(
    Icons.person,
    'Perfil',
  ),
  sair(
    Icons.exit_to_app,
    'Sair',
  );

  final IconData assetIcon;
  final String label;
  const MenuServiceTaker(
    this.assetIcon,
    this.label,
  );
}
