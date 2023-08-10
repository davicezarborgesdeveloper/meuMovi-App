import 'package:flutter/material.dart';

import '../ui/styles/text_styles.dart';

class PeriodButton extends StatelessWidget {
  final String label;
  final int option;
  final int? selected;
  final GestureTapCallback? onPressed;
  final Color themeColor;
  const PeriodButton({
    Key? key,
    required this.label,
    required this.option,
    required this.themeColor,
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
        color: isSelected ? themeColor : Colors.transparent,
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
