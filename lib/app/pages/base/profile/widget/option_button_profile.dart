import 'package:flutter/material.dart';

import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';

class OptionButtonProfile extends StatelessWidget {
  final IconData icon;
  final String label;
  final GestureTapCallback? onTap;
  final Color? colorIcon;
  const OptionButtonProfile({
    Key? key,
    required this.icon,
    required this.label,
    this.onTap,
    this.colorIcon,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 4),
      height: 65,
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          elevation: 2,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              children: [
                Icon(
                  icon,
                  size: 32,
                  color: colorIcon ?? ColorsApp.i.primary,
                ),
                const SizedBox(
                  width: 16,
                ),
                Text(
                  label,
                  style: context.textStyles.textLight.copyWith(fontSize: 16),
                ),
                const Expanded(
                  child: Align(
                    alignment: Alignment.centerRight,
                    child: Icon(Icons.arrow_forward_ios),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
