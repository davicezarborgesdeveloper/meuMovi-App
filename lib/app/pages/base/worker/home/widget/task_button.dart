import 'package:flutter/material.dart';

import '../../../../../core/ui/styles/colors_app.dart';
import '../../../../../core/ui/styles/text_styles.dart';

class TaskButton extends StatelessWidget {
  final String label;
  final int option;
  final int? selected;
  final GestureTapCallback? onPressed;
  const TaskButton({
    Key? key,
    required this.label,
    required this.option,
    this.selected,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = selected == option;
    return Material(
      elevation: 2,
      color: isSelected ? ColorsApp.i.primary : ColorsApp.i.bg,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: isSelected
            ? BorderSide.none
            : BorderSide(width: 3, color: Colors.grey.shade400),
      ),
      child: InkWell(
        onTap: onPressed,
        child: SizedBox(
          height: 100,
          width: 180,
          child: Stack(
            children: [
              Positioned(
                right: 16,
                top: 16,
                child: Text(
                  '0',
                  style: context.textStyles.textBold.copyWith(
                    fontSize: 24,
                    color: isSelected ? Colors.white : ColorsApp.i.primary,
                  ),
                ),
              ),
              Positioned(
                left: 16,
                bottom: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Tarefas',
                      style: context.textStyles.textRegular.copyWith(
                        color: isSelected ? Colors.white : Colors.grey.shade700,
                        fontSize: 18,
                      ),
                    ),
                    Text(
                      label,
                      style: context.textStyles.textBold.copyWith(
                        color: isSelected ? Colors.white : Colors.grey.shade700,
                        fontSize: 18,
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
