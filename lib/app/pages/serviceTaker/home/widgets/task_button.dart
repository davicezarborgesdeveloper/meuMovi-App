import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../../../../core/ui/helpers/size_extensions.dart';
import '../../../../core/ui/styles/text_styles.dart';

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
    final width = context.screenWidth;
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
                child: AutoSizeText(
                  numberLabel!,
                  style: context.textStyles.textBold.copyWith(
                    fontSize: width >= 480
                        ? 32
                        : width >= 400
                            ? 28
                            : 24,
                    color: isSelected ? Colors.white : themeColor,
                  ),
                  maxFontSize: 32,
                  minFontSize: 24,
                  overflow: TextOverflow.ellipsis,
                  maxLines: 1,
                ),
              ),
              Positioned(
                left: 16,
                bottom: 16,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Tarefas',
                      style: context.textStyles.textRegular.copyWith(
                        color: isSelected ? Colors.white : Colors.grey.shade700,
                        fontSize: width >= 480
                            ? 28
                            : width >= 400
                                ? 24
                                : 16,
                      ),
                      maxFontSize: 28,
                      minFontSize: 16,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                    SizedBox(
                      width: context.percentWidth(.85) / 2,
                      child: Text(
                        label,
                        style: context.textStyles.textBold.copyWith(
                          color:
                              isSelected ? Colors.white : Colors.grey.shade700,
                          fontSize: width >= 480
                              ? 20
                              : width >= 400
                                  ? 16
                                  : 14,
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
