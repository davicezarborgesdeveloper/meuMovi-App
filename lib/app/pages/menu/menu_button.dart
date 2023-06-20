// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../core/ui/styles/colors_app.dart';
import '../../core/ui/styles/text_styles.dart';

class MenuButton extends StatelessWidget {
  final dynamic menu;
  final bool menuSelected;
  final VoidCallback onPressed;
  const MenuButton({
    Key? key,
    required this.menu,
    required this.menuSelected,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: menuSelected ? Colors.grey.shade300 : ColorsApp.i.bg,
      ),
      child: ListTile(
        onTap: onPressed,
        title: Text(
          menu.label,
          style: context.textStyles.textBold.copyWith(
            color: menuSelected ? ColorsApp.i.primary : Colors.black54,
          ),
        ),
        leading: Icon(
          menu.assetIcon,
          color: menuSelected ? ColorsApp.i.primary : Colors.black54,
        ),
      ),
    );
  }
}
