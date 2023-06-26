import 'package:flutter/material.dart';

import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';

class PeriodButton extends StatelessWidget {
  final String label;
  final int option;
  final int? selected;
  final GestureTapCallback? onPressed;
  const PeriodButton({
    Key? key,
    required this.label,
    required this.option,
    this.selected,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = selected == option;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: isSelected ? ColorsApp.i.primary : Colors.transparent,
      ),
      child: TextButton(
        onPressed: onPressed,
        child: Text(
          label,
          style: context.textStyles.textMedium.copyWith(
            color: isSelected ? Colors.white : Colors.grey.shade700,
          ),
        ),
      ),
    );
  }
}
