import 'package:flutter/material.dart';

import '../../../../../core/ui/styles/text_styles.dart';

class TaskButton extends StatelessWidget {
  final String label;
  final String? numberLabel;
  final int option;
  final int? selected;
  final GestureTapCallback? onPressed;
  final Color? themeColor;
  const TaskButton({
    Key? key,
    required this.label,
    required this.option,
    this.numberLabel = '0',
    this.selected,
    this.onPressed,
    this.themeColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isSelected = selected == option;
    return Material(
      elevation: 4,
      color: isSelected ? themeColor : Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(8),
        side: BorderSide.none,
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
                  numberLabel!,
                  style: context.textStyles.textBold.copyWith(
                    fontSize: 24,
                    color: isSelected ? Colors.white : themeColor,
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
                    SizedBox(
                      width: 96,
                      child: Text(
                        label,
                        style: context.textStyles.textBold.copyWith(
                          color:
                              isSelected ? Colors.white : Colors.grey.shade700,
                          fontSize: 16,
                        ),
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
