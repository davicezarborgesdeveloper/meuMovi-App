import 'package:flutter/material.dart';

import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';

class PeriodButton extends StatelessWidget {
  final String label;
  final bool selected;
  const PeriodButton({Key? key, required this.label, required this.selected})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 12),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        color: selected ? ColorsApp.i.primary : Colors.transparent,
      ),
      child: TextButton(
        child: Text(
          label,
          style: context.textStyles.textMedium.copyWith(
            color: selected ? Colors.white : Colors.grey.shade700,
          ),
        ),
        onPressed: () {},
      ),
    );
  }
}
