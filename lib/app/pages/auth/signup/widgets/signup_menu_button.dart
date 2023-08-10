import 'package:flutter/material.dart';

import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';
import 'package:auto_size_text/auto_size_text.dart';

class SignupMenuButton extends StatelessWidget {
  final IconData icon;
  final String title;
  final String description;
  final double height;
  final double width;
  final VoidCallback onTap;
  final Color? color;
  const SignupMenuButton({
    Key? key,
    required this.icon,
    required this.title,
    required this.description,
    required this.onTap,
    required this.height,
    required this.width,
    this.color,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      width: width,
      child: ElevatedButton(
        onPressed: onTap,
        style: ElevatedButton.styleFrom(
          backgroundColor: color?.withOpacity(.9) ?? ColorsApp.i.primary,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          elevation: 5,
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 20),
          child: Row(
            children: [
              Icon(
                icon,
                size: width * .18,
                color: Colors.white,
              ),
              const SizedBox(
                width: 8,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: width * .65,
                    height: width * .07,
                    child: AutoSizeText(
                      title,
                      style: context.textStyles.textBold
                          .copyWith(color: Colors.white, fontSize: 24),
                      maxFontSize: 24,
                      minFontSize: 12,
                      overflow: TextOverflow.ellipsis,
                      maxLines: 1,
                    ),
                  ),
                  SizedBox(
                    width: width * .65,
                    height: width * .08,
                    child: AutoSizeText(
                      description,
                      style: context.textStyles.textLight
                          .copyWith(color: Colors.white, fontSize: 18),
                      textAlign: TextAlign.left,
                      overflow: TextOverflow.ellipsis,
                      minFontSize: 10,
                      maxLines: 2,
                    ),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
