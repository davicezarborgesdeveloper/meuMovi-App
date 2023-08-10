import 'package:flutter/material.dart';

import '../../../../../core/ui/styles/colors_app.dart';

class PersonalTile extends StatelessWidget {
  final IconData? icon;
  final String? urlIcon;
  final String text;
  const PersonalTile({super.key, this.icon, this.urlIcon, required this.text});

  @override
  Widget build(BuildContext context) {
    return text.isNotEmpty
        ? Row(
            children: [
              icon != null
                  ? Icon(
                      icon,
                      color: ColorsApp.i.primaryLight.withAlpha(150),
                    )
                  : Image.asset(
                      urlIcon!,
                      height: 24,
                      color: ColorsApp.i.primaryLight.withAlpha(150),
                    ),
              const SizedBox(
                width: 16,
              ),
              Text(text)
            ],
          )
        : Container();
  }
}
