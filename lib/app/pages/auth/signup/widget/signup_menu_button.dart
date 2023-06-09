// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';

import '../../../../core/ui/styles/colors_app.dart';
import '../../../../core/ui/styles/text_styles.dart';

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
      child: OutlinedButton(
        onPressed: onTap,
        style: OutlinedButton.styleFrom(
          side: BorderSide(
            color: color ?? ColorsApp.i.primary,
            width: 4,
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 24),
          child: Row(
            children: [
              Icon(
                icon,
                size: width * .18,
                color: color ?? ColorsApp.i.primary,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    style: context.textStyles.textBold
                        .copyWith(color: color ?? ColorsApp.i.primary),
                  ),
                  SizedBox(
                    width: width * .65,
                    child: Text(
                      description,
                      style: context.textStyles.textLight
                          .copyWith(color: color ?? ColorsApp.i.primary),
                      textAlign: TextAlign.center,
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
